Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF162455C6D
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 14:14:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227404.393299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnhEw-0000Vg-DS; Thu, 18 Nov 2021 13:14:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227404.393299; Thu, 18 Nov 2021 13:14:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnhEw-0000T4-AX; Thu, 18 Nov 2021 13:14:10 +0000
Received: by outflank-mailman (input) for mailman id 227404;
 Thu, 18 Nov 2021 13:14:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nol9=QF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mnhEu-0000Rz-M1
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 13:14:08 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 695883b9-4871-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 14:14:08 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-xJvxcdKrMR-nCBxJiEYVOg-1; Thu, 18 Nov 2021 14:14:06 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6383.eurprd04.prod.outlook.com (2603:10a6:803:11b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.20; Thu, 18 Nov
 2021 13:14:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.019; Thu, 18 Nov 2021
 13:14:05 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR05CA0037.eurprd05.prod.outlook.com (2603:10a6:20b:489::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25 via Frontend
 Transport; Thu, 18 Nov 2021 13:14:04 +0000
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
X-Inumbo-ID: 695883b9-4871-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637241247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a8687ihPanRL+3ac1IjZtotfsNsyk2rdhK4easY+hVg=;
	b=UwTf/oS1YYVXjEuEhfPfC5bJZJVh6JigJicdpJKLi1TLih5HkzIBC1uda0fQ51mrdolQGv
	SDfM37yzgWuTaaYRyK8pQjasrY+MGpw0DJNfUkwxjgMyTOb8K6TTi4SoTrmbcUu+Sl9K2T
	sOf8UFN7SAuxfTvRTnGq3mjy8kexAYg=
X-MC-Unique: xJvxcdKrMR-nCBxJiEYVOg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Taxmt4IK+K7Z9jpTodVrqmA1byvbF845qHZdtqM/ZE3lTo+JegbsgCtg3esdFdNk1wqrlpZ2M9WYXNBU9rT5h5XrszYPjbPeyX+/K6K20unqepJyIfi9yQohR8QAdLCFaXBK1mlH9z64oTTQjL+zDp7i26uOZSH8FzEuUJqHcrU3LNSfsJYbQh6WJAAm/r6PSQqILL0Szmhvg1hpJ/5lG78GecXmHPuSgIWle6CzCE0OghRmm481ud8JE+ug8cu+mHX51mKIt64q9xDshox519LxEg4B8S6ohd6/Jp7/DHzsyGW1gGKkg7Ei2Z/uqhXGAGVx/jCSlB1rIZ0g0zfAfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8687ihPanRL+3ac1IjZtotfsNsyk2rdhK4easY+hVg=;
 b=BlYCAIEf6SP+s1byNcr41bQ9mijij1LvzRzr9xjhokEhsjJ1unyGAbMBIxq89TiBJjlsCI7I7U9qNoBW8LnasBK5H6tKVZ3NmQEVp1iZZz+Aqi/qOtcEgOsJ/1EQjO9kCip/4d6//sKXwfWvUJ5ayN0faXYqD3vfmjP68OYp808wNgVxW8vpAhR/HTCJoT6T5PPzZ3pv7RSQfamAJ/JEdizBAomgylUdf3P8zbjs/wq0aneyQOzRioXiY5kFImZWKCL/UwPyrUbThmfBkPOgUTdttD7MLloGl5DfIDb0TKyqsaB4T2Be31rh64ImMR7f9Mm+okeeTs2n2QYjkT/zNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ae2fa743-da2b-91a8-908f-b0c7bb006fd0@suse.com>
Date: Thu, 18 Nov 2021 14:14:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: [PATCH 2/3] x86/Viridian: drop dead variable updates
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
References: <c8e8767b-111c-5eec-15c4-a7cb60a99283@suse.com>
In-Reply-To: <c8e8767b-111c-5eec-15c4-a7cb60a99283@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0037.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51b5f890-ad72-4299-67eb-08d9aa954c02
X-MS-TrafficTypeDiagnostic: VE1PR04MB6383:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB638360659486145D3260F284B39B9@VE1PR04MB6383.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4IawI3xG5ZN7ziZYYC7th0hQYAsllEQ0uAorJ+mNKNKQy7ntRB8Jxfn+FXJunjzLDJ/cvb37Y0eQ1eVxWuB/J762sH1wKRCKqHwWRYGwZLXjpWtxWASzneJ7GLK6U1upf0ZpRA8UluuhFObPZM225EzfqjVh9H8o+E2LonPr96T0XP6XDa+x3twPao/De9UO3CO9xUfOdIHoXeJfOWLRt5+bifjbKnAHcWx4m3KEx/v9Z22gq7csUVNlBimbSM4WrMN2C1WqAKAK2DqdQ3z/IgXx1Z+Vn3gTxZSbVYff/ClMeTJVflxUt1FeUd1NRZreRnzB2i/bPHCTuXvBz1QkKHSsesIi8Zg7QE3B0N5r4D1aCrpdBIxltpJLTcb/svrGUkDG47fQsiIP9LuRk9U/ctDMA/nf/rR9d0eMma6ICR1EIlIlBFvJvYI741cFmiQIe0whtZpvgRj5CjgD80UNv1fFgsJQKw9EyaR/dtpJ87RLfr23R0n/AnxS48zb6k57rjbR901/3TmyZHpser1Cy9rhukQuDsLYg7foaZMrGCmrR0KgrBf/uedT99FcwG4cTipSVtjk4sWwwIzOToRu6EM4c3PLkFWVm937rC2l5BWD/covhEH894tTK5NtTW6RJheNcgTdTVCIKeUBiewKdYLvicN86NDwdXMBKlWeybxoU2Ni8fA8VpgvDZ7HNbStBbjVXDn5N8uNSFTcVJZGSnOujU27gO5cZT70SVQXL6M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(66556008)(2906002)(26005)(5660300002)(31696002)(508600001)(83380400001)(66946007)(38100700002)(186003)(4326008)(66476007)(36756003)(6916009)(86362001)(31686004)(16576012)(54906003)(2616005)(8936002)(15650500001)(956004)(316002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eW9DWnRiNG5lQ2xmZFlGb3RIQ000Q3ZLd0E0VXFISkkzUzFVZTRzTUFzaXhk?=
 =?utf-8?B?d1hOTlNXWG9pZC9rQ1Fla25NZitVbmRXQjltclRXTWRZRTFxbjVhdXVlOFNG?=
 =?utf-8?B?dndoMXJtb0xlT09USklvNE0yVno2d0VsMDQ0ZzVEc2NkTzA1ZmEwaTVEa2xM?=
 =?utf-8?B?N2E3dFRpMkxzZG5PcEJkSnpiSnFaUzJpNmdxKzAyMWNJZnBnenV3Ym91THNE?=
 =?utf-8?B?NW9RZjBabndobE1mNEQ5Vks3aHFSRHc1b25zTDJiRlNDaDhBbW8yYWNDTndu?=
 =?utf-8?B?dVpYTWhyTnlQNW5GSDF0b0lsb2wyWW9TY01kajRSR3hma1ZzOW1UU04wNGgw?=
 =?utf-8?B?ejQvUmliTkZEb1doUTlQZGF4a3Y2MmdnVjlsK3Z4K2JtY2NsUmFUUEhDb1VX?=
 =?utf-8?B?R3MzWGZIUC9lcHRFU25QYXU3dG92R2VWcW9ITGo1SWI2azNtMklENnZWMDQ5?=
 =?utf-8?B?LzB0b2ZvRktZQm5MUzZza1J5SUdERlhXamtJVHpNc3BKeGYwRFFyN0lubnJ4?=
 =?utf-8?B?VVk0d3diMk1GSzdjeVN1T1lZTi9pUmN6aG5tREtCSjlYSWNTMTB6MVduK3gz?=
 =?utf-8?B?M2Q3UFRuZTBxRTQ4aFY4cVVsUUpESDIyaHhTbFA5K0ZjMzcyODB5YnYzREgx?=
 =?utf-8?B?SmFDM0gyUUs5WUZEV05WOXBFZDBQY2c0VCtTNVNoV2R0dDloVUNYdUpnY2RJ?=
 =?utf-8?B?YmtLNy9DbUJaeElTa1NtRGNRSDRxamNvWFcvQlN2cTJaRnFnRTZ6c3p2VmFG?=
 =?utf-8?B?WXlMZDRheWpXUU5lUXhPamltSG1aN0lZQU8rVE9mM2U1TENBLzBkcVdoYnA3?=
 =?utf-8?B?M242K213a1R6L0Y0MDQ3NlFwQU5zeHVmajI5VjdRQm00UUJTK1RxTFFEalE5?=
 =?utf-8?B?TEtWbGh5RlByeDFwVTVjNUpUYmFjRDJuRHFiTzM2NlJ1L05FRkJnK1ptb0FL?=
 =?utf-8?B?ZTBLKzZibDh1eE5sam5tWXZWb09zSmpSMDJIa0krZzRhdWhYQUJMajF1OUJY?=
 =?utf-8?B?Q0Q3RGVaSkNrdTF3Y2twRStPOVpDMC84NUU4cHlPa3AybWJnYVBKQlZBcTQ4?=
 =?utf-8?B?VmtVRkZPcTFwc0NBMGUrUkFMZnE4Smt5VXJqM3FPcTNsYlBRZjNDVG5UcHNm?=
 =?utf-8?B?VlBFbzFoMTFQdHNLYkdXNjhRcE1IM2gxb1V5U0tNM3g0OGhrZVBGeTBhUFJR?=
 =?utf-8?B?czliT2V2UXhFTHFDK2dudVIvd0tpbmp2Y0ZJdi9RY0ZVSEtZV3RQamN6azQv?=
 =?utf-8?B?UGRLTW1TYVUvU2VpK3VGQnZvWno1WjFqOTVjS0RYV1RuNjlHMGhlNVdZb3Bo?=
 =?utf-8?B?ZFFrTm9vTTRabnBPVzFuYXZOLzdtMVM5VHZRejNMRzVyS2NycXlqU2Zvd05I?=
 =?utf-8?B?UDFZeXZXaVV0cVBaTzhBVmpFNkM5aFRzalF2cGl4VWVySG5FeWFzOTI3RnJM?=
 =?utf-8?B?TzRQa3RzU2tOaCtpN1QvU3gwOEw2c2VObVpScGR4cU13S21DNUNrOHE4cWtR?=
 =?utf-8?B?ejg1UW5yT3dBM2FwVVA5RDBTTUw0VFF4dU1CRzdmMjhMcTBacW9Ca0djamty?=
 =?utf-8?B?YTNxMHVvMllyQTJoaTlrMFI2enNvSXBzOUU2WDdqL3d4Q05CbC9tOHRGVWVH?=
 =?utf-8?B?WU1IOGk3NXRNaE1OTDlsZ0RDUVU4SHZGSHphUG00QWdFOTY5eVh2V2FVRTQ3?=
 =?utf-8?B?cmhBM1o5dXdMV2VtNnRFZlB3M2s0V2dpNDlPUXo1TTJmNS9SWjEwbTNjVU9C?=
 =?utf-8?B?Y0ZHNUFNUGVzMmw5TktuaDNpeEN5T2FUYTMyQ3NaSkxOMGlTcHAvVkRsL2V3?=
 =?utf-8?B?SVREN1dLbUUyVitsakxHMDZjU2YwMnExQnNUbmhmcU4rRUpkK29EUUhSaGZU?=
 =?utf-8?B?SFo1M1Y2V1JwOEtLRDJsSFZzSzJlY0FTRTRubVRKdW5TUmxMdVJpY3Y2RWJx?=
 =?utf-8?B?SXFBbzk3SVIxcDZZTGVYUmlicnFOcUpLQ1E3bFRSckZKM3EzbmR4aDNhM2dB?=
 =?utf-8?B?N1BmdDdLcE1hRjQ1RUgwSE4xcW94WnBsL2dKcWtNaUZwNlJrYVpxM2JiYjBW?=
 =?utf-8?B?REhxY3d6ZVZMVmo5aXN4OUI1em44OVgraytvZlRuM3htbVgvejlIRTk5QTZK?=
 =?utf-8?B?Sm1NTWVUSDRnUDc1QkFlcDRzZlpwRVdhSTdzeW9XWEthUTAraStBVHoySDdz?=
 =?utf-8?Q?oR7OZuN3lAX+O+/d+6US9Ik=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51b5f890-ad72-4299-67eb-08d9aa954c02
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 13:14:05.2850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7TbSMx7wJlvvLnGkXUCXP0GWfWUxsvt6cxvHBAx3yhwK9dqd0WBug0pL6DyPyqhDBGEW3Zz5q1ncT6Zbe+AfKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6383

Both hvcall_flush_ex() and hvcall_ipi_ex() update "size" without
subsequently using the value; future compilers may warn about such.
Alongside dropping the updates, shrink the variables' scopes to
demonstrate that there are no outer scope uses.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -776,7 +776,6 @@ static int hvcall_flush_ex(const union h
     {
         union hypercall_vpset *vpset = &this_cpu(hypercall_vpset);
         struct hv_vpset *set = &vpset->set;
-        size_t size;
         int rc;
 
         *set = input_params.set;
@@ -784,8 +783,7 @@ static int hvcall_flush_ex(const union h
         {
             unsigned long offset = offsetof(typeof(input_params),
                                             set.bank_contents);
-
-            size = sizeof(*set->bank_contents) * hv_vpset_nr_banks(set);
+            size_t size = sizeof(*set->bank_contents) * hv_vpset_nr_banks(set);
 
             if ( offsetof(typeof(*vpset), set.bank_contents[0]) + size >
                  sizeof(*vpset) )
@@ -798,11 +796,7 @@ static int hvcall_flush_ex(const union h
                                           input_params_gpa + offset,
                                           size) != HVMTRANS_okay)
                 return -EINVAL;
-
-            size += sizeof(*set);
         }
-        else
-            size = sizeof(*set);
 
         rc = hv_vpset_to_vpmask(set, vpmask);
         if ( rc )
@@ -903,7 +897,6 @@ static int hvcall_ipi_ex(const union hyp
     } input_params;
     union hypercall_vpset *vpset = &this_cpu(hypercall_vpset);
     struct hv_vpset *set = &vpset->set;
-    size_t size;
     int rc;
 
     /* These hypercalls should never use the fast-call convention. */
@@ -929,8 +922,7 @@ static int hvcall_ipi_ex(const union hyp
     {
         unsigned long offset = offsetof(typeof(input_params),
                                         set.bank_contents);
-
-        size = sizeof(*set->bank_contents) * hv_vpset_nr_banks(set);
+        size_t size = sizeof(*set->bank_contents) * hv_vpset_nr_banks(set);
 
         if ( offsetof(typeof(*vpset), set.bank_contents[0]) + size >
              sizeof(*vpset) )
@@ -943,11 +935,7 @@ static int hvcall_ipi_ex(const union hyp
                                       input_params_gpa + offset,
                                       size) != HVMTRANS_okay)
             return -EINVAL;
-
-        size += sizeof(*set);
     }
-    else
-        size = sizeof(*set);
 
     rc = hv_vpset_to_vpmask(set, vpmask);
     if ( rc )


