Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E93D23B0891
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jun 2021 17:18:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145903.268374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lviAX-0007qe-W3; Tue, 22 Jun 2021 15:18:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145903.268374; Tue, 22 Jun 2021 15:18:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lviAX-0007oc-Rj; Tue, 22 Jun 2021 15:18:29 +0000
Received: by outflank-mailman (input) for mailman id 145903;
 Tue, 22 Jun 2021 15:18:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RtyV=LQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lviAW-0007oS-BJ
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 15:18:28 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 35ea69e4-2842-4ddd-b153-ae9677eb296b;
 Tue, 22 Jun 2021 15:18:26 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-vbilEjMmNLC95g-EmX-spg-2; Tue, 22 Jun 2021 17:18:24 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6478.eurprd04.prod.outlook.com (2603:10a6:803:12a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Tue, 22 Jun
 2021 15:18:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 15:18:21 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.7 via Frontend Transport; Tue, 22 Jun 2021 15:18:21 +0000
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
X-Inumbo-ID: 35ea69e4-2842-4ddd-b153-ae9677eb296b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624375105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/bbmcF2dLfMyovvu1hUGHMNb0R327+N+VEXYHAXs66E=;
	b=QlLPqon1+UwlZlCMubS4XV9pvMt7zJY6JJhB3IXcUcQt5waaQZ3ERfB7Ig0f/CwtQ9Kq6T
	A38rL+fpxqPATscipoyoZO5WKgxUpFbZikYNtDoubotq1iF7T8CDfBXBuPeYdehZOPtp6S
	Vo4jjJhgasYUDUYNibcNamNlAVaIw8U=
X-MC-Unique: vbilEjMmNLC95g-EmX-spg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S2j0IASNa5nR4KKaIRZHlECF5NvhpaYFWioGDwq7eHNhlWQfEbMPAIVusigqngRkIh4oRHmSwHtPjeZ9xHnrDQJX3ojlRfnsDjkZr/OtneDVduSHuG5zQgHFNj30oxJctWVUtbVrmYKqsWdlwVIqVxLnA4lPdTASkqruaInjmbRmWUFEXWN7/Y53qFfYn66hwEIeJzelPX20GcSxH7FRGtNKFnB0cS52QgEzT4A+wA15LmYZhPIL2OsAmjilqFiAY507hvWe0aHlFyQU1TG6YhQhOQZIo1HoJ/I2sBfnglTBqaatd7GnmRw53TqQbYtWImWSH5SSxmrRxmqOSzTMzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bbmcF2dLfMyovvu1hUGHMNb0R327+N+VEXYHAXs66E=;
 b=ir59Oj/ExaGbMb21bypfYMpyharY3NuUnL6LyqrKPEQle+iDHwP3ymddkNL9a+ZhwkxqpCFhXc742n2luw7BNP+nQIYLwCgz1d/lfopfraRjcOknwMPII7laet2Fw+NM49gryRwCm6vzHQUA9rTUweOml8dNL9xgIOwrlvOIAPxfj+nMW5ErEDiJ6jtj4GdsPBvIsluh6K5vBrGxJPeIm63XdCcXumrh4uTDhbcyMEI+t/lXGA6jeCRP+mUcVVFuhj+wdmlzCpPkeTXmRR3YYDRibPWXVvxEDkkgWhdNO9dD0Fgzo3MKlnoVdEMcBde20y2iJwbLdRf5oKyRNLJwow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 2/6] libxencall: osdep_hypercall() should return long
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>
References: <6c532607-c2a3-d0ab-e4e5-428f85f4a045@suse.com>
Message-ID: <0a912030-8ead-62e8-863b-01f296782bfb@suse.com>
Date: Tue, 22 Jun 2021 17:18:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <6c532607-c2a3-d0ab-e4e5-428f85f4a045@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR3P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aedf138b-9f0b-4ea4-f992-08d93590f8bb
X-MS-TrafficTypeDiagnostic: VE1PR04MB6478:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6478500EB016897A4956E4DBB3099@VE1PR04MB6478.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L7AlSXWM/DHEHuoaGD1RSQldZSH/m/2J+QZDb81RJnPLYAMDSZHmer8GUv7Ha3SjI+ZZYMrd2OFEMI506GubTAMTZk0bzVb3+OAfBoi01HhCRdue9KRsoHy+qIl3oPrWZnCGIvP1zhRArs3fPbomlOjc5PkDlPrTpPEPBR27PU3oCEkrTaFpW2lFpSKTBix5kwdINtxmKh03ZHCY7pF1xMc+hPS1MdNXK3Ocu92WqgMNqNV2ztfUXBDpYk55jLEuXSvUmfUWxMb4oAimIHOIIXHVcMr9TNRxTBXS0mspTLN3pSZs1YgWozWtGQf4J0RKr/5YslkFDGUfvXTse0kpqKpBWD3wqtxDr763ZVvFNrQq8iJKLiJBfmZyRzxTrUpm4P4g6gvX3j7YcTivPcij4Swo3SyqOv8ejxJEl0nDg74LjpdDTODkcpBKbCgGfjj4xQZC7qG07tpv2GS2nV22ZPZ0DAEUmGBubEQrq8yBEiAMJTHEnoefKBgBZqKCRMoiwUPHNbph7wSf3/X+Zz1BUXhnl+40mwh98OZIB9niMh6VlgC2ZK8XCxJBN/gKbNspUg5aS8ME1FC83mUmWYvDJdRjkDmhOvMkR/ItSB+vtctR2j5dZESILCv63KrtGbMoTv7Kfz/Nes3o9x8qocngwUGg+znfbnCw4xrktNaD0BIGlU0/CaaHWlShs3CZNVCE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(39850400004)(376002)(396003)(366004)(26005)(186003)(5660300002)(4326008)(16526019)(36756003)(38100700002)(2616005)(107886003)(316002)(956004)(54906003)(16576012)(2906002)(31696002)(66946007)(8936002)(86362001)(83380400001)(6916009)(478600001)(6486002)(8676002)(66556008)(66476007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlo5MHpWMytvaEJYa09wQlpOaDc1SkVPMUNNTXlpclpQSDFwNkIyeEgwRExD?=
 =?utf-8?B?dzh1V1RPTUdLN01XMkRtaDFyb3hpVHZGSXhEUjRkZGJmY3REM0MxQ214U1pt?=
 =?utf-8?B?VTZSaUV3ZXNlWlk0bEw0UzcrRFNFaGd1ZEhkMjhVbE5IaDd5Y1kvclNRdVhP?=
 =?utf-8?B?OXliSG9QS0diY2FSaUQwS2FKTm5tb0wxeG84OXQrNHBTMVJHcDAvYkMyMzlq?=
 =?utf-8?B?R0F4dXg1OEZydm93cWsrSjdrNVFEamF2bUpZeFBCZktsV3FwZTliSVYwNENY?=
 =?utf-8?B?WWFhWlZSaktaSGs3ek1CWXBGeTBpMzhJZURkUW9aVkNyMVo0Y2JKcDlLdTVl?=
 =?utf-8?B?SHdVU2FaUzNlbkxNS0IwQ3BwV3BLQ0J1bEJUUDZZOWJlRUlhcWtzcTVhdStl?=
 =?utf-8?B?WXZoWWUvZDJIK29mdXBDak5ZbXlpRzlwZkhVWWE3TnQ1ejdRMC9uS2lGdjJV?=
 =?utf-8?B?SFFSSnNwQVo0MGFLS01PSTRwVkxUa0Z3Nm9XbjQwcTJBQjJKV3FGa2tBTGdq?=
 =?utf-8?B?enZLRzJqK29sa041UnF0dmpGcEt2ZS9pWlNQOWxFdkF6WlIrZmgyTVBiSkxE?=
 =?utf-8?B?QVFRUlBnMHNGQ3A5YU9Bcjlma3VVSk1IWDhuOU1qdlRxS0NiMUswUVRiZTJr?=
 =?utf-8?B?ZEwxUGdybjRsSW5sRXpFeTZOTEhXSDRmeUdMcjBJK1A5VUgvR1k3VWdJMDFx?=
 =?utf-8?B?T0hCZEVud2lkOWtId3dsd0dhZDhtUHFVRllQZzVyanhjSExQL0JwSmFPVGE3?=
 =?utf-8?B?T3dUK082cjlPUithU29mdDVSUVRGc1FCWlBsSS8yb1h1U1hvbE0zSHJuNGcy?=
 =?utf-8?B?YjlzbFFLU2x6YmNBUDczaWZVVHlOSnZzT1BUM3N5eitKMXdYcFUwOUF2K05V?=
 =?utf-8?B?LzlmL1NMWXVQK2RHUW54SUpLemtzcFVYL1RONXRLb1JqQ3hVNjFzTExuQmkv?=
 =?utf-8?B?Uml0QURPUjRHaGhGbjcrRHI2blZ6RVlkV29DdHBaS2hyU0VmcTVVWEdERWM4?=
 =?utf-8?B?eUc2UHdWaFpueEllVGZqNUNXUURrYkdLNjh2N1NKcFpzOWZCTW5oa1FnQVVr?=
 =?utf-8?B?T092RWZCTVJ0MU43YmxQaEEzVWVBS1IrNlhjdU5kODdYZGltVEpKU3RzWVhJ?=
 =?utf-8?B?bWQ3bjh5YXdkY2ZaU3k2UExTS0VCNENCY3Z2c2ZkeEJaekVYeXlCWGs5a3NW?=
 =?utf-8?B?MndxOUtrWWhJK2hQclloZWc3bGNpY29kMG50c0hqN0V4b29BMUhETFpGREVk?=
 =?utf-8?B?MHpsNS9XZ2J0VEo2Y2paY3J1eFRoTXFlcFRwcFljMGVjMnVQNHE4QnU4L1Fn?=
 =?utf-8?B?S1Avcm50NUJsTEhiakYvajFuVDMranVvbnowQjJjczNZUHNSQ1BGcWUyWENR?=
 =?utf-8?B?Q3VQWUFSaWIwR21NRVI1L29TZFcyMnI4WGlSS2lsV0c2YnpSRnNYVmRMTXJP?=
 =?utf-8?B?aXBzaDJZaVdtaFFNK0JHRTFmZndFR3pORG95Zy9YQUlZNjdYOURHQm1VUnNU?=
 =?utf-8?B?czZWanhaZm1YejE4QjZiUXBtY2dvOWtGd3huM20vcVcxb3IvbUVnMnh3L285?=
 =?utf-8?B?M1JiekVrb3FVS0ZoM2dFN2VHblVRZXZLdHZOS3hJckdoRlhXS2JYeTJFRndU?=
 =?utf-8?B?bjBOaFhzNXVOVlVQTlVPYms2NEhicTRRSzVCM0dhaTd4WkcrRTMyVXQ2ejBL?=
 =?utf-8?B?ekVXWkQxRmtsL0t2WldzWnQrYm1tYUs0cUJFVmpCOTQ2cUk2dWZQM2VTRWFL?=
 =?utf-8?Q?Zfc6HhcT8ShB6LyK2f5w//fi7dGvYeCBIMl3SSs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aedf138b-9f0b-4ea4-f992-08d93590f8bb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 15:18:21.5246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pz6XHDyYunzyGJf3POskmJsz8b5DnS8ABM3mLJbKDOdHWCihk6eiMfV+63DdGtw9vdOwme/YFGSF5m1aAENdEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6478

Some hypercalls, memory-op in particular, can return values requiring
more than 31 bits to represent. Hence the underlying layers need to make
sure they won't truncate such values. (Note that for Solaris the
function also gets renamed, to match the other OSes.)

Due to them merely propagating ioctl()'s return value, this change is
benign on Linux and Solaris. IOW there's an actual effect here only for
the BSDs and MiniOS, but even then further adjustments are needed at the
xencall<N>() level.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Ian Jackson <iwj@xenproject.org>

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


