Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC39B3AC8BA
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 12:24:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144415.265808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luBfQ-0006wn-7t; Fri, 18 Jun 2021 10:24:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144415.265808; Fri, 18 Jun 2021 10:24:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luBfQ-0006uV-2W; Fri, 18 Jun 2021 10:24:04 +0000
Received: by outflank-mailman (input) for mailman id 144415;
 Fri, 18 Jun 2021 10:24:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lC6W=LM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1luBfP-0006sk-6x
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 10:24:03 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a8e86627-16cc-4c01-b84d-763bcd93f4a1;
 Fri, 18 Jun 2021 10:24:02 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2056.outbound.protection.outlook.com [104.47.0.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-37-TisWPV9fOs6JfCxzx0IXkg-1; Fri, 18 Jun 2021 12:23:59 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2607.eurprd04.prod.outlook.com (2603:10a6:800:58::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Fri, 18 Jun
 2021 10:23:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 10:23:58 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0003.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.7 via Frontend Transport; Fri, 18 Jun 2021 10:23:57 +0000
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
X-Inumbo-ID: a8e86627-16cc-4c01-b84d-763bcd93f4a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624011841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V7LABsQDsEgnYdE2iTKHmR19AgygtEHLnin18+tzGjg=;
	b=S7PMwGVY6tHA/YfTCMGq6P3ggea2XACdOXaYuVJb48VFJczsbaCrZjVnJC0feviglMYMvu
	+tB0yv/YO9/JhZA4+D/0MRWn4tPrp1q/kKyg3lWIKKHp15sl08V3axQ46Br8+38k+Y4ioS
	UJ4L7h4328JPhDksmN9VBssCj+MqN3M=
X-MC-Unique: TisWPV9fOs6JfCxzx0IXkg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5PftO1tmGRbFNKFIX6jjW7+0oy5/rJW4KyjNQCOIQcC4uOrMD8FcxzouvBmLcrIOXUsaLK9TGGpiNK6bDfgxNrLaWRe5pa5mwCbXeEe+VxCMOmHbfBLIDbB3v0ZT31migZ7tqo8zOBKmWm6byK3rhTae7/V3Hpau5wNfXrewzg3+WDGgGEeQWh3XWRM0OGFBlAQbK7GUG98qFcAEWbP/LZlpeAf1G6yBb0da9RdSNPKIaRi2F7SDybLOo5h1loFLpQA5NKCQxyfdgzfqnat/n2IWAdgvp4/OZByK4kbRjhyFexiJ6RovrLt50b+HilbX6BkU1+A5xgsnw+1kSexDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7LABsQDsEgnYdE2iTKHmR19AgygtEHLnin18+tzGjg=;
 b=JV5nxZdf2fi0XGNmnCox4KL1wDvkc0aF2A+XuDnk9ZUiXPRkTvCtivKhCTnVcorSzFeE1DYf2LUeH/eNMyBHQc7diqPy1BuGn5ZBna+RfNpOBZ703fQ30r1o/qMk+eNJH33dK4jObXnBBYIHxARJFC2f5I3GN0RNoDS8Z3MN5XXPxnH7jYnU6V1xtmU3PRtfnl+9UvRb0XH8cozmsHTO0AUcpHItH9fP1Fdd++/ddu/dSnOXEL8MfJLRPGFbbdCEqoP/T1JECexxXQW1CXgfTg39TEs14g3WGUuNGAHPnssqrntHAVIAgyVxBCI1x0fZsbY/CSeUTzUajE8XhY8h4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 2/5] libxencall: osdep_hypercall() should return long
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>
References: <edaf04ec-335f-a156-34c4-5c0385cba08b@suse.com>
Message-ID: <798b7eec-e31e-1798-773d-c2865fba4be2@suse.com>
Date: Fri, 18 Jun 2021 12:23:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <edaf04ec-335f-a156-34c4-5c0385cba08b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR0P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 236ba0cd-44f7-44a7-603b-08d932432eee
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2607:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2607EC5A3721BC0457B3ADF7B30D9@VI1PR0401MB2607.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	emXe1XBozK77IhQdKbiHdyH2lglCcaxkd8464YkEJCXvJU+gaLBYbdWZLMOlLG+XNaXDKNbmGOLb3yb4ai7KzlEFR8akGON6uxUmqJ0WY0AU8xEkJrT1NEytRyGJN/t1mCoxJxBO6FSaWy5MXpGo/pNF4WBIYAd82gTzdJAeYsX7NBapwXZR2D58Azixt7Q8Ez+EcuMlNZkE5UECzMxFx0fAMpwQzGbITz78MYQBg6t74ew7ICgULFUcJu3Htl5oT+XjYTIJ9YsVlSPuSTz1z/BSgLeTX7Y7m1wIReef/vw4rCiZg/Mf1RBDTnLi/Ixz/JEfYdQgDMOmxUlATYto+mzSffjjySyZm9oET7BAh9UHtPlStsiVv03L5HV7k1gu2/iT0cISjKhdJb9pRMsIUbVkGkLvYHxas51sy6G6+oxmhJpqhqWm/SVTQhmqWcVtBLO7n9z3EKODXrQ7dTxHtIUWJcTLrHrX+g/aR2nCSNV6tsVynqkRi0f7vgiX/Oy+0zNUG/LhovIRe8wHXu7NmieYHEg+iFI30CPp1sXGaxnSM5EsdOkvirwW97TUgyw/ZqHIzej3w9qUXkSvqHOtaxXSuJKEiJDdNDdFGEoSeMvwOYXgJ9QkrYQpFatuEcp75uvjgm0T2piSpH+4Kg83tUW46PukD9CGtzpVSbUEeAUv/Ri3nzQgadvM9BXbbuPD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(396003)(366004)(346002)(39860400002)(54906003)(4326008)(38100700002)(478600001)(316002)(2616005)(16526019)(8676002)(2906002)(6916009)(107886003)(66476007)(31696002)(31686004)(86362001)(956004)(66556008)(36756003)(26005)(6486002)(83380400001)(66946007)(8936002)(16576012)(5660300002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NC93SE0wc29IbDJnOVhsalV0SDhMNkpaZExkWEJuem15NXl6aFRFT3JKcDhD?=
 =?utf-8?B?SjZadTNBb2lTYUVkaGJydEFkTjAvMlhyVnRHZ1M3QkQxMkthNURuZzlSa0U0?=
 =?utf-8?B?L3habzFHcFlKeUhiYjRpWFo2ZzlWTlpzelRyekpVNm0xK21QVTIwTkdZN2o5?=
 =?utf-8?B?RDJCYjlOOVcxMU5SVG11VDY2VHJiZG1tSmlIMzhhb2w4Tm5BVFFqQUk5clo5?=
 =?utf-8?B?VVZyNWt3eWVIRFY2QzFCYnZqd2h2TjhEdktwQ1BVVHpEMFpFRTlvWFNRUml4?=
 =?utf-8?B?L0dBbWdxRitZN2JjRm9mOVRsT1EyWEVNR1pJUmQvRVF4V1FjcGM1b2JXZ25I?=
 =?utf-8?B?Q3ZGS1RiZTBUL0o5Skt4RjlxQUYxMXdCRVAwOEhLajY5RHkwc3p0eENBdkhL?=
 =?utf-8?B?Qno5cFJzUUtyYnBqbjJsVTcwc1dHVjM3bmtVQjZ3MEplellwR3NrMktzbUFt?=
 =?utf-8?B?YmwxSU5iZmtPd0VOZTBVU0xZSnFXV1l6NFN6amJtRVI0QllMYVNqMFdSczNz?=
 =?utf-8?B?cmpYbGNkUkRrQTZmWnQvckxtREtoYitWZkt0TEtiazBGQ2tGMHFTV2R2SHJS?=
 =?utf-8?B?cG1hNUJxS09OK2R1b3l0NERGUGtBZjVpMFJjeURXaGV3VDRuYlU2YTNGd3pS?=
 =?utf-8?B?anRBcmFWd2VRZXdobUNENnRxa1VqWC93U3ZZSzlxMm81VkNwNE9GajMrY1da?=
 =?utf-8?B?djRacUM3UkpJSzBGVjQ3UnI5THVGM0ZZTThBVHNGcGE3RWYyeFlLMkV3dFcy?=
 =?utf-8?B?eUkvYkJTdGEwMThlTTJFZGFNMGhkNmwxK0UyV3dlZUwrVDNuNWRrTWJZSmFI?=
 =?utf-8?B?WmwzbXNneXRWM3hmeGxscmZiaU0zaWJ4T0FnSVJYVzI1YkNkUGR2ZHpuaEt2?=
 =?utf-8?B?a1NPaDVXNCtKaWUwSFZacHBZMDZKQXIvekd4WWFoQ2o3VERhRG51Zy9pU2w1?=
 =?utf-8?B?K1RybkdSQmFLaW9LNTRoSlp5dzV4NGdKVVY1OWVrNDZvZm9ZYkR2ZU5jUXpp?=
 =?utf-8?B?eG1wczhacHF1YWZEUUJIU1g0emRYZlFOWHVBUEs2S0FMWUFET1VDNTVOOVFO?=
 =?utf-8?B?MExqVkZ4ZEVGR0lBbTJ2WDZlQi83cy9oOGgwVkFqdXhzVHBsY0ZHK2RKaHNP?=
 =?utf-8?B?VEpWRElRcHRYS0RWWmZUZmo5cVphb3V3dEt6M2dObHlLL0wzMjRHaE5kYXMy?=
 =?utf-8?B?a2VORkRGYlFuWUJVWUZDSDRKS0J4RlljS2VEWnJrV0lMa044aDRMN2MxR2h3?=
 =?utf-8?B?Q0tXVjdOV3VBRnlFK1c0MnpsUWpJcHkrVmIzMmdzQXNnclhHR2YwcWsxeUVE?=
 =?utf-8?B?TGZXYy9xS05oOWdZTHJ0cERKVi9SQlpLM2l5OUY1TnVsbDQvb3ZMTmJSYWxu?=
 =?utf-8?B?OFNSRURhTjVWd3ZoRVAyVnNmS0pSQ1VOMm96cVZwQSs5M3Q1dVhjcjhoemI2?=
 =?utf-8?B?N2lzQmxEcTBZUkQ1WTRJWUF2eVZEcU4zR1NHWGtRakI4c096OWh6c1dpaTR1?=
 =?utf-8?B?UU5vQVI3dkJneWphWVBHYUtaWC9BaVFyYlFtQWY1eW9IVHVOc3U5QjF0aGpB?=
 =?utf-8?B?RDJGVk1mM0NHbUpSWDlBZ0lkdjV6THVDWVNkSExPdFpzR01sa2JsUS9XTmtz?=
 =?utf-8?B?ZFZOMVpZdmxvVnVSbGVpN2FuVithTGRYWE0zT08xVE12cWVJWm1ycGRJNFpv?=
 =?utf-8?B?NEpwbE0rUU0xNW00M25lSkI1VU1JMWNYMHlEUnJvRXpjQ0FwQ1lROHU0d2w0?=
 =?utf-8?Q?R+ULyygt8o/XRyIR+1ILlfAsLxzQFWASbsiqKH9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 236ba0cd-44f7-44a7-603b-08d932432eee
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 10:23:58.2277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9GmKam6HL3cAocIxiUQ9zK7BHcI7YgNjWPjMkChZpT915C+PLpby5lzNTN+MKwuSHQPLo2w8Y9WdUgkZ0zFVoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2607

Some hypercalls, memory-op in particular, can return values requiring
more than 31 bits to represent. Hence the underlying layers need to make
sure they won't truncate such values. (Note that for Solaris the
function also gets renamed, to match the other OSes.)

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/libs/call/freebsd.c
+++ b/tools/libs/call/freebsd.c
@@ -62,7 +62,7 @@ int osdep_xencall_close(xencall_handle *
     return close(fd);
 }
 
-int osdep_hypercall(xencall_handle *xcall, privcmd_hypercall_t *hypercall)
+long osdep_hypercall(xencall_handle *xcall, privcmd_hypercall_t *hypercall)
 {
     int fd = xcall->fd;
     int ret;
--- a/tools/libs/call/linux.c
+++ b/tools/libs/call/linux.c
@@ -80,7 +80,7 @@ int osdep_xencall_close(xencall_handle *
     return 0;
 }
 
-int osdep_hypercall(xencall_handle *xcall, privcmd_hypercall_t *hypercall)
+long osdep_hypercall(xencall_handle *xcall, privcmd_hypercall_t *hypercall)
 {
     return ioctl(xcall->fd, IOCTL_PRIVCMD_HYPERCALL, hypercall);
 }
--- a/tools/libs/call/minios.c
+++ b/tools/libs/call/minios.c
@@ -38,7 +38,7 @@ int osdep_xencall_close(xencall_handle *
     return 0;
 }
 
-int osdep_hypercall(xencall_handle *xcall, privcmd_hypercall_t *hypercall)
+long osdep_hypercall(xencall_handle *xcall, privcmd_hypercall_t *hypercall)
 {
     multicall_entry_t call;
     int i, ret;
--- a/tools/libs/call/netbsd.c
+++ b/tools/libs/call/netbsd.c
@@ -96,7 +96,7 @@ void osdep_free_pages(xencall_handle *xc
     free(ptr);
 }
 
-int osdep_hypercall(xencall_handle *xcall, privcmd_hypercall_t *hypercall)
+long osdep_hypercall(xencall_handle *xcall, privcmd_hypercall_t *hypercall)
 {
     int fd = xcall->fd;
     int error = ioctl(fd, IOCTL_PRIVCMD_HYPERCALL, hypercall);
--- a/tools/libs/call/private.h
+++ b/tools/libs/call/private.h
@@ -55,7 +55,7 @@ struct xencall_handle {
 int osdep_xencall_open(xencall_handle *xcall);
 int osdep_xencall_close(xencall_handle *xcall);
 
-int osdep_hypercall(xencall_handle *xcall, privcmd_hypercall_t *hypercall);
+long osdep_hypercall(xencall_handle *xcall, privcmd_hypercall_t *hypercall);
 
 void *osdep_alloc_pages(xencall_handle *xcall, size_t nr_pages);
 void osdep_free_pages(xencall_handle *xcall, void *p, size_t nr_pages);
--- a/tools/libs/call/solaris.c
+++ b/tools/libs/call/solaris.c
@@ -80,7 +80,7 @@ void osdep_free_hypercall_buffer(xencall
     free(ptr);
 }
 
-int do_xen_hypercall(xencall_handle *xcall, privcmd_hypercall_t *hypercall)
+long osdep_hypercall(xencall_handle *xcall, privcmd_hypercall_t *hypercall)
 {
     int fd = xcall->fd;
     return ioctl(fd, IOCTL_PRIVCMD_HYPERCALL, hypercall);


