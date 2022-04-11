Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E604FB790
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 11:35:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302766.516507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndqR0-0006Cd-P9; Mon, 11 Apr 2022 09:34:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302766.516507; Mon, 11 Apr 2022 09:34:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndqR0-00069Q-M1; Mon, 11 Apr 2022 09:34:10 +0000
Received: by outflank-mailman (input) for mailman id 302766;
 Mon, 11 Apr 2022 09:34:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1peA=UV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ndqQz-00069K-Ci
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 09:34:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88adf788-b97a-11ec-a405-831a346695d4;
 Mon, 11 Apr 2022 11:34:07 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-Jc6-WFooMp6Fz4mFDX6aMA-1; Mon, 11 Apr 2022 11:34:05 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB7PR04MB4764.eurprd04.prod.outlook.com (2603:10a6:10:15::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 09:34:04 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 09:34:04 +0000
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
X-Inumbo-ID: 88adf788-b97a-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649669647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vL+0lAdAy+jFrgQqabteiiHQd+v0n6xUZT0vrkZ128o=;
	b=kvlxTNf0QXpGKVmr4jmFZfxPwt0JBGRYLjnyi2UJ1wOBAGF11vglRN5tkW4U5laRvlQZXU
	GfjuKVUFOkLBX/oUdOUo6Gij8vgBFEmtqT6LtJB5JqNq8I52EBFmRShR3nArfF4HsE9RPa
	B71EYRWcVyxh6UFPzBsz0or4o5euqfw=
X-MC-Unique: Jc6-WFooMp6Fz4mFDX6aMA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jIFr02GdJSiIq2zjPGGBcxbGQSXPQrVoRVDzNrgVMFzs+kri7ZTdFXDqpxnyc+Vb0DwZZ6eJ9Zs8aH2ReG9Xt2/UYhNsgb16PqPtT9VNmjCx9xOZgBvGtYV5HuUkUFmQ03GWxh1EOnD2yrGaXJKEtzJPz8/9cAfJtEE8MIGvqHDAJ3tF/w4kkDQt+9WeJsGHCFJlREYuHIQIQogrpgAxanJrsJ8utYHGm2xn9qc9KCplUevuOSrBFmgdjbxiI3pUjpSq+Uryny1AjstsOs8WrZDMZvfEI280TfCyGKWc0I1hmy+F3eWlcdcwfiOgwotbhFMHF3NRD2vLyuit+ChM3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vL+0lAdAy+jFrgQqabteiiHQd+v0n6xUZT0vrkZ128o=;
 b=cEfd7nlA9zmMBifiyco3Y52mX9kmeBPPHIt5xINOhOcgb+NtDnOAFFPFRIJGWdYim7joUhjhz4cm4dr70BDuTXbeQ5Y8iD+em/wbXkim/6vBj+zOqEZVq13dnxzs48X5HqM54MLYhT2EBRBTwoNLGy4a1VIMpXJBuK5c5gDs4lG/987c36XHJyt589xu7R1DxekHYtsnbQat1dSTl4/JvSx0yxQ3K35rVpW9JNcys/0PV0RJtqAawQS6PEHK+1tUfvVOACqh4KILHoZvEy4qN/rhqS4X9yPCVuU/AWp7F/padyvDgvZljHA3Uo69cz7yAYrY6bWN6dYjqc5VfsGF0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
Date: Mon, 11 Apr 2022 11:34:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/8] IOMMU: assorted follow-on to XSA-400
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0077.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::13) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a62e83a-81d7-4b46-1b28-08da1b9e6aef
X-MS-TrafficTypeDiagnostic: DB7PR04MB4764:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB4764A8AEA37ED4EDE0DBE2AFB3EA9@DB7PR04MB4764.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uTQKii6+2FUFBb1/t6GLTyEfTusNGoIj3qHGnQ00iCiNLbFacOjW3FfO5cL6oo4NMyVt9j+grC+NrCCA9DHMz0XsJ40a76yIgdr07lSSMrrEjyCrqKQmDaSSR3Ye3vM++DRnIL9d23bwKaJScqy7tU3JWhAImbzvCYs9UNYZntnllq8SeZBH/fagvdMf50X3HHHqiOhhzGlg5Ia/YmrBiv/s/PQoUdryP8/hSpo8DnQKdTOoD+v93Dds2bso2rwhTm5QijAOgzhTgZGoByeZwJ6h8++VVR7MUkLal5N6UelAxb0IGXIElx+zkmBe8Q+gNsfObN6eNRCkJWrAfrxVbxk9QXqf0dtsHm88GbKBmAM4/zwQsh2uZPYxHwUArEU9Dl9IsYQMaFamSQXT6ga9XF5FynK208FPQ1c3WmfknmBRbYVFjFUcBaK+q+3Bhm9+AEbyjcCIxOMh4AkiTjCm8eN5Shax1N0Subjf+vejaAzuS96flASJ7DtUDAYQI99VvvkUsIumuB3//nY3y21MiyKZQ3iQB7Ut2Fa9eI5I2ynL/nmQFI3t9RodTj46wiWYFy7r2AjmAWRbx5CErcG5Dih3wC3WNvGxY5Xw3QC8pw15fVS/vYF3/pSuWu1hox0+EUEUxc0uNeDo/ptmdQcvGMOuKT3X+nnOO2wk6TzUB8pTnBVBHUV/600d45BqP/XQL5Qf30rSMUK+KC9qQANPutwrvDWhT2LAFevnANvLOIQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(8676002)(66556008)(66476007)(66946007)(31696002)(4326008)(8936002)(508600001)(2906002)(2616005)(4744005)(6486002)(86362001)(6512007)(6506007)(31686004)(316002)(38100700002)(6916009)(54906003)(26005)(36756003)(186003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVhZanNOYzFZVGtUbHZUeCsxaENUdStSQUptY3FvdUt5UndBSHExNVJPaFNO?=
 =?utf-8?B?cHVvcmZicFExdXcvUTBadCtKU2hqc3R0SnZpLzgzZkNpVjlsRzltY205VGk2?=
 =?utf-8?B?RE1qMXpJcHZFUWEzUkN5aElSV2F3dHlCSVRxTXZRSWRZRlZ0SC9peGdGbFl0?=
 =?utf-8?B?UlZpaGlyQ2o3U2MvQldmQjhpWkRlWDlveGZMQUxGbDJyaHNieHdSZDNxRUEr?=
 =?utf-8?B?QS92bDMrTHZWaTNoM3RTbE83M0ljOEhPQXVGNEttamtXaFRpWjBUWjlRR0x3?=
 =?utf-8?B?clpQclNYeFJycHdNS2tXNSs3a0pUbHdwSjhFQXAxTmVXaEQ1S0N1K3hUbFA4?=
 =?utf-8?B?QXEzNW16Z3cvanAvdmdIUm5XNzc1SVdVZ2dpcWhEd0lCQlJTV0hzMVBjOVQw?=
 =?utf-8?B?YWdDNjlab00xc2RmMmIvRm94bWhRWGt4Rk5Lak90blBVK01ramVYc05JM2ZT?=
 =?utf-8?B?ckRmQ3ZkNDNFV2s0c0tXM2ZqYm5MOTRYOWhrLzVFc2RKTTFkT2sxWUxlNmhn?=
 =?utf-8?B?RklOUG5FZStrVWx5VlBJTDhIb2dLSTZWL25SMXBWQ3Z0Mm1qbS9VRTlGL2VB?=
 =?utf-8?B?ZU5pajM5WDQxaE9WTGxWU29jdExrTXppYXZiZ2wzZ3BCNlBOTC9xMGtQaHZt?=
 =?utf-8?B?NDV6OUdCaWJUUzNLajlsdnB2UTNLMU9waVQyNHd3T0g5Wjlrc2ZoT2lTM0la?=
 =?utf-8?B?UmNYWXFwWEMxV3EvWkpUNEQwWFcrNW92M2orU205NXpCbk8wN0UvMm5iTjNh?=
 =?utf-8?B?eGlQY1dlbTg2dko5b2RtclI3c3lpYlI1Y1pwbU1KSU5QWm45cWgrK09FYk82?=
 =?utf-8?B?U1ZGdkdRRU14Y3Bsbk9nbVpWeTRzVmc1MFBUTFlXZ21PdjVaYUFiTTM0TzdB?=
 =?utf-8?B?cWVYZ0NvSFNzZVliOXBHTDdzRjJCQnh4cGlST2N0ZjNqeWFsZUx5RmV1Y25u?=
 =?utf-8?B?dXFqeGFXcWdxSlMwd3ByRGE5NGMxQkpldzJVZzgrcklkRnprM2ZQc3djYzht?=
 =?utf-8?B?anFpY1NHaUJzNnVUbUZaWTRIcDkrWlkxRjVHSHE2QmxlWGtFNmx2NmJLMWpT?=
 =?utf-8?B?WmZ1Tms0WTd1eEo0bjFYUUp0R3RqKzdSbGpaY3FaeFoyc3RlZkFZN0c4ZjZZ?=
 =?utf-8?B?Ykh6Q1pGL0VjaW5Obm5aR1V3dEtXcGlYQUVEMHNldDNpRDZXU1B2bXd0ampm?=
 =?utf-8?B?T2lWOTJDdGt4azdvYlNOek9LVFdNUlFFb3pEelBEelpVTDBOeVU3TWFMRThP?=
 =?utf-8?B?YnNFR2tRSE1PeFl2R0NGMGdJbzZKTEZXeFFUcnJ3NFFUbmlOZEV2SnNhMlhZ?=
 =?utf-8?B?T09DV1lOaHJaa2R2M2J1UWRpalZpOXgrNnZ5RjVQZng2YlFBcEJkU2l0ZXhU?=
 =?utf-8?B?NmZSSitUZk9WVmJIY08vSXRCV0gvSS81NWU3cWZSd0Y5MW94TEJ2Y1FSb2I0?=
 =?utf-8?B?amdpMkFtYWhxZEJQSkVINEFCd3hpR3hKemdsZ0NpRWR0T0F0NzcwR0lXVERv?=
 =?utf-8?B?Y0NaNDdTZndmL09iMjlxZEdOZTlQSGhGOUVVL0E1em9XWmhFSHk5VDYwUEJU?=
 =?utf-8?B?ZUhuclBBKzBmWnlGUzlLcy8xNFJKMTF2MlVCNmtVRHBHM0dMbmhKK0VBTERo?=
 =?utf-8?B?UXNjZm1QL09tTE83bnU0V0NJTUFUWnhrbWt6dXdvY2VTUjlGODJrMFd5elAv?=
 =?utf-8?B?cXNmcmo3Z0pKVytnNTNSYzFzZmMrd0lFRFhrRm9EcXU5R2FxVFo0c1dVUDF4?=
 =?utf-8?B?T1N0aTJ5ZDR6R2k4T1hZemdacU5QRDRLOTRHUmZ0eWxFYzZOOUpiSXplT1Zk?=
 =?utf-8?B?WWMvelJOSG51SjJrSDN2MkJHQjVob21LS0JXaXlDVlZZTVlMbzdqM2dBRG1C?=
 =?utf-8?B?Nk5ZZUgzMmdWR1g2dkJabFhudjhGMUUweW1RM2R1MWQzallvdWhSdk9GenBn?=
 =?utf-8?B?ZUxoSnZxVTRVU0M5ZHFHam1zR3ZoRjYyTy9iS0hCcUhHUkNwZWhzSlVyVUg4?=
 =?utf-8?B?NEo4TTByNXBXRHZCTU96S2tod2xBblQ2Q1kxbXpPQjZkU0phQWgvdlljVmNl?=
 =?utf-8?B?d3cxekRGK3d2OStiU0JyQjNRT3dzZ0g2UXQwSFdFYi9QTG54VlM2MEs1TkZS?=
 =?utf-8?B?cVBmaUJaWjJBdDk5RXlIQ2VQOS9SZlphL0xBR0JHaGpWdXoyeTkrOXZyaU11?=
 =?utf-8?B?NFBtelU4RXlobEVPLzRQRFUrVWVxUmdsY3hLRG8zRXpyMUFVclpnQUo4UG1w?=
 =?utf-8?B?dnhvSEEvTXMweXlXb3YvbGxYZ1FrQmNHTFdGcTExeCtVcit6WTlSNHlKNmV1?=
 =?utf-8?B?ZFEyUjREc3IycFg0V1NQUEF0Umc2cGFQV1JIcG1lOG9mcGwxQlphdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a62e83a-81d7-4b46-1b28-08da1b9e6aef
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 09:34:04.0758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +HjWK3pcT5yKNO/T+y8ie7ZZZPk2Ykq9rgRvtTnnKJ5XxSEp0O5K7Jk2KcwiWy0px2MM/zfa/lgxjhS+yheAFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4764

Considering how long it took to get the XSA-400 series ready, it is
probably quite natural that in the course of doing so some further
items were found which want dealing with. There we go ...

1: IOMMU/x86: drop locking from quarantine_init() hooks
2: VT-d: drop ROOT_ENTRY_NR
3: VT-d: plug memory leaks in iommu_alloc()
4: VT-d: refuse to use IOMMU with reserved CAP.ND value
5: AMD/IOMMU: replace a few PCI_BDF2()
6: IOMMU: log appropriate SBDF
7: PCI: replace stray uses of PCI_{DEVFN,BDF}2()
8: PCI: replace "secondary" flavors of PCI_{DEVFN,BDF,SBDF}()

Jan


