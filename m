Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 466FC6CBD9D
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 13:29:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515672.798800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph7Vk-0001UF-J1; Tue, 28 Mar 2023 11:29:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515672.798800; Tue, 28 Mar 2023 11:29:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph7Vk-0001Ra-Fp; Tue, 28 Mar 2023 11:29:08 +0000
Received: by outflank-mailman (input) for mailman id 515672;
 Tue, 28 Mar 2023 11:29:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0K3v=7U=citrix.com=prvs=4442f050c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ph7Vj-00010O-7B
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 11:29:07 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be241b12-cd5b-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 13:29:05 +0200 (CEST)
Received: from mail-dm6nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Mar 2023 07:28:53 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM6PR03MB4953.namprd03.prod.outlook.com (2603:10b6:5:1e9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.29; Tue, 28 Mar
 2023 11:28:51 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.041; Tue, 28 Mar 2023
 11:28:50 +0000
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
X-Inumbo-ID: be241b12-cd5b-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680002945;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=TjEUYUdMJPsxywq28utGfTsnWfHiOVJrS+ZHkDc+lH0=;
  b=YHTFwhUYl9weThU1Jlq1Y8hEj2DiWQUYalZBPve90XHnnYd0vsArSLT1
   z0PcmDcpNQqAGa+GGIJXXNI5db7rSr3OBwMmnI3vHsJSw30o4r4ZEU1SD
   8j6dA6vg7pOpSQD6E798VXAMN5NAupEFXk2ibunxAC4/MFE3hLUYpE4T4
   s=;
X-IronPort-RemoteIP: 104.47.58.103
X-IronPort-MID: 105731059
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Tj7lDK//Sh7tkPDoIuUYDrUDXX+TJUtcMsCJ2f8bNWPcYEJGY0x3x
 jAXDz/QMqncZTajLYp1Oo628BgO78XUy4dqHARv+3g8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmPqob5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklA2
 sw7A283UCu73buRnKKactRVg+MKeZyD0IM34hmMzBn/JNN/GdXvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWDilUpi9ABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraXwHygAdpPRdVU8NZphAGWlk1CMSEbbguhgsa+oFODcIJ2f
 hl8Fi0G6PJaGFaQZtz0RRixunOHlh8aRdtLEuc+5R2Ny6zb+AKQDC4PSTspQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkA9L2YEaTUVUAgt7NzqoYV1hRXKJv5hGqOoitz+GRnr3
 iuH6iM5gt07ksojx6i9u1fdjFqRSoPhSwc04kDbWzyj5wYgPIq9PdXwsh7c8OpKK5ufQh+Zp
 n8YlsOC7ecIS5aQiCiKR+ZLF7asjxqYDADhbZdUN8FJ31yQF7SLJ+i8PBkWyJ9VD/s5
IronPort-HdrOrdr: A9a23:zZ+Eca/vI6rTCNTzQJ1uk+AfI+orL9Y04lQ7vn2YSXRuA6qlfq
 GV/MjzsCWetN9/YhAdcLy7Scy9qBDnhOdICOsqTM+ftWDd0QPGQr2KhbGSuAEIcBeOktK1u5
 0QFJRWOZncN3U/q+DQiTPVLz8n+rO62ZHtv8vli11Kai5LRZ1axzpYLCHeKGFKLTM2ZqYRJd
 6S5s9KvTqydW5/VKmGL3MYRfXEo9HRtL+OW29lOyIa
X-IronPort-AV: E=Sophos;i="5.98,297,1673931600"; 
   d="scan'208";a="105731059"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XuEeNh5vw1D6uwjsswnd0j75c1aXbEO5sLjvF9HXjzr96xoJ7VtiIWBpTo9c1yy/oOXrQmqMCvr0v7+nV1KEBdiaA+G+r/vPtt2Yf78ifl1gVvogif+0VsSwTQ+0bXR58p2vt4Tzf0rmgFjeUQKJLnD1X6fWO61Cls2P+RGpodpdt5xKcleLwQRq9ZpABI3RJcojQBRYXoxH1gooDDch9IVdVZnj4U6pbUBGX8XuzWC4dv0eXAQkXLQzx5nQ6JuPwpIQ+wFTSrgy9PmYwZa5yZPBYqeXr5kHsjFw5M0TVXnVg2NklWJPq1oJD04f6mqCDSQb60L76LSriibq3r/P0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDJmvBYR1N+sA6Ptq+8sGs75RXK+IWVqkBdflUBSLUQ=;
 b=Fzp0aJa276pyCzmzx8tAoTPC3EzojBsPxEbS29YaHhnvozgoq5pTIHVZQziVcr3K2LLUTGizk7/aPmBpjMCdClFMEjdAVye4FoXjEpIJb1XknUlCSsdrJ8DvXyVqAS9w2oUkwghbl4m78VPegAOFHBBmRPvFnYlYpn86sDacCQNodtKf42azAH4HSBijPyHJNnfGdkL28XiQOmkVk0Ncuvz/IbEoZDf9vP8Eyq3usZOAbhbQQRAu8iZCiw7BglIb66bu9yei0mJIrfTIdxA667SjKDJot00T+ZgB3fk8jbFovCmVAqlJGkUzoK+nK7lFHIy6/usSRDsuKMqxNBRnTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RDJmvBYR1N+sA6Ptq+8sGs75RXK+IWVqkBdflUBSLUQ=;
 b=qCAtCRt0hyhlEB8cJDgFg/fQEfkmK3XW/xWDUVDwd1sTP+N3Lnrp6SfU0blS7ubfIZXlywuJ7TBpp4r6M/nkpYwKJAt+eHQ9saSUKbzdj8iSuyRFrVbZvqo0RvP5F/d4EdkNMd+4k2qocxmWxIYSmM+y7Uu287PZmdux16Q9dKU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 28 Mar 2023 13:28:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/3] x86/hvm: Allow writes to registers on the same
 page as MSI-X table
Message-ID: <ZCLNQGXvUBxZbIGS@Air-de-Roger>
References: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
 <20230325024924.882883-2-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230325024924.882883-2-marmarek@invisiblethingslab.com>
X-ClientProxiedBy: LO2P265CA0316.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::16) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM6PR03MB4953:EE_
X-MS-Office365-Filtering-Correlation-Id: 9638985b-b67a-4558-c471-08db2f7f9a34
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y+bJYhkjDoc5k6j02WpEqJ/QHp2RcdcPXF6x3DbjwSNvEFI7oCS1x9eL+EaI3KhRjS0vzx+6sZj6cDmhhB0DwRBb2iLrJ2uPpK6uQCQHvbBj89C8DQr0vIjsB9C+PsWHVl3AZ9cRovdOvM6K/g7URTYr/DSBpLvtWw3sjiBoFh+zDBkyD4rFQxZP8TKaSm+KOvQd0KGwC0LTgzB2zLaUkbg5o1MftpxKpFMYL2Ac/LebUbvuvSuDx/Xsq75o/bwn0YGiqUpYABd9VScdFSaaUdUooBJR6BR5xIaEaVsOcsZNdXde4gYGht03rLkrCd0+A9Pe+tCEltbvTfCiuzKSaLuNDDZLmZHc4bm9eQavMo59Vs5pzIxEB/cthoWaFs1wuAHbtOLOiwrlpZ4AEBfMU7HRVuHcLHS9721Gsa/r+j0Xu5hsYMztjkFrJF6fWSRTFKYVblfwwjohyCXw53RHbOQThzai4HwsW2YzR2LM8sriuwjaYhYqtSq+H7iD0oYU74jMG9VoXqIE4fhnNSTLm+RA0tsHRNxdiQ9bM2C52XtCKbmw6s+4s+EOiCFByPDedqpZjou9CcJsJBunGRFqInDPfrnKhIiPULaVmF8HJ5U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(366004)(39860400002)(346002)(396003)(136003)(376002)(451199021)(66899021)(66574015)(83380400001)(41300700001)(85182001)(33716001)(86362001)(38100700002)(5660300002)(6486002)(8936002)(82960400001)(478600001)(66946007)(66556008)(2906002)(8676002)(6916009)(66476007)(6512007)(4326008)(54906003)(30864003)(6666004)(6506007)(186003)(316002)(9686003)(26005)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2UvR0xQNDBtWnE1Lyt3Rmt0b20xcVhvdS9sS3A5STk2SUNtVFNXREw5anFv?=
 =?utf-8?B?TVlROXdQc0V5ZzN0RDhzem5wZ3AxU2VTbE9sQ25mQndVcU90T1BNYkNhL0J4?=
 =?utf-8?B?ZmNRV1FyNHJjY0Fyak9ycW16ZnpWSU96bXlRc2wyTlRTQlE1WEw5U1phdVZ0?=
 =?utf-8?B?c1JJWkpXQm9heVJIbHdJYWgzbms5N0dGc0J6bHRSbFhLWWdiak83c09BSFVj?=
 =?utf-8?B?Y2w1RVkyUzhnVUtucjkyMFoxZDdSVWdsL3dMOHNOVWY2aTh5aXl5Rk5RQUN3?=
 =?utf-8?B?RVJRTHNOVEhNdTk4dWp6aTRudTFWNnMzYmJrbC91bHoxR0Z2T2ltY2wyNHl3?=
 =?utf-8?B?WFhoSlpPaU9WekFrSEN5SzhYZGFFY0hjaWU0eEJSbjBHQStjVFIxZWg4NW5Q?=
 =?utf-8?B?Z0E5Y21LMnV4VmhVSUJNdHNROXdzSE1sVEROVWZMNGY2eitNRHFWd2NhN0Zn?=
 =?utf-8?B?TEVWSmwwUGQxeVRWMEVUWWJMaUI4eWVkRWR5NldnajkvY0pmcjBqYXp2RzBS?=
 =?utf-8?B?OFhNUk1xcEhGN3hwakx4OCtpWEhDQ1ZzbEFteUtvc2ZsaDE2YWhyU2l0NWxr?=
 =?utf-8?B?YkttTDB4TGtPVytQdGtmdGMyd25GM1EzUFhSVWJqekdpNTJPM0ZzS0V3Wnc3?=
 =?utf-8?B?NEQvRlpnbHdDaFNOOFgrdXhFdDlFRjhackxZUVNpcUYyUUdzSmkyL01lZ1J3?=
 =?utf-8?B?K1FBd1lUc2FrbUtteHBOZVlHa1ZlU3BUanhoalg1citsVXZYR1RmbTN5bTBQ?=
 =?utf-8?B?OXk5c2RvTS8rSFNZc0pRbDU4NEVFVWdFM0JxcGZNN1Z0QUI3QmpreXRUY0Rw?=
 =?utf-8?B?YzVtQ25hNWNHVWhCM3psQUtibjlKRzdnZU9RZlJRQUN2TTMyNEtTNUJ2dUZa?=
 =?utf-8?B?Yk84MytUeUJHRDRhRlN0c2FORjhSeWdTRFNxNVkvWFpGQUFUNlNSZ3NSeHpL?=
 =?utf-8?B?NERMMDdNZ1hvT1lYMS9yRUN1N2JNa3haQy9ucUJZZnZtb1VKRDRUem9pNS9O?=
 =?utf-8?B?ajJ3V2N5d2ZZN0VqTlQ5SEJjd3Y4OTZnL2hBb1RkaGFuaHlybHZsWEk1TU5P?=
 =?utf-8?B?YS9jdmE3dEVRK0pXWVAwMFZHcHNnbmpvTlpwT2xoVU95bTZyTkluSmJtdXdx?=
 =?utf-8?B?a3VtZ3NPaDBiZzV1ZEZESDR6ckhRbUZLbU5hK0dwZlFuWExQaWtrTXoxWGJY?=
 =?utf-8?B?ZzBKWG80Vk5keDBDZ0NXQTAxUXpmaDg5dzNkQW51aVhLK3VwRG5kWWxjcnJX?=
 =?utf-8?B?N2ZHMlUrZCtuYUFndGJ5Ump5ZmxDaUNTVk5jRWR1VGRGY2piZVYrVnRxdFQ3?=
 =?utf-8?B?VkxNdzJERXFQTkxETmxmeUVHZ1pBN09BU2dTMkYydXkrZTh1SzQwdWRvNU1C?=
 =?utf-8?B?c29KT1BMWEduaE9IU2hqZEY3WEd5d3U1cWx6Q0ZoZTRMZ2FnYnlTaXRQOGhQ?=
 =?utf-8?B?cUpBTm4xN0tzanBja1Q2WGpXN3FyYjBPRHN3V1lPY2RTSUY2RDViVGVJYTBB?=
 =?utf-8?B?RGp4dzFvaEVLOXRQMVM2ZUdPKzJJZ0VGVWRFc3NncDl4MGQ4am5QWFRBNXlC?=
 =?utf-8?B?VFdqaytZTkc3ajdZcHRzdklJVDNJRitxdU0wZWs3ckdJckgyQmRQdkIzQmhJ?=
 =?utf-8?B?SC90WGhqQ1ZuQ0FRRzFrQmxYU013djE3M1U0U0hlUEdxOForZ3hxQnRRUXdz?=
 =?utf-8?B?VFFzZXVTekJxbHo2YnY5QjI3QW1GejZFb2orUVJUTmIzaWQ1NzUvdjQraHlL?=
 =?utf-8?B?OVFZRjhLUkFveko1SWxadFkvR010V1A0WStvdlJReFJ4N3kxWDludzBjSndT?=
 =?utf-8?B?WTlrY3NtaVMvcWdBaVdKMjZnMkNXa2RXRitHeWhnRy9XRlhMcUdvZnpmOG56?=
 =?utf-8?B?ZlRodENRQ3VRYWxUZ3FXV0l0WUZJcXI3ZFIvcEJvakd5dDdHUDNRb2lFR0VC?=
 =?utf-8?B?ZE0yTFpGNHpwNFFKQXQ0QTFiT0VZMGkvYjNKc3hReHNjNjhSdEtuNlVYSGNB?=
 =?utf-8?B?c2ZsKzB2MGhkZ0hTd0hCcnZySHE2YWk0Z1BrRWJaU2hJTllIdTNQb3h6OEZt?=
 =?utf-8?B?THNXOHV0WXV6N25JUFZwZEp2L24wWFZmdXpMWlRaUDVzTlk4VEY2a1Y2Nkk2?=
 =?utf-8?Q?hpzbXLJuWFnLfspraHkviUiEv?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NNFHEOc8LT6dkoHwPRlWqtJjpmbBpSh3dCJv5NMuD71WdZtP6HzQzsu+tHKc+u53ilN+1wwT90fA6/6aMJLea00gNxE2HiWT0Ru0SgvDkVVA/qBApv8o8qCs3mGNDqKa9Be/d71G+KyBGHgMURHWDBxoF+eVQ3gRupJxzyHAjUjM4YN3/97a3ruOv1JyxKMsZAReQ18ilM21MKTiJiGJSLhJykoB3DsBBJmeoEOJ8h6LFy/6w7pw0UuE92kpzq8Am1Ej262ijU7K8owPxBG722W4gnAE2/D5EJGi2sIPAcgN9GyxRtINA8M9eCqRaI3Yc7Sm4Y+6D2XZ/Bn8QLrG+vFQpf0FKODIHkyLk11r6fdPq416T8WlgMajO3osEmV/rQTDsfuml7QwJJxDUT7Mw5npSoVwsDhgqktX03Z0ieCWoU1raPJFaUYfKJ7C0gL/fIM4AoiRkEoflS1JSUVkZ5eVbWR5cAOZmiNtPtT6asEZMKrhnnUM6OagdZZN5Tx6aKj+U72pCpFUshLTzunMuRIC2Xd86Wxl3Y9b4CTbpFhpopJ+Im2rAR3DaLHh7sHFK7kYlfQ6D4IdgZiNVGykmxrRzWmu83SC1rmQqy9Rxvj3XqR8yYA2G8q5eK1n4DL74B79+be5z0zlLYyeoznAMGB4MwVByAUeLu9h679Zx+KX/SQ57Z4RCnC6cAC7WrXHphzLGXUgLEPRXFzg6HOLa89WQ0RU6QFi3L0dLy+BhneHFlQGFGpc7TZfdtJ0jcWk1CjTzFLW9QS4L57tM0uTI6yvyN1M9CGsgassR9peJbwTftdbyC2zOOGYkaDzLfChD8mBv86E+3Zn99XEzD23PSLD/EywRRTX442vmt2+jFWSxLU+KvrfmtzoKtHbvh9FWqrOE+6rcCVa+Be6NBqr5tfMXQu5CKDbpx/sq2CwP/Q=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9638985b-b67a-4558-c471-08db2f7f9a34
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 11:28:49.9277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /jV17xzB6RNGdJXZsMqUMbSWzATLZuaixypVFrRewLpHs+l3mUDNygsHwRQF1l7ods0HuNPcBnFxG38cm4hq2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4953

On Sat, Mar 25, 2023 at 03:49:23AM +0100, Marek Marczykowski-Górecki wrote:
> Some devices (notably Intel Wifi 6 AX210 card) keep auxiliary registers
> on the same page as MSI-X table. Device model (especially one in
> stubdomain) cannot really handle those, as direct writes to that page is
> refused (page is on the mmio_ro_ranges list). Instead, add internal ioreq
> server that handle those writes.
> 
> Doing this, requires correlating write location with guest view
> of MSI-X table address. Since QEMU doesn't map MSI-X table to the guest,
> it requires msixtbl_entry->gtable, which is HVM-only. Similar feature
> for PV would need to be done separately.
> 
> This can be also used to read Pending Bit Array, if it lives on the same
> page, making QEMU not needing /dev/mem access at all (especially helpful
> with lockdown enabled in dom0). If PBA lives on another page, QEMU will
> map it to the guest directly.
> If PBA lives on the same page, forbid writes and log a message.
> Technically, writes outside of PBA could be allowed, but at this moment
> the precise location of PBA isn't saved.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> v2:
>  - adjust commit message
>  - pass struct domain to msixtbl_page_handler_get_hwaddr()
>  - reduce local variables used only once
>  - log a warning if write is forbidden if MSI-X and PBA lives on the same
>    page
>  - do not passthrough unaligned accesses
>  - handle accesses both before and after MSI-X table
> ---
>  xen/arch/x86/hvm/vmsi.c        | 154 +++++++++++++++++++++++++++++++++
>  xen/arch/x86/include/asm/msi.h |   5 ++
>  xen/arch/x86/msi.c             |  38 ++++++++
>  3 files changed, 197 insertions(+)
> 
> diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
> index 9c82bf9b4ec2..9293009a4075 100644
> --- a/xen/arch/x86/hvm/vmsi.c
> +++ b/xen/arch/x86/hvm/vmsi.c
> @@ -438,6 +438,152 @@ static const struct hvm_io_ops msixtbl_mmio_ops = {
>      .write = _msixtbl_write,
>  };
>  
> +static void __iomem *msixtbl_page_handler_get_hwaddr(
> +    const struct domain *d,
> +    uint64_t address,
> +    bool write)
> +{
> +    const struct pci_dev *pdev = NULL;
> +    const struct msixtbl_entry *entry;
> +    int adj_type;

unsigned AFAICT.

> +
> +    rcu_read_lock(&msixtbl_rcu_lock);
> +    /*
> +     * Check if it's on the same page as the end of the MSI-X table, but
> +     * outside of the table itself.
> +     */
> +    list_for_each_entry( entry, &d->arch.hvm.msixtbl_list, list )
> +    {
> +        if ( PFN_DOWN(address) == PFN_DOWN(entry->gtable) &&
> +             address < entry->gtable )
> +        {
> +            adj_type = ADJ_IDX_FIRST;
> +            pdev = entry->pdev;
> +            break;
> +        }
> +        if ( PFN_DOWN(address) == PFN_DOWN(entry->gtable + entry->table_len) &&

Should be entry->gtable + entry->table_len - 1, or else you are
off-by-one.

> +             address >= entry->gtable + entry->table_len )
> +        {
> +            adj_type = ADJ_IDX_LAST;
> +            pdev = entry->pdev;
> +            break;
> +        }
> +    }
> +    rcu_read_unlock(&msixtbl_rcu_lock);
> +
> +    if ( !pdev )
> +        return NULL;
> +
> +    ASSERT(pdev->msix);
> +
> +    if ( !pdev->msix->adj_access_table_idx[adj_type] )
> +    {
> +        gdprintk(XENLOG_WARNING,
> +                 "Page for adjacent MSI-X table access not initialized for %pp\n",
> +                 pdev);
> +
> +        return NULL;
> +    }
> +
> +    /* If PBA lives on the same page too, forbid writes. */
> +    if ( write && (
> +        (adj_type == ADJ_IDX_LAST &&
> +         pdev->msix->table.last == pdev->msix->pba.first) ||
> +        (adj_type == ADJ_IDX_FIRST &&
> +         pdev->msix->table.first == pdev->msix->pba.last)) )
> +    {
> +        gdprintk(XENLOG_WARNING,
> +                 "MSI-X table and PBA of %pp live on the same page, "
> +                 "writing to other registers there is not implemented\n",
> +                 pdev);

Don't you actually need to check that the passed address falls into the
PBA array?  PBA can be sharing the same page as the MSI-X table, but
that doesn't imply there aren't holes also not used by either the PBA
or the MSI-X table in such page.

> +        return NULL;
> +    }
> +
> +    return fix_to_virt(pdev->msix->adj_access_table_idx[adj_type]) +
> +        (address & (PAGE_SIZE - 1));

You can use PAGE_OFFSET().

> +
> +}
> +
> +static bool cf_check msixtbl_page_accept(
> +        const struct hvm_io_handler *handler, const ioreq_t *r)
> +{
> +    ASSERT(r->type == IOREQ_TYPE_COPY);
> +
> +    return msixtbl_page_handler_get_hwaddr(
> +            current->domain, r->addr, r->dir == IOREQ_WRITE);

I think you want to accept it also if it's a write to the PBA, and
just drop it.  You should always pass write=false and then drop it in
msixtbl_page_write() if it falls in the PBA region (but still return
X86EMUL_OKAY).

> +}
> +
> +static int cf_check msixtbl_page_read(
> +        const struct hvm_io_handler *handler,
> +        uint64_t address, uint32_t len, uint64_t *pval)

Why use hvm_io_ops and not hvm_mmio_ops?  You only care about MMIO
accesses here.

> +{
> +    void __iomem *hwaddr;

const

I would also initialize *pval = ~0ul for safety.

> +
> +    if ( address & (len - 1) )
> +        return X86EMUL_UNHANDLEABLE;

You can use IS_ALIGNED for clarity.  In my fix for this for vPCI Jan
asked to split unaligned accesses into 1byte ones, but I think for
guests it's better to just drop them unless there's a specific case
that we need to handle.

Also you should return X86EMUL_OKAY here, as the address is handled
here, but the current way to handle it is to drop the access.

Printing a debug message can be helpful in case unaligned accesses
need to be implemented in order to support some device.

> +
> +    hwaddr = msixtbl_page_handler_get_hwaddr(
> +            current->domain, address, false);
> +
> +    if ( !hwaddr )
> +        return X86EMUL_UNHANDLEABLE;

Maybe X86EMUL_RETRY, since the page was there in the accept handler.

> +
> +    switch ( len )
> +    {
> +    case 1:
> +        *pval = readb(hwaddr);
> +        break;
> +    case 2:
> +        *pval = readw(hwaddr);
> +        break;
> +    case 4:
> +        *pval = readl(hwaddr);
> +        break;
> +    case 8:
> +        *pval = readq(hwaddr);
> +        break;

Nit: we usually add a newline after every break;

> +    default:
> +        return X86EMUL_UNHANDLEABLE;

I would rather use ASSERT_UNREACHABLE() here and fallthrough to the
return below.  Seeing such size is likely an indication of something
else gone very wrong, better to just terminate the access at once.

> +    }
> +    return X86EMUL_OKAY;
> +}
> +
> +static int cf_check msixtbl_page_write(
> +        const struct hvm_io_handler *handler,
> +        uint64_t address, uint32_t len, uint64_t val)
> +{
> +    void __iomem *hwaddr = msixtbl_page_handler_get_hwaddr(
> +            current->domain, address, true);
> +

You don't seem to check whether the access is aligned here?

Otherwise I have mostly the same comments as in msixtbl_page_read().

> +    if ( !hwaddr )
> +        return X86EMUL_UNHANDLEABLE;
> +
> +    switch ( len ) {
> +        case 1:
> +            writeb(val, hwaddr);
> +            break;
> +        case 2:
> +            writew(val, hwaddr);
> +            break;
> +        case 4:
> +            writel(val, hwaddr);
> +            break;
> +        case 8:
> +            writeq(val, hwaddr);
> +            break;
> +        default:
> +            return X86EMUL_UNHANDLEABLE;
> +    }
> +    return X86EMUL_OKAY;
> +
> +}
> +
> +static const struct hvm_io_ops msixtbl_mmio_page_ops = {
> +    .accept = msixtbl_page_accept,
> +    .read = msixtbl_page_read,
> +    .write = msixtbl_page_write,
> +};
> +
>  static void add_msixtbl_entry(struct domain *d,
>                                struct pci_dev *pdev,
>                                uint64_t gtable,
> @@ -593,6 +739,14 @@ void msixtbl_init(struct domain *d)
>          handler->type = IOREQ_TYPE_COPY;
>          handler->ops = &msixtbl_mmio_ops;
>      }
> +
> +    /* passthrough access to other registers on the same page */
> +    handler = hvm_next_io_handler(d);
> +    if ( handler )
> +    {
> +        handler->type = IOREQ_TYPE_COPY;
> +        handler->ops = &msixtbl_mmio_page_ops;
> +    }
>  }
>  
>  void msixtbl_pt_cleanup(struct domain *d)
> diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
> index a53ade95c9ad..d13cf1c1f873 100644
> --- a/xen/arch/x86/include/asm/msi.h
> +++ b/xen/arch/x86/include/asm/msi.h
> @@ -207,6 +207,10 @@ struct msg_address {
>                                         PCI_MSIX_ENTRY_SIZE + \
>                                         (~PCI_MSIX_BIRMASK & (PAGE_SIZE - 1)))
>  
> +/* indexes in adj_access_table_idx[] below */
> +#define ADJ_IDX_FIRST 0
> +#define ADJ_IDX_LAST  1
> +
>  struct arch_msix {
>      unsigned int nr_entries, used_entries;
>      struct {
> @@ -214,6 +218,7 @@ struct arch_msix {
>      } table, pba;
>      int table_refcnt[MAX_MSIX_TABLE_PAGES];
>      int table_idx[MAX_MSIX_TABLE_PAGES];
> +    int adj_access_table_idx[2];
>      spinlock_t table_lock;
>      bool host_maskall, guest_maskall;
>      domid_t warned;
> diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
> index d0bf63df1def..680853f84685 100644
> --- a/xen/arch/x86/msi.c
> +++ b/xen/arch/x86/msi.c
> @@ -961,6 +961,34 @@ static int msix_capability_init(struct pci_dev *dev,
>                  domain_crash(d);
>              /* XXX How to deal with existing mappings? */
>          }
> +
> +        /*
> +         * If the MSI-X table doesn't start at the page boundary, map the first page for
> +         * passthrough accesses.
> +         */

I think you should initialize
msix->adj_access_table_idx[ADJ_IDX_{FIRST,LAST}] to -1?

> +        if ( table_paddr & (PAGE_SIZE - 1) )
> +        {
> +            int idx = msix_get_fixmap(msix, table_paddr, table_paddr);
> +
> +            if ( idx >= 0 )
> +                msix->adj_access_table_idx[ADJ_IDX_FIRST] = idx;
> +            else
> +                gprintk(XENLOG_ERR, "Failed to map first MSI-X table page: %d\n", idx);
> +        }
> +        /*
> +         * If the MSI-X table doesn't span full page(s), map the last page for
> +         * passthrough accesses.
> +         */
> +        if ( (table_paddr + msix->nr_entries * PCI_MSIX_ENTRY_SIZE) & (PAGE_SIZE - 1) )
> +        {
> +            uint64_t entry_paddr = table_paddr + msix->nr_entries * PCI_MSIX_ENTRY_SIZE;
> +            int idx = msix_get_fixmap(msix, table_paddr, entry_paddr);
> +
> +            if ( idx >= 0 )
> +                msix->adj_access_table_idx[ADJ_IDX_LAST] = idx;
> +            else
> +                gprintk(XENLOG_ERR, "Failed to map last MSI-X table page: %d\n", idx);
> +        }
>      }
>      WARN_ON(msix->table.first != (table_paddr >> PAGE_SHIFT));
>      ++msix->used_entries;
> @@ -1090,6 +1118,16 @@ static void _pci_cleanup_msix(struct arch_msix *msix)
>              WARN();
>          msix->table.first = 0;
>          msix->table.last = 0;
> +        if ( msix->adj_access_table_idx[ADJ_IDX_FIRST] )
> +        {
> +            msix_put_fixmap(msix, msix->adj_access_table_idx[ADJ_IDX_FIRST]);
> +            msix->adj_access_table_idx[ADJ_IDX_FIRST] = 0;
> +        }
> +        if ( msix->adj_access_table_idx[ADJ_IDX_LAST] )
> +        {
> +            msix_put_fixmap(msix, msix->adj_access_table_idx[ADJ_IDX_LAST]);
> +            msix->adj_access_table_idx[ADJ_IDX_LAST] = 0;

Isn't 0 a valid idx?  You should check for >= 0 and also set
to -1 once the fixmap entry has been put.

Thanks, Roger.

