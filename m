Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B51B13F71BD
	for <lists+xen-devel@lfdr.de>; Wed, 25 Aug 2021 11:32:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171850.313573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIpFw-0004vP-J5; Wed, 25 Aug 2021 09:31:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171850.313573; Wed, 25 Aug 2021 09:31:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIpFw-0004tU-Fo; Wed, 25 Aug 2021 09:31:36 +0000
Received: by outflank-mailman (input) for mailman id 171850;
 Wed, 25 Aug 2021 09:31:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5IQt=NQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIpFv-0004tO-Bu
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 09:31:35 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36b867f1-ac9f-436c-a4bf-1f28b1a6c7ef;
 Wed, 25 Aug 2021 09:31:34 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-26-_cAQEzJXPlGWfaoD0Ihshw-1; Wed, 25 Aug 2021 11:31:31 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Wed, 25 Aug
 2021 09:31:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 09:31:31 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR10CA0125.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Wed, 25 Aug 2021 09:31:30 +0000
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
X-Inumbo-ID: 36b867f1-ac9f-436c-a4bf-1f28b1a6c7ef
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629883893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3wL5NfZbDuJQwcfOKv7jDO/hZ9T1xH/xY8hlcSucT28=;
	b=XuPAGmlj0TsAZ8zYTDjVYOeItiMqarCEfNTYqB/lzL+5gE0tXilBNKCMX1YCn1C8QfAgjd
	ladroZQAyb0bX0kpBHBys35yoFYeeSNcWHKyf3sPr7QoohiS+BDBfZa+CKV+7YISuF2ql9
	l8OPFxyQvbd/FV/3DwMwCH4Ag5ve7ic=
X-MC-Unique: _cAQEzJXPlGWfaoD0Ihshw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z7QoQMONZ+xopcz4P3JpkZtC/Ef3hO9JUrU6+ZpWGS8HDkzqKjMRVFFikiNIFXYPBKUla+ZjwCtQvWO+t7MvitX2QP5vAb6ufFDNxj5KYH2R3HoPZ8+WXgWZ+6JaEYo/yl3LaGGGw+36JZrMdDoc3xBaW6Pg/NOqEWVQC2yy6ydKD31ayNmz9rA4mRGylkKicn1HgFJmuFhHyZVx84up8p+L2oDWXinoU0mZX7SrdpfGRjvk0GOH4gBekS1G2lZyPCguX69PtZEL0gmEOiJZdg35DWSNa9wKULsfmviEMrQsNatOYjxPHdPXgsFxF/hXQDdPJCMb5uU/aSUk5/OVeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3wL5NfZbDuJQwcfOKv7jDO/hZ9T1xH/xY8hlcSucT28=;
 b=b8VeEVMyz9GxERsWrOigHwnRyxlbtX1TX7B/FBUgTShuBgNriRQlP/FA8u6Yv7GOJ/YD3TkXD9+ITyw0tsHFlkH1G0gQE15gDC4fSxK/BWLi8scki8q985o5hY1zioizZh7w9bBJEXzW2KrGw/8Z8ndD7lHwLcallimJIWjiwLCtMXJnJoPuuqq55WtRozK5BQksC347cn/Q3RbLowhq0IQ1pv+LRpV3AxYLRsRLo3U6dG/jnYKi1yV/4Who/kKEtcuVtwxbIMPcVZIzA6PstXWLHEftnb2yFFB0BbdCKkOwmgQs8sNEMA0QrdYK7VJ1g/zsKKhsv0D66j58grO1Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/altp2m: don't consider "active" when enabling failed
Message-ID: <f0de7945-84df-8668-f94a-c15cd5196be3@suse.com>
Date: Wed, 25 Aug 2021 11:31:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0125.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::42) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4338009-9302-4b07-5c38-08d967ab1f2e
X-MS-TrafficTypeDiagnostic: VI1PR04MB7150:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB71502FCDDE96BBDFE4D3AF60B3C69@VI1PR04MB7150.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KBGSk70NcSwEx03hmUd9RgWhhut95lg2k7i/LpFs43KIKqv6Eorp6BNqUXzF3bvt7LIw4m1PCmE3+94GL+57A0BVrdpPsESvhOU+2cbrM3EMPIdk9Iq34M+/31bvhZCABbgLhyAQHfgO6sUg/ANPZ3GrAWnRfQ80I7BqT3CTKIJ43IFInM18eWVDdMlTx36Zgp/pdeWX/H4dVcvYNejx52nzr7R4zqgvNOp4vBPm4Hs3NOCgdzxhQUQqKkDuIETY5QMPgjuBkEww5q8uL8JPhX2HXP4gn9+KETAxcIyyhSahMs2BsOxYrSSl8oqsmttbYJLdlF5FMcmit+QsQP+2TWgQws235S9xOGVWRe3VRB/Z10xQAVOaheX7lhpMNg+dt5E/EcoBu4sS19NxiOv/icoSZWW8FNKFd+8OD4f78mObLq1Y63ly37LCQnoE5ZEWV4Au5Mok9BgvTahOezQDfwVRqMmNZ+xYzdx8TGY1FfKM/koT/IaXnP1XxGqnVGKoRkvCAmVxi9R1ujONTXia6XxeEptgLDL8OgqqrA5L/GPvprqTNV63QIXrpTwYVRKqxVuTzw8niEAfqXbIwuAbrQBZKrlNMCylTdwmspjZcXIMLIxcJOMYnkrXjw3H+ds6uMTKky2A/47imh3hR/f9xqPw/kWG3hXYSXhwObpirIpoHS8xPH40QxmXA0rwByNRSvNyBl+LfgFxZ8hod9+vVZwqXwaciOS3Z8T2gL+jVPE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(39860400002)(136003)(366004)(376002)(83380400001)(8676002)(8936002)(6916009)(31696002)(54906003)(316002)(38100700002)(4326008)(16576012)(186003)(478600001)(956004)(2616005)(66946007)(66476007)(2906002)(66556008)(31686004)(6486002)(36756003)(5660300002)(4744005)(86362001)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2hRVnk3SVJxMEFoRXJsM2h4c0ljWjdWdk93V0luR29DZitSZ1p5YjNzZ3h2?=
 =?utf-8?B?UGdMQlBVbFJQTXFjMitzelJoQUVjQ2MxTnZXUndjcWlMdGRjZTVPay9pZ1pz?=
 =?utf-8?B?RDhzbUZxN0R5d1dCMXErekJIMzI5cXBRdmhzbmFaTmNuM2Zpbmd3UWw0RFVD?=
 =?utf-8?B?VnhDTkhYQWdsb0s3cWNRSjNrN0ppT1JTOUx3cTZMOFNlUFdxYmp0VnNSN3NZ?=
 =?utf-8?B?NVA5d1lZY1VqNlVEYit4VkdXYXdtZVlrWGRzQXhxOFVhNWhZZVBvamlwcnZC?=
 =?utf-8?B?Rk5TeEphWGdsckNMVXVueis0bzV4aHIzKytaRVYvYmhsT0k3VHRjQ3dlNkxa?=
 =?utf-8?B?bWpONEMvOWFqRS9aVkN2OGhNSFFNM1VGUjVlaDh1VjE5YitESml6L0FrREls?=
 =?utf-8?B?Rk1zZmxOL3dxakQ5OUZvcTllc0ROb3oyR0tvM0ZDV3F4TkRVSG1rS3J2Mmpp?=
 =?utf-8?B?RVl3YUZqem5DZmI3MnBZY1R0Nysrb296Z2RRaFdlaW0wQ0VIR1R4cnhqdEYv?=
 =?utf-8?B?QTRKd0g1Yktad012dE44VUxvdlRaWGRJRjM4KzV5UWdwRTlEcGNzRSt5YUIv?=
 =?utf-8?B?bmxzdFVoSXU0SytIL0ZSRnFGY2lpZnpRYjBjUEhsT2V2SUtLamVUSEYzeHp0?=
 =?utf-8?B?Mm16ZGhJUGs1dXMwdVpJNTBjbHNrSGtncmw0RjVjY3MvTm8yMUxuNWF1aVpo?=
 =?utf-8?B?TWZva0ZMbW04UkQ2N0kveExhVlVZa0grTWZBbUhSVC9SUEg5eGJMdG5xc2VY?=
 =?utf-8?B?aC9ZSjQrdWJDY0E5SmlDTURGTUh2RENTYU9leHVpejdObG00T1VZNDBWS0RM?=
 =?utf-8?B?V0E0UDNwbkZmUkIyMkZUZkRjaHBzT3ZlbzFzT2VHQSs2VGRBekxWL1JFWTBv?=
 =?utf-8?B?dmt3QmZyVDZnaHpKSEFFemJwQ2NxU01FcVBjYm01SGY2YXRJOFVvVVRaL0w2?=
 =?utf-8?B?L09oMWc4TEh0dUNobEVvMFRxcHlvL1duV0k2U1VqaERxTy9TNktKckNlaHpr?=
 =?utf-8?B?TFFuWUY0YndzMlpRSFErWDQrVmpUdHYvdFNjeTVUUWkyaUR4OTRienlMcWtx?=
 =?utf-8?B?M3A3Y3lZQklvUldiWUNMK2NDbGl1RnVYOFF0WUtvRG1TU05oZ3UxY1RGdWVZ?=
 =?utf-8?B?eE9NLytvNEhFMjNHMmZ6MUQwdVQ3S1poZUxaQStWWkV0U3I5Q3dqazV0bjJZ?=
 =?utf-8?B?eWVwcENtbHRVMHdJaXVDUVR1WmZnNWRONEJoL05sWjBvZ0JBc0UwbzNOVnVi?=
 =?utf-8?B?bTFQeHFqL1BwM3pWazVKeDhtOGZrbG82ZFIyNFJMRXRGTHZSK2pyWWNxcUtQ?=
 =?utf-8?B?a2NCSEl1b2trVU1YRFVEeW5VRW9QYThoSlVERUtkeGtTUGZZTWdsZGlYVUll?=
 =?utf-8?B?L0lRbHFPU1kyNGg5RmZXNnZ2Z1k2QUx0VEltejA4a3p1QUpVaitIOHpFNjB3?=
 =?utf-8?B?YnBuRkd4VUFRbm1sbWZsWHhqeHIzZFFWeVZUUllBaWpFZUhudjlLZWdxKzVx?=
 =?utf-8?B?eHJNRGswbno2emdjQ25JOWhaSWQyNXY2Mk1oMTFQckVlQXdCMFU1dlAzZWFV?=
 =?utf-8?B?WURxVUlxbTRGV3lpcDZIU3BZdWVwQjFSeFFYeEF4MnUwTG16THBSTlg4ZzJ4?=
 =?utf-8?B?SWVsclBwZ2xHOC81N25ZS2R1Tkl2VnpqK3VLdk9uSTVHQlptYklkM0hlNkNm?=
 =?utf-8?B?czFoSFYxNFlNTzVLMDdzeGZmRENUM0FUaFoxZm41cytBSWkrUE52cWl1M3Nv?=
 =?utf-8?Q?qBJAd0lBBHsBRDCWSbnePLGUKVf8KAgeGQmGEwF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4338009-9302-4b07-5c38-08d967ab1f2e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 09:31:31.0685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fwFN0DNPnExOu051qFhlB0t3e6pXveT5INq2NIPcWG6Hrk+C7svuXIb9ZEGuETAjdGvfuq+Jqvu7faF7WMEetw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

We should not rely on guests to not use altp2m after reporting failure
of HVMOP_altp2m_set_domain_state to them. Set "active" back to false in
this case.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4609,6 +4609,8 @@ static int do_altp2m_op(
             if ( ostate )
                 p2m_flush_altp2m(d);
         }
+        else if ( rc )
+            d->arch.altp2m_active = false;
 
         domain_unpause_except_self(d);
         break;


