Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 308804EBC42
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 10:03:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296079.503967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZTIW-0006hL-0g; Wed, 30 Mar 2022 08:03:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296079.503967; Wed, 30 Mar 2022 08:03:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZTIV-0006eG-Sz; Wed, 30 Mar 2022 08:03:19 +0000
Received: by outflank-mailman (input) for mailman id 296079;
 Wed, 30 Mar 2022 08:03:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b505=UJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZTIV-0006eA-0A
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 08:03:19 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db4987aa-afff-11ec-a405-831a346695d4;
 Wed, 30 Mar 2022 10:03:17 +0200 (CEST)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2056.outbound.protection.outlook.com [104.47.10.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-EwO9z23ZOCi9zrpb22lDsQ-1; Wed, 30 Mar 2022 10:03:14 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by PAXPR04MB8272.eurprd04.prod.outlook.com (2603:10a6:102:1c1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Wed, 30 Mar
 2022 08:03:13 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.019; Wed, 30 Mar 2022
 08:03:13 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: db4987aa-afff-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648627397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=19fw190Rlq8J0IAtb64UF2ef5nBuRCtZhBBySpjPYDg=;
	b=SzxOVIgb7sSpQbaPdFYB5eI2FxTULD5hvlx88qY5NHcc8GuezXhDTaf2YfJ75ZMRcZbCy1
	AZE+bZKYBuEBVMCy83Oxf7YfN4YqlwAsh5F190NCrhtOMX5Ye1/zkGXyYr7f5jNiMnnI+e
	PdXMAjn8RIzBp9qkLy935dODZqeI8kU=
X-MC-Unique: EwO9z23ZOCi9zrpb22lDsQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFg/8FLRNtObBkiKtu/WGm2RQ/egNRQtuIwnubNKEhEKS9sGmae7b+6VIJE9Uh69SL97r2eDYoDT4FCKhcpEx3re/Y9nwaAOxHNoxCPpq+LdLTXwSux3xscn6MA95U/wOCJntMmeXGKKMjDWyT+kd5PMM/mQyph9tfDY6b7Z6ruV9ILgQDwRMVeSJYdoQmCrsx5gDxVm9qEzbyoZwCjkg+TkuyuhIxMlsRKNwCy0eoBP7Y2a//4IWBRHtSMqGQj4JSrdMIOiQ2pekc/R1CyL/921STrLsDDWG0AM3KYwB+WMEQI3S9JR64KKf9LKQd9D3cTL4+1QOWWhscjn91MJSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=19fw190Rlq8J0IAtb64UF2ef5nBuRCtZhBBySpjPYDg=;
 b=M7fStqI0IwmnIqxGPjmdCl1hwoVMgJEmGKdMHhbEle5DsJ+uRGTlyzlcym/K7Lu2R23GgmgHCGMTqRnIQDjhGHQpoG2sFTMbl1+U/c/n+O+odfBUoo6yI0ReMr0VjyPeAOGQxDb5jGowPaHcDqY4DfsyR8b8XSchze4fXsQCd+WkdRH7amn4heDbxG9RajdMmf+sKn1rcU/mVedwwG9NmzuVY9Zzv5HPIG6bV68nAocQM88fTQlPkytv33GWKfYByRNXoRh7Ln7yzl3UQRgg5CvQomw6DwIxP/C8GDmN/aOeqDBm4TAVufQ5ZUeWQ6lDY6KuJ/PkPRnAawqfSQ49Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2df6d890-9d91-62cc-8057-3d50f1501ad5@suse.com>
Date: Wed, 30 Mar 2022 10:03:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] livepatch: account for patch offset when applying NOP patch
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::18) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6753f518-18a6-49e7-c785-08da1223bd09
X-MS-TrafficTypeDiagnostic: PAXPR04MB8272:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB8272F61864726FEB09FB0FDEB31F9@PAXPR04MB8272.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vwMdhiVEt1L0ScBGOHds7Kw8sksIEnf4iM+5Mb1xX33UNaGSuHufwSUVbHKg8aBFkm0TaR1SsK3ctuPztmtHChr5V9ZRBIgpZjOJXOLjbcpnCDd1mEemfaWGmjGdxBc1zMb33Opw2LAFzFi47JBwGrzzqZuwOdHig8SRk6PxNIZ3dE/nbqtBucUWqsWlzYCBnhyHLVQRbI+01y8JhUHx8PinM1z77jOxG3eX5OxeSzcEGUzpgnNmLmyN1KdnljQG+mYCb0gXIeJ6DD4/Km8t3zHwFZP2TPdqu+Cf+v9oTnOVAws/NA4SsxPjkR2mW86MoGZeXo+d0YVjUgfKPYjm5UxLdt0zQHfesQoc3hR+AsfJOTgQXlvdyjuemhCKzBjyxcplfDDkPxTbUX90Y6trBwc9CTjxfw2KrlronnL9EI67mtHXZ7s+1/UmnpS0K+syTEOA7QS8b2hgw/J7Aq9hYub+RoLoIHMgagXgJ4FhsViV6KWO8UZuVySbLv+UU20U8ynrSjRKkhvWGvL4Qn+GaZvgL2EWQYnV21352lcssC+YNVxWF53Ez0ftFgn97UkO59pFypbH/cmen+en0TWYD33eGb1I+T90V1vRUJ2WR9G00f+e/PXtk//o6hAQAmyJDZvGnsq0V2apSHxgwhlZ376XIcScp+q7q0n3GlfaOsi0alXn60VQtzHC8VFQV/lpah8840co5ktRq+/e6RUBfN7qUpU4qWLCaRUfzC6v8LQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(38100700002)(4744005)(5660300002)(508600001)(8936002)(26005)(15650500001)(186003)(2906002)(6486002)(31686004)(54906003)(6916009)(316002)(31696002)(6512007)(86362001)(6506007)(66946007)(66556008)(66476007)(4326008)(8676002)(2616005)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFdNQWx2aWw5bjJqMDRYQlRUdnUzTHBLRXZ2Zk9rZ3pmY0dwMUt1U2RzTVc2?=
 =?utf-8?B?bVhzVkJtOGVxTnN6cDZuajY4VEZsOVlPQVoyOE9JcXZWbTcyWVV4V1R3MXJE?=
 =?utf-8?B?SE50SEJJK3pCVnBMMjRCL3ZjQmZ5ZjBvOE5JZDRGd0VIOWdzWVFMUHcwaWtj?=
 =?utf-8?B?QVRmbWtYMENnQk0rY2hRZGpVa1Bkbm9LWkF3cGhpZ29VaFJJdStrVy9IS2t3?=
 =?utf-8?B?cmJLZzFFdzhqdFpCRVZPVlU2Yy81TFk4MzNiRXY5b1RyVGdJUUZzS3ZwenlS?=
 =?utf-8?B?aXdPaTRlSE1uYkNnYitzSHFBOTNIUGpZWTN6dFNLNWg5ZVh6aTBsUTNuNG1z?=
 =?utf-8?B?U2N0UzdzTzZuZDJBZnNaV251ekpZeU1yMEwzemc2b0RTQlVoQm5vdDF4TjJm?=
 =?utf-8?B?by80UWRqSkdNdytHVG1LY2xvSzVXOE91M3NsQVN6MUEvdDVrWFdNMVpaWE9k?=
 =?utf-8?B?VTBhNUFIeW9WUFNGNjdyZW1RM2ZScmRmaXFKeUlqaHB5SDlBNFB4ZXJxMWc3?=
 =?utf-8?B?V1B2NTNUZ0NPZC80M1JuaEx4RlRQRm9FRFdBM2dtRUVBaVFDUXgrRXo3UFBT?=
 =?utf-8?B?bEZrRTVMeEJ1MmZXS3hFTFF0eFhuMGx5KzgyN3Z2bE4xOFR1bExTc2xoRHNx?=
 =?utf-8?B?RDhmaDVjQUJLbmFXeHRBdGZsNVZMVHd2bDV1RS8vdXBiYVpjSElvZVMvTDhN?=
 =?utf-8?B?ZlJtVmY3dHBJWHBEYS81MmlHcjhUL083NUk0VkhlSUZkQ2IvWDNzWklKZEJE?=
 =?utf-8?B?dnhOejg4cG1kOUwvNEdsZjQ2NngwbTRSM3I1bTFHQ0VSSXRSc2hMWk1NR25R?=
 =?utf-8?B?Y2o5dTFyRkR6YWc1U3VhS0tMckFjejlQSkZxSkU5a2lJWFZBamoxaysrWXRN?=
 =?utf-8?B?T0lzVlhjZWtzY1dVY0FycXlDYzcwNGF5NDQyUnpVc2lUUWJYNVdaYlFzZS9w?=
 =?utf-8?B?Z3VTUjFvNGlyUjA0akwwaUtUelZVN2xqeUdEY21ob2pVbkZwOTNWWjZ6UFpG?=
 =?utf-8?B?dUM0d2F4OVhuYkZXNTlLU09aK3l5SVhQYUhHVjAwK2NBQ3dZR3gzV2taRHRG?=
 =?utf-8?B?WHRVeVlzNWNNZXdpSUJBeVdLL2R5TDBZUnZQYy9NVUl3MEZEUkJoQlNaMnZL?=
 =?utf-8?B?dzV5RHhHY0FKVU5MZTB4WU9EekVqM2tyNkM1OXVsQTlxdU54dlhXZW1pbFFQ?=
 =?utf-8?B?OGwzTGU2SVo2Sk9mRTdiOWJZSXVSQmxTSEUrY2ovczZtcW9RZTJyblBWSmRh?=
 =?utf-8?B?U24zb25tbDNjdzhIbUhkUEJIODZDWjdEdEF3dVE0azN6UHlURC9CbWFWdEtT?=
 =?utf-8?B?MThIWWxXTkJNd2V4eDNjL2hNUkxJTnlyTko4ZUQwN0lLT0pVY0RKaC9JVEdM?=
 =?utf-8?B?ODZjMHNiRWdEbDBoeUhNcXZoZGVxOE1vakRDNkxFVHFZVWVWZ1Fhc3ZaSkxw?=
 =?utf-8?B?UnhRanNBbk1MOU5KQ3QxRjhPWjNLSzh5aTFWMFdYWVM5V2lEcFRWQk9rdzF1?=
 =?utf-8?B?OHJJc2xYQmJ0R3FlWXdPUlNOSjg1ZjdBZU5QREI5UWtxNFRXajhoMy9zanBw?=
 =?utf-8?B?N1JrV1ZNNWFIYWwybXRKeGg5WitFVW1aTVpYclRMTlp4c21OYitCM1BUU3d0?=
 =?utf-8?B?L21IL1gxWk1kZEo0MC96cWV0SlBrSGpZYktaNi8rL1BNZk1vL3czUVZyTll0?=
 =?utf-8?B?SzRxVVMrVEV1cjZ2eXRibFFGbjBhQmM4K3Nic2k3RDNVNXFlb2FBLzFqVk1w?=
 =?utf-8?B?OEg2UitFbXJrQnRiaS9VZDM1Q0tLL2M4b01uL0ZWQmk2SGFnMjB1dW5mSWRh?=
 =?utf-8?B?eU1vUTNFSG9tZW1hRzFIajFFTHJsYzdOeWg1TTRweUFubGV6aXZLQUVWOVpr?=
 =?utf-8?B?dEFQdXBMaEU4MlF5SXl0WU9pOGJZVDJqbmFEYldJK29ER0lKcXI3dFNkR0JS?=
 =?utf-8?B?eFVHVUhHZWdRMUhXblpGeFF5d3FFREk1QmhTSFhoeEc0NzQ1cERjNVMybE9j?=
 =?utf-8?B?dGpXemEyakZKUmh6ZG1lelJTdHF0NkRkOGpEUndvZlZiUnIzYTFUczc1aHI1?=
 =?utf-8?B?QXFJYjRiMU90b2xwSENEZVZieE9QRWFndm1WUjhRNGxJa01kUnR4cFVZeWEr?=
 =?utf-8?B?WHVUNDFQTVVjMTEwR0ZqazJNNHVjMThQSjFyMkgxRjBBMS9oTCtxRmNya3Yw?=
 =?utf-8?B?TDk2RkdETjJ6eS9ZZzR1RS9LQy9qRkxQNmhLa1RsdFF0TVdsUUI0Qm9WUGRS?=
 =?utf-8?B?TTZlTExTQ2FMY2w2ems3VzRzQjhBTVFJYVNOTHFkODZQSmtMT0NwaE5qNlpW?=
 =?utf-8?B?UW5vcGpIL0RwV1ZJOXgxSHVpRU00cVd5c0dtSWN0UzlLemVRQmg4Zz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6753f518-18a6-49e7-c785-08da1223bd09
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 08:03:13.2286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4QMHk/tB/WqJHJtAXPHmKkAabcVFJpBg5aK+htUdGt9dhbVdIsaXx2DClZ5IxfYdVv3XMprwswAunXBSv/MRTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8272

While not triggered by the trivial xen_nop in-tree patch on
staging/master, that patch exposes a problem on the stable trees, where
all functions have ENDBR inserted. When NOP-ing out a range, we need to
account for this. Handle this right in livepatch_insn_len().

Fixes: 6974c75180f1 ("xen/x86: Livepatch: support patching CET-enhanced functions")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Only build tested, as I don't have a live patching environment available.

For Arm this assumes that the patch_offset field starts out as zero; I
think we can make such an assumption, yet otoh on x86 explicit
initialization was added by the cited commit.

--- a/xen/include/xen/livepatch.h
+++ b/xen/include/xen/livepatch.h
@@ -90,7 +90,7 @@ static inline
 unsigned int livepatch_insn_len(const struct livepatch_func *func)
 {
     if ( !func->new_addr )
-        return func->new_size;
+        return func->new_size - func->patch_offset;
 
     return ARCH_PATCH_INSN_SIZE;
 }


