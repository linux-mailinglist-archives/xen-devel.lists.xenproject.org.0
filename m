Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E81C50FA5D
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 12:26:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313711.531416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njIOh-00015x-UG; Tue, 26 Apr 2022 10:26:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313711.531416; Tue, 26 Apr 2022 10:26:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njIOh-00013c-RH; Tue, 26 Apr 2022 10:26:19 +0000
Received: by outflank-mailman (input) for mailman id 313711;
 Tue, 26 Apr 2022 10:26:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njIOg-00013U-BN
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 10:26:18 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e52ba7e-c54b-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 12:26:17 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-znyZVbpfM7mJ5CTMB9ZfXA-2; Tue, 26 Apr 2022 12:26:14 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB6PR04MB3125.eurprd04.prod.outlook.com (2603:10a6:6:11::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 10:26:11 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 10:26:11 +0000
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
X-Inumbo-ID: 4e52ba7e-c54b-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650968776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Q+RLUWEAn0J5puyRnSo+x/9eyF00ihd4YhFDt3Vc+8=;
	b=mUyFmhOk4fRwoAHI29yxH4AnPwNJTKVTxDnrg7E2vW1MAqGwoj5SGHARK0lIKunBinZZzE
	Px8G8GGxjn3lKqb38my4X8fNsjuG5hULxW+pLiSl09VyRnhYIK85+zykHUKRs2SKyEKIjN
	7d/D84mNI9NlF7Tr9uQhh7U3SiEPnC0=
X-MC-Unique: znyZVbpfM7mJ5CTMB9ZfXA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GgkKastVMkpb9sCWYrpzUs8hIBXcmfMJY1IgiLFAUECLx7cXNkux2fzsJVYpyhSv/9wfII3cUJvBMoiFZMAqZNO3PLkRZyYw48iLLsM7iZredjIzbc/sWbde9rMxSda4p2qK5ErqpmXKIeRHiCCPMTc9Pk5CKu1c42x2EMmRLfT1Damf26VSDT5YTxsO62MM6z21dsBD1rWTgEze9Smiwvv/KI8EVEE96H+eDbbkTDk217PXZ1MmUFa80wjUv1rYkaet3fFd0pp+YLXZzI1Di6wofXMvMAatAlyMwqoD0nRziKvEl8XnRCkSJxLiin14sAOZAOWmwMksDdNW4B3H8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Q+RLUWEAn0J5puyRnSo+x/9eyF00ihd4YhFDt3Vc+8=;
 b=YPDtUrpoEll7gkLoHPBVssJsLGPy/RUGhqGxccva3WDKrEHHZ/AtGmCYiXe3E/6BqPY9JaXKTn59nXEXbCidGcMakxzhWjom96DpPR9MuU5Z7nYtYHquajnbdFYAIMHNbYD/60ox4vnwG+MszKMUcJgmZbwnyGFDf0L8hTXKlDSqF3J5/m2yOyl/tBaqyWFSHIbczeLKJ9SxGRKzAzVNsuF7PRIvGTTdMrr+ee40x3E2lZOQdT9vL1KpCymkaGdWxi6fuTVeCqJCjm5WrYVFJFit6NDmurRaD6/is3RwVkXAM6qFxrznkqRr/X75pjNbqQT6Pt3pRCezFEoffcRWhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d47d01dd-0289-370d-7b5e-bd80f9e0a911@suse.com>
Date: Tue, 26 Apr 2022 12:26:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH v3 7/8] x86/mm: update log-dirty bitmap when manipulating P2M
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>
References: <a0f019c5-4089-e19c-6041-044d6e93d80b@suse.com>
In-Reply-To: <a0f019c5-4089-e19c-6041-044d6e93d80b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0048.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::25) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14cec660-fa7f-4f18-a78f-08da276f2f2b
X-MS-TrafficTypeDiagnostic: DB6PR04MB3125:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB6PR04MB3125AFE5E4485EA1C852A9ACB3FB9@DB6PR04MB3125.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IsEWNuUjS6P44Mv8BTQy7Zm4YKSfUntqlej39dZoxTPjCs0qA2loKwWJs5kVsR++TpdX8CvRuJ8eB/kocoL1Ds5QAqtim7FmWuqH4gebhuIb9umeBYXr9UY9RA+LQTP9kWWERJLcX3bPEjvZDugUg+dur3mkMLpPt0HuDJlXy/lwO8Qvtl2UUeNCiLZaPJVMfFV5fdmMQV+BhTYvKgcdAbWW+Gr8fVB1Mc4WPT+uiN7xd6S24nPbzOw6jkDWt6n45kFVhMuie1d3SV+zocKOfBnn17UU5ez6iWOi6vhuZUeTYe6cpjT0r5lFEEp5wW6rxWjo6k5PAUrAR9iZ1FMTj7/TTezPHrOkaEHpkCECCSiO9BdvgAihmIoejFrHEPz5T/5ea8cMRn5TCUILWpZdrTxeo9IHFbRw2u/pXoY1XVGgyAO3NmAocR3fgfFf7+Sl9js2cd4PfNHdrOKXMkCK/26bo9itNCwBDPo2YSxQNEH2DDgIdjkRKc8WJuA2w/qp8Dv9tt2yzFGXHosWm7bP3oAAvULxuB0Nzmhfcy8kxYBcGZNgO4UZVkn2BqQg4Qd88/SIEnQGjoPh1DU1GdT0O7TauCi7e7PCWNHe9N8HQ9ufk1lJ0NzTSjFlvHIKGnPiegDRbW4AKydDtvxyppKzFLPjmDsntZPjI+AXj5UpqRfYRtMW4s6ckpk1Dn6WJDtW4gCYl5jiTAcSfYcrnD5xi6D67xbRVgfsitb31nTVxr/Lpr9iByphc9oZ8NWS6OvJX+y5WQfCsZ83UlVv+p8rZg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(66946007)(66556008)(86362001)(6486002)(6506007)(31696002)(5660300002)(15650500001)(6512007)(316002)(8936002)(26005)(186003)(8676002)(508600001)(66476007)(31686004)(4326008)(83380400001)(2616005)(36756003)(6916009)(54906003)(38100700002)(14143004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a09TSTBPRkJVY1p5dnRaY3ZRWFFYaWxRMjBrTjlHUEYreFREaTFkcWR4MW5B?=
 =?utf-8?B?eGxIbitxVW5KNnA5Szd5cHBuNHV5T1Rwd0xLUGtxc0todTJnZFNHdFlMdWxz?=
 =?utf-8?B?MDVJaHlrMHF5OTIzQmtKR2Jzc3dCb2grUjE2R0poaVZ4aTh1QndYVU5neWRP?=
 =?utf-8?B?NVdzTkJ1M1oxbVRlNmJWdlRiSTFXSXh5WnlhWkkvK3FxYUZkV1NjUVg3Wktz?=
 =?utf-8?B?WWhzcVpEOUpaa3FvajNXbHVtdlJHYXNqeExKWWNoMk5udmh5cytVTEM2bGcv?=
 =?utf-8?B?bms5M3FXc3FFUTVzWWFrRmFWakk0eE1LZmpwR1FjYnRJZGVHVWc1dXFQdFlI?=
 =?utf-8?B?a3FkK1VubFFPbU1HcGtLTVRrVHMxd05SNnI0bmJqOVdQWXVQSkFKb0Q1ZFl2?=
 =?utf-8?B?cFhRczdxaXhRV1k0UW1BZFhmaDAwWUVvTTNxSm91SWl6ajl6dU82a1lwSkpI?=
 =?utf-8?B?TFBZMnYwVk1wMEZlV0xkWDZ1MERTOGpKSFpRV1hxVjFJTEhYdGo2T2RUZFZQ?=
 =?utf-8?B?WDBJaWVyeHBreWNhTjFqb1ZxQkx2Mlp6K1BFMS9FbzVJbGVmamlaajNVWjlt?=
 =?utf-8?B?ak9FcGkwMlp1b3BXZFpHTEpqK3E3UnBoVGFOaFp4MUN4UjRtc3RoNDlhYm51?=
 =?utf-8?B?R3djT0dTUnlLaVF0OGd4eFBSZUVVT2xSWEFaL2daMWVkQXRBblF4TUorMXB1?=
 =?utf-8?B?OWp4Nm04STBxT0RhMjg4eHA3cmh4KzBKWkgwWjI3VG4yVEtHWk8wekR5SWdv?=
 =?utf-8?B?ZEkwS21sUm51R1BaZXAxTWpmNmxNUU1uTTY1dE9Ec0luRkVtY3llY25seDRa?=
 =?utf-8?B?VittaDFLQjlaem12THlNSHZSRTFVWEt3VWhicjBRVlREYWdNWkd4bG5GMExZ?=
 =?utf-8?B?c2huU3lKOTBVV0krMXlubDlHL1RuWk1KMFpDeW15S0w0UTJ1OUQzWEpwODdr?=
 =?utf-8?B?YmE4REppSVYxaXpmd0FNTjcvU2lEZ3pBNytSajM1Sk9yUnN5MXVVYzg2eXM1?=
 =?utf-8?B?RW00RVBUTm56T2wyOW1ab1d5Vk5zRTJON29WcE5MOFBBL1haNmZEM1NUbnUw?=
 =?utf-8?B?b0tSTm5TdWhpMGR3aDRDdFViWXJ3QW04cUxCSE95b0tJTmJ6d1BoMGJsSXVS?=
 =?utf-8?B?eUxoL0dxK3doS3I2ejlqYzN1WjVuczJmWjVuRkhFczVpaFJPaFRXR0lZME9h?=
 =?utf-8?B?elpyTnd2QllVd3ZJbC9JMmtYRVVJRURBK002a2ovM3lpMFJUR2JBbWQ3aVh6?=
 =?utf-8?B?SDJVWXhFSjgrMFBmUlFuamZBV2FuV2NwVEVSajE3eG45dWx1enU5eTJPT2Z1?=
 =?utf-8?B?SURnNGNQaEdzN0l5VEZnVnhJbFpDa29lSWQ0akkzZ20xZFdEVnYrczFCYlhK?=
 =?utf-8?B?Nll6Z0lpOEhhNnBVcmNkeUlHeHBFdE1IQW50Um1aSzR6bzhlMHB4UEJwTnBr?=
 =?utf-8?B?Nm52em1JODd1VENCRTNwYU9yVThQd2IzbHpzTWdqNWREaG16T0pDYUsvUGt3?=
 =?utf-8?B?eDBTTjdkdHZONW5WNzRDcHA3V2hJbkdoQ2xacXJaNDZna0pMMjBNaFFJbERG?=
 =?utf-8?B?bEJUK0dFYnNTTVpPZ3N3UFpoYk00OG5weW1RY0hTNE42V1MvVGRRQWgvbkwv?=
 =?utf-8?B?bHQ1T2ZGclY5M2k2N3R6VmlZOEc1ZUg2ZktndS92Y3ZtSnVQN0FqblJvQi9k?=
 =?utf-8?B?MnFlNTdwRTRqRWpIa1ZuS1R0MWZZcTlzSXJUaE1oZXNXL2oxNDRSSlpvY2VL?=
 =?utf-8?B?c3c2WlFweXRuOGpaTzNiZG9nRmthZkxFbEg3NE9kM2NyVVBkYXA5b1J4bzJs?=
 =?utf-8?B?SERXRSs4OE5CbURnQ0trdXFpOXBMU3JxVEMvSFZtamlKVEl4WWNMN0pJYU9S?=
 =?utf-8?B?Umk0YUR4ZlM1M3Z6TnJ6Wk1zSTBUKzlaMjlQaGxHejhSbmtFaDdWY0dtajh3?=
 =?utf-8?B?QTIzeEt0Q3Y3K0w1b2wxVnBWRjNIaWQyZ2xEdEdpUmQ5cEgwTWxRMWNrQVE4?=
 =?utf-8?B?dmhBWjQ4OWMxVHpQZm0xdUl3ZUVtdEc1a0lMNFRLa01Ba1M2TmI1ZFh1U0Jw?=
 =?utf-8?B?Y1dUbTVtbTdHNjJWU0ZVUE9EVUJWWEtBMXlpZXNxMmtXZ3NCd3ZsL3pzbzl3?=
 =?utf-8?B?Y0JzeEZPUmdDNHVaRUgzdnF3Y0lCRGUwMTREckpyMHBzRFplUUhpVllieDVx?=
 =?utf-8?B?N3NONElQR3FIWStmQVMrM2FuT3ozWWx6QkpTVWJYQVVob1pJSkREL2dnL2Vn?=
 =?utf-8?B?VGQ2N2hXUnEzcVBRaVFYcDZoazBQY29nVlZLbytoOWlLMlVaMEZpejFOQTYv?=
 =?utf-8?B?Z0Zpcm95S1R4UEpxcnA3NTFVbUtEVTNGbWRWcVAySlNtVHhJclc2UT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14cec660-fa7f-4f18-a78f-08da276f2f2b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 10:26:11.3839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9nr95IJ+qfJmgLr+UyPPZki/mIUr2wfDEbi6hP0/lXqIzMXhhWOwQgXO4p7l6fDC2I4CZEEabdnKqTjmzOw3Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3125

Just like for PV guests MMU_MACHPHYS_UPDATE implies marking of the
respective page as dirty, additions to a HVM guest's P2M should do so.

For HVM the opposite is also true: Pages being removed from the P2M are
no longer dirty at their prior GFN; there's no point in telling the tool
stack to try and copy that page, when this will fail anyway (until
perhaps a new page gets placed there). Introduce paging_mark_pfn_clean()
(intentionally without a paging_mark_clean() counterpart) to handle
this. Note that while there is an earlier call to set_gpfn_from_mfn() in
guest_physmap_add_entry(), but there's little reason to mark the page
clean there when later in the function it'll be marked dirty. This is
even more so given that at this point it's only the M2P that gets
updated, with the P2M still left unchanged.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
p2m_add_page()'s error handling looks bogus in this regard anyway: If an
error occurs before an MFN actually is assciated with the new GFN, the
M2P entry ought to be restored imo. But of course a guest is still hosed
if the operation succeeds partially.

Note that I've not even checked mem-paging and mem-sharing code for
whether they may need similar adjustment. At least the latters is, aiui,
incompatible with log-dirty mode anyway.
---
v3: Re-base.

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -549,7 +549,10 @@ p2m_remove_entry(struct p2m_domain *p2m,
         {
             p2m->get_entry(p2m, gfn_add(gfn, i), &t, &a, 0, NULL, NULL);
             if ( !p2m_is_special(t) && !p2m_is_shared(t) )
+            {
                 set_gpfn_from_mfn(mfn_x(mfn) + i, INVALID_M2P_ENTRY);
+                paging_mark_pfn_clean(p2m->domain, _pfn(gfn_x(gfn) + i));
+            }
         }
     }
 
@@ -737,8 +740,11 @@ p2m_add_page(struct domain *d, gfn_t gfn
         if ( !p2m_is_grant(t) )
         {
             for ( i = 0; i < (1UL << page_order); i++ )
+            {
                 set_gpfn_from_mfn(mfn_x(mfn_add(mfn, i)),
                                   gfn_x(gfn_add(gfn, i)));
+                paging_mark_pfn_dirty(d, _pfn(gfn_x(gfn) + i));
+            }
         }
     }
     else
@@ -1096,6 +1102,7 @@ static int set_typed_p2m_entry(struct do
                 {
                     ASSERT(mfn_valid(mfn_add(omfn, i)));
                     set_gpfn_from_mfn(mfn_x(omfn) + i, INVALID_M2P_ENTRY);
+                    paging_mark_pfn_clean(d, _pfn(gfn_x(gfn) + i));
 
                     ioreq_request_mapcache_invalidate(d);
                 }
@@ -1117,6 +1124,7 @@ static int set_typed_p2m_entry(struct do
         {
             ASSERT(mfn_valid(mfn_add(omfn, i)));
             set_gpfn_from_mfn(mfn_x(omfn) + i, INVALID_M2P_ENTRY);
+            paging_mark_pfn_clean(d, _pfn(gfn_x(gfn) + i));
         }
 
         ioreq_request_mapcache_invalidate(d);
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -657,7 +657,10 @@ decrease_reservation(struct domain *d, g
             }
             p2m_tlb_flush_sync(p2m);
             for ( j = 0; j < n; ++j )
+            {
                 set_gpfn_from_mfn(mfn_x(mfn), INVALID_M2P_ENTRY);
+                paging_mark_pfn_clean(d, _pfn(gfn_x(gfn) + i + j));
+            }
             p2m_pod_cache_add(p2m, page, cur_order);
 
             ioreq_request_mapcache_invalidate(d);
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -260,7 +260,7 @@ static int paging_log_dirty_disable(stru
 }
 
 /* Mark a page as dirty, with taking guest pfn as parameter */
-void paging_mark_pfn_dirty(struct domain *d, pfn_t pfn)
+static void mark_pfn_dirty(struct domain *d, pfn_t pfn, bool dirty)
 {
     bool changed;
     mfn_t mfn, *l4, *l3, *l2;
@@ -291,14 +291,15 @@ void paging_mark_pfn_dirty(struct domain
 
     if ( unlikely(mfn_eq(d->arch.paging.log_dirty.top, INVALID_MFN)) )
     {
-         d->arch.paging.log_dirty.top = paging_new_log_dirty_node(d);
+         if ( dirty )
+             d->arch.paging.log_dirty.top = paging_new_log_dirty_node(d);
          if ( unlikely(mfn_eq(d->arch.paging.log_dirty.top, INVALID_MFN)) )
              goto out;
     }
 
     l4 = paging_map_log_dirty_bitmap(d);
     mfn = l4[i4];
-    if ( mfn_eq(mfn, INVALID_MFN) )
+    if ( mfn_eq(mfn, INVALID_MFN) && dirty )
         l4[i4] = mfn = paging_new_log_dirty_node(d);
     unmap_domain_page(l4);
     if ( mfn_eq(mfn, INVALID_MFN) )
@@ -306,7 +307,7 @@ void paging_mark_pfn_dirty(struct domain
 
     l3 = map_domain_page(mfn);
     mfn = l3[i3];
-    if ( mfn_eq(mfn, INVALID_MFN) )
+    if ( mfn_eq(mfn, INVALID_MFN) && dirty )
         l3[i3] = mfn = paging_new_log_dirty_node(d);
     unmap_domain_page(l3);
     if ( mfn_eq(mfn, INVALID_MFN) )
@@ -314,21 +315,22 @@ void paging_mark_pfn_dirty(struct domain
 
     l2 = map_domain_page(mfn);
     mfn = l2[i2];
-    if ( mfn_eq(mfn, INVALID_MFN) )
+    if ( mfn_eq(mfn, INVALID_MFN) && dirty )
         l2[i2] = mfn = paging_new_log_dirty_leaf(d);
     unmap_domain_page(l2);
     if ( mfn_eq(mfn, INVALID_MFN) )
         goto out;
 
     l1 = map_domain_page(mfn);
-    changed = !__test_and_set_bit(i1, l1);
+    changed = dirty ? !__test_and_set_bit(i1, l1)
+                    : __test_and_clear_bit(i1, l1);
     unmap_domain_page(l1);
     if ( changed )
     {
         PAGING_DEBUG(LOGDIRTY,
-                     "d%d: marked mfn %" PRI_mfn " (pfn %" PRI_pfn ")\n",
-                     d->domain_id, mfn_x(mfn), pfn_x(pfn));
-        d->arch.paging.log_dirty.dirty_count++;
+                     "%pd: marked mfn %" PRI_mfn " (pfn %" PRI_pfn ") %s\n",
+                     d, mfn_x(mfn), pfn_x(pfn), dirty ? "dirty" : "clean");
+        d->arch.paging.log_dirty.dirty_count += dirty ? 1 : -1;
     }
 
 out:
@@ -337,6 +339,16 @@ out:
     return;
 }
 
+void paging_mark_pfn_dirty(struct domain *d, pfn_t pfn)
+{
+    mark_pfn_dirty(d, pfn, true);
+}
+
+void paging_mark_pfn_clean(struct domain *d, pfn_t pfn)
+{
+    mark_pfn_dirty(d, pfn, false);
+}
+
 /* Mark a page as dirty */
 void paging_mark_dirty(struct domain *d, mfn_t gmfn)
 {
@@ -349,7 +361,7 @@ void paging_mark_dirty(struct domain *d,
     /* We /really/ mean PFN here, even for non-translated guests. */
     pfn = _pfn(get_gpfn_from_mfn(mfn_x(gmfn)));
 
-    paging_mark_pfn_dirty(d, pfn);
+    mark_pfn_dirty(d, pfn, true);
 }
 
 #ifdef CONFIG_SHADOW_PAGING
--- a/xen/arch/x86/include/asm/paging.h
+++ b/xen/arch/x86/include/asm/paging.h
@@ -165,8 +165,9 @@ void paging_log_dirty_init(struct domain
 
 /* mark a page as dirty */
 void paging_mark_dirty(struct domain *d, mfn_t gmfn);
-/* mark a page as dirty with taking guest pfn as parameter */
+/* mark a page as dirty/clean with taking guest pfn as parameter */
 void paging_mark_pfn_dirty(struct domain *d, pfn_t pfn);
+void paging_mark_pfn_clean(struct domain *d, pfn_t pfn);
 
 /* is this guest page dirty? 
  * This is called from inside paging code, with the paging lock held. */


