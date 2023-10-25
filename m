Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5207D6C08
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 14:37:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622854.970056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvd7m-0005Cs-Fl; Wed, 25 Oct 2023 12:36:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622854.970056; Wed, 25 Oct 2023 12:36:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvd7m-0005AR-Cp; Wed, 25 Oct 2023 12:36:38 +0000
Received: by outflank-mailman (input) for mailman id 622854;
 Wed, 25 Oct 2023 12:36:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bQ/a=GH=citrix.com=prvs=655ba0516=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qvd7k-0005AL-J4
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 12:36:37 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20b29c31-7333-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 14:36:35 +0200 (CEST)
Received: from mail-dm6nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Oct 2023 08:36:31 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM6PR03MB5035.namprd03.prod.outlook.com (2603:10b6:5:1e5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.16; Wed, 25 Oct
 2023 12:36:29 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee%6]) with mapi id 15.20.6933.011; Wed, 25 Oct 2023
 12:36:28 +0000
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
X-Inumbo-ID: 20b29c31-7333-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698237394;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=lGdwjiyPXWqSEE9v0to/sLTYknY9016zhOfVj03TKRk=;
  b=hSNQWLN9j0BtD13+eViGJt0xqmWM1uTM6SyPpDHT9L91o6eQNsZanthr
   t9wE0CX0CJLRiEjOIYOiWJEnxRzz3Z8/Jsb+gVgmuSJFnm8FHOv39k51+
   ycGH+61lceHThdjiLQc/eOx81nJtMMDABn3B1Nr/vlJiPZ995pKcJiGlh
   U=;
X-CSE-ConnectionGUID: Z998/qAkTiC49sq9sq4BkA==
X-CSE-MsgGUID: YRKZ7Y2bQWyFcwLL/8nv+g==
X-IronPort-RemoteIP: 104.47.58.100
X-IronPort-MID: 126467570
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:oroyi64Vr7lEif/m0Hzm7gxRtB7GchMFZxGqfqrLsTDasY5as4F+v
 mUeUDuEO66NMTf2ct5wb4S2oB4FsJ7QztZhHFZsqHoxHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRG/ykTraCY3gtLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU355wehBtC5gZlPKgR4QeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mx
 61JeHcURxO/hsnqkamiG/J12u4gBZy+VG8fkikIITDxK98DGMiGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnEooiOCF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWx32nBt1PS+XQGvhCsWew9DMiUhcvakqVquadrgnuXcwcJ
 BlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWKTVqN+7HSqim9URX5NkcHbC4ACAcAvd/qpdhrigqVF447VqmoktfyBDf8h
 SiQqzQzjKkSishN0Lin+VfAgHSnoZ2hohMJ2zg7l1mNtmtRDLNJraTygbQHxZ6s9Lqkc2Q=
IronPort-HdrOrdr: A9a23:wtBocKPDQuvtkcBcT3T155DYdb4zR+YMi2TDiHoadfUFSKelfp
 6V9MjzjSWE7gr4WBkb+exoS5PwOE80lKQFqLX5WI3OYOCIghrNEGgP1+XfKl7bamXDH4xmpM
 BdmsFFYbGeMbEQt7eY3ODMKadE/DDxytHLuQ6x9RZQZDAvT5slwxZyCw6dHEEzbhJBH4AFGJ
 2V4dcCjya8eFwMB/7LTEUtbqzmnZnmhZjmaRkJC1oM8w+Vlw6l77b8DlyxwgoeaTVS2r0vmF
 K13jARp5/T/81T+CWsmVM73K4m2ecJ/+EzS/BkxPJlagkEwTzYHLiJE4fyxwzd5tvfo2rC2e
 O83isILoB97WjccXqypgao0w780Cw243un0lOAh2D/yPaJMA7SpPAx9L6xXyGpmXbIhusMpZ
 5jziacrd5aHBnAlCPy65zBUAxrjFO9pT4nnfQIh3JSXIMCYPsJxLZvin99AdMFBmb3+YonGO
 5hAIXV4+tXa0qTazTcsnN0yNKhU3wvFlONQ1QEuMaSzz9K9UoJuHcw1YgahDMN5Zg9Q55L66
 DNNblpjqhHSosMYad0FI46MLiKI32IRQiJPHOZIFzhGq1CMXrJp5n76K5w/u2weJATiJs0go
 nIV1lV8W4+EniedfFmHKc7giwlbF/NIwgFkPsunaSRkoeMO4bWDQ==
X-Talos-CUID: 9a23:VIa9o2wxbA5q1Wf7jNIcBgUmS5F1NWT0z0vRCBPpEn84U6TJY1y5rfY=
X-Talos-MUID: 9a23:LVKUowhDCdXWNn+YCu49UsMpBf1L0fufUko0roQosNagEWsgPSneg2Hi
X-IronPort-AV: E=Sophos;i="6.03,250,1694750400"; 
   d="scan'208";a="126467570"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E85ikOTX4nDyPl56fTp9XHk4gCXJk3rolJMjJJgNUacKccrExRpxHX6jdTun/P+Lcb9BkrdCRaeJ0y0Kh5J2W/T7cS5Ap8jPL7qlwtjqMLEbXKjX4WuRwMlYmCGlFowVnw3rOUazQVgkmQpdgbiTzMJ/nfIjpjOYb1FBH2D6pIDfmTLDOJjn+xW0j7fQT4xsGmb2oW7ool2y775qf1vs3JyqL6icVVStmAGOT+bOBhx/OHTL/EH1TvPwWHlXo2ADJcvB+I0j9PwmJ4GIX+lSqYgPKtDWPmMFOEYfP9ns+TY1Zn5ozRN/gIyMaqC3v7O1k1AjQnUfS35KoBpfe0+J9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=miIA3itVeu/9SOtcI+2d9tnxjdoJJBxINhKYhTtLQOA=;
 b=kg2ISQqJH3LFUmr50nzvzo2Ujsnopxm7fXlebQFinjSA9yzQZ7SlvSYow4Lj+jm9EXLMnGGkhc5QW3qcRdC0xolLtaY48VynQBU0qOCb6N6vDy2eei+ysFEBBJsPSucjtV78xEA2PrEgsMOFHwviM+tEd3OZHtaRLweU4IgMHItMBUZA5T8EH/OyEfg1NgiyyuVI+9hXmUkH/iNb0aslyxkfduCT/PjumYeCpz2hzvO9l5CjW4jv+NiAhyVHD4zy2D2xblpTUqFEJ2bDIQRQG/Cas1HsQeZ4CppIlbu0yQlNDY5meXW0lkgOyU7oGK+Zt1SE5zHLMA0c3FXkhpI2aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=miIA3itVeu/9SOtcI+2d9tnxjdoJJBxINhKYhTtLQOA=;
 b=ua/BZ6ptx0a6Nj8dXRktAIyxpsVu6RA8VT52+BrhC9RZ6B6ZiiAzEgeMat2ols/iEJp2tywG5XclrccSCzFfJ5OBZ4KGNybzooScTjuD1A0rT9IxKSAa3ajgseshVX7aQWbxSj7VUm87iaHM4COoNrkJoO6slV1kYseVa0mANR4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 25 Oct 2023 14:36:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/7] x86: don't allow Dom0 access to port CF9
Message-ID: <ZTkLyGE5ulk1NSpf@macbook>
References: <95129c04-f37c-9e26-e65d-786a1db2f003@suse.com>
 <74c9e6a8-9094-4646-d06f-cfe0a427bb37@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <74c9e6a8-9094-4646-d06f-cfe0a427bb37@suse.com>
X-ClientProxiedBy: MR2P264CA0010.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::22) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM6PR03MB5035:EE_
X-MS-Office365-Filtering-Correlation-Id: f2da869b-20b1-48e4-1faf-08dbd55702a2
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ljHP6TyJx1lJEpLRBmqwpGHWcsX7b/RA+JJDZSqmDKhVUJ+5CYkMnauFv5DKvqY7/sYls3b2/njRdcX09LYPvf1Y6Pd1XbB8kPDAjUfg5wOtPQ0+6ML4tHE5Jak7aUkqohbwPoBnK7tVb2edNSc50+taj/8cFewj10qRaAurbyvaBbwowyzhfgGLtpEsDWAk07bYqETPZf3ldHNGIeTrS14aObmFgQdfmvZqD+aYdUEvCG2KzBzUIZrSYrLd7zyoFe8vtLAjKFrOPmrA4QBmyw8kqU82xcvX/RWknw80RRa+qOg0gKBMPHYnlxQZxKwzL+i0+oFj9iLWi0f+vF7Dx+fnDQEgkObBcBs3uFC2nPhJjpDWouObPO2i6Y05TrNfoIPilXNYQ32Q6lxF8uORvSB34/37j7pUA8VHfOha4/4Tfbs7utLP6pLNWw9M3vo7lIlMveezNE6P5je+MU9pTMcrAF/WKx3Q+B+J/tkny9xIaXWxbkj1+6YPBA8AEd+e01wVTcbJ2uG7A/UQTBstLWamgg6NfeN7pRG6NA3/GIx/qpIdL3bzbIDIgGs3c/v+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(366004)(346002)(136003)(39860400002)(376002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(26005)(4326008)(8676002)(2906002)(5660300002)(8936002)(66946007)(82960400001)(6916009)(316002)(41300700001)(66476007)(66556008)(38100700002)(6512007)(9686003)(33716001)(54906003)(6506007)(6666004)(86362001)(478600001)(85182001)(6486002)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmdiYzhSRHo0OXF4VVVEdEpuT2JWN0dKdDJuZ0MvdnRNQ0JQcXZweUIxeE1p?=
 =?utf-8?B?VCtsd0c3ejh1eXA1NTdOMjkwRkVDL0NiRmJIM0M2ZFFwd2RzejVYUTh6eW5L?=
 =?utf-8?B?OHIySVJXdkNYRVA3dXRxeFJWNlZTZzBPL3lpMjNDMk5tOGJYTGlEVjBqVGw0?=
 =?utf-8?B?TkhGKzcyZWhOeHltcTNXSnFsMU5DdGhnR2h2RWFRY3ZmNHl6aTk3ZTNwejNR?=
 =?utf-8?B?NEhrNEk0WWlKK216Vlp4ZDFrOFJsS0pPU2RyQzhVSUkwNGZVRDZpTW0yQXdH?=
 =?utf-8?B?UUVtbGY4ZERlbHN4TVZMUW5yV0NCVUEwUFQ3dDIrb0hXNHdveWllcTk5NmVC?=
 =?utf-8?B?cjk1bDh0NitJLzBocGMrOW83MmZlTUZHbTNERjEvYVFPL2luSFVyRXdYdjlD?=
 =?utf-8?B?M3hFWit3K3hvZDVTTUd1aWpzQVhZbnpoODduY0xrSUc2QWhrUjdpOHpQM1RU?=
 =?utf-8?B?czlLVER5Y05BeWRXSjA2ZUZXU3dzd3JGQlFzVmtUUFZXSktHZFVHejVlQXNv?=
 =?utf-8?B?VCtoS1hLTGlUcTNBdEppNmdydnZobEZOL2xMSW5Ka3lFSDM4MWU4b2wzN3U4?=
 =?utf-8?B?azFlTXlTYUp5QWNDZGp6d05HeGRJaW4yb2xRWW5qMDJlaXZwMlVaUzF2OSsz?=
 =?utf-8?B?azZWQVhiQmVQa3hjNmpnNVNSaUlJRHZ0UXFjdFhoZjBNbVRvYWllQm1IL0RH?=
 =?utf-8?B?RjRRVjRXSkYxVFRDSzl2TkIvL0Z0OTRWTDdaVmlGVm1tc0t6WWVFV1c1S29G?=
 =?utf-8?B?UEVMSGV6VGw5L00rWXl6VWxjWm1xelJ3ZzNJNnZPMUY1TUJNT3h1aGdOaG9F?=
 =?utf-8?B?WnNVYVZValRDMy9XQXBUd2FHazRpL2x1a0ZTYXFoYlNKM0RTaGFRU05jUzdv?=
 =?utf-8?B?TWcwWWZ4UEVtNzVXdlhWbGhZMThRRXpUUE9xbTI5bkhuNTNKSmtLYlg1REhF?=
 =?utf-8?B?dlFtYVhQSHAvNy9XaStwZmhZdGozSmFwNjVtczM2UWd0S2N5eGVpQ2UxNTUy?=
 =?utf-8?B?a2RQK3oySVUwbUhkVDYwVzh5NGNrWUR1cWNnTzRoRzZZMmVSeVllYWdxUmRa?=
 =?utf-8?B?Qm1EZnRIMWRRNUJQdHlyeEh6Ykt2NW5uRFFVa1luMFpBd256N1NsOE5IMFNS?=
 =?utf-8?B?QUpDenppRmkzeElia3BYTkVqV01jcnpici9Iay93WUxEdVQrWEw0RWZyYytF?=
 =?utf-8?B?bS9adWpVckF1SEN6Y0hVM0lkVUhFaGF6N0QxWmtVWWVudTkxUm9LdE5pT3JW?=
 =?utf-8?B?aHZCcU5KNG9FNU5ERkNFUFh2bEM2VklSWlp5eDc0TUNPNFcrYjhnb3Y4dlZ4?=
 =?utf-8?B?Y01HT0RWTTQxVU1QZXBzcUdlSnI1OC9ENlNtUVV0NXAzdXRUYkV5QUxjNmwy?=
 =?utf-8?B?bWJXSERhVWxmYm13cTZFdVRpcUlTdjBVbFhkcXFncC80UGFuYTBiRStKcEpw?=
 =?utf-8?B?cXNKeksvblZFcXF3ODJ1M2ZFc2svRy83a0tUQmg5TUZyZmR5WVRFK0ltRzhn?=
 =?utf-8?B?U1RHOCtkRVp2ZlJkODgyRGVnam1KeDcwTkFIRzQvU1dIcDdEMzY1Rk1nTjBR?=
 =?utf-8?B?M2RkNzVkd0E4cG81ZEJaUTNEcjhqUjBGeCt5TW9RV2VCRzJURWFBK1lkTlQ2?=
 =?utf-8?B?Rkl3SXMrQks3SVh1WktyVkR2SlMxUkhmWTRqMC9CQWJ0M0lwYStoWnBvR1Zo?=
 =?utf-8?B?Y1p0TVBob3M5YXp6c2hIc0M4Z0ZGUVpyc0hqNEpGa1BCN25WV0ZFOVN6dmZY?=
 =?utf-8?B?dWg2NW40MnUyWEE1UmRCQ0VUdjdCeDJaQStiOGZvalRySXhtTm1VVysyQXoz?=
 =?utf-8?B?cXBXYldFNGV5WHRoYTJWa1lhbC85NzJ2a2xwM0VFRXNHZUxQc0tmS0pWdCto?=
 =?utf-8?B?cis5a2ZSUGNqM2ZyK3hlWXdVdnh0Y3ErbjdiSWt1T2lKR0hjV09BVDZnc253?=
 =?utf-8?B?NHl3bkJMVVgrV2lNdTc5d25ocGZGQjNmS3h3aTYzNmlKMGd2SENmTGhPV0s3?=
 =?utf-8?B?ZXpncmE0cmNiRkJsc0FWaFdsOXVEV1lXM0RPRldaVnEyK2pHelJ1MWFSbDhL?=
 =?utf-8?B?bExXRnk0MEdLV1Vzcmw4SUh3SlVvbm5JbUNyS3pnbDBESFk2SW5VZTNJcUhH?=
 =?utf-8?B?RTV1RUIvd1BpZTJnbDRVQ0JhYThUOUFLN0pmY0xzQ3VaUDV4blk0ZGZ2T3Z3?=
 =?utf-8?B?Qnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	o/J0tQi+RpqOONpWZSRpxyDTjFHR852nXEQk1jOkmWR7SJqSW+FFRY3Oj+yo4wWSkjYg6aDsqjswFOCjr2xwhxTKdPPx3nAy5xLtL6P7jbzDKTy+Ww/Jde6dYdDNlTCz//10HHNg/YJLbExOafteIjXesPiQEscv/2vvpHKdrNqZ7hL/acF4N260gHXdgitURtXfXAcheAyYZZ3Jqr2a4OMDU0WIyZd/ONisnm+qekLsYBVp8fQQXk8Zw1sCLp647OB9rH7LeKxp3tvYvaivXkWDScC2Aly0YEDNURWlD1Byl2dtXm81h5a6wq8cE/Ox1x4wbg1SNV1u0qwg1IbNZ+a97KTE5ojWuX1TDtv6OfDsES7vSDuto5B1PVXqx/Pf2EjacJl5YQtc4Tcf9kwlaDpDOY4Nda0NED/fc2Rpen4z5r0RNmeoMTPraY+u6JVgMGHS320pzWPY8n7Grq7XZl+twPUH3H9KnS4EXsMwXr/U8RUtuoe0GvTNr3xecte/grYIbSWDCXPXFBblt35Lrm3ntL+M+StZ9AQf6mWSSCIDepoBxSqKZl1T6wKy69wK04aMpo9f1dvMU1RG9coI/atKw65vWjJai6VGybLPaXcSw6NjnuT4v7UaDTF5errQyfZVaI+/OXHLhCLWkZIUtB65o+B0DIE5my4WEl6vXWHFN/tN9T+BtNRjozngr64Ro1AeCsTpflKZX1gOVdqhNs+V4iZc7/NXx7Qj9K4l0/I+N4Ys76I505gkcsMvlG5jFnE1DkzF/CKR4fa2qkbSa9p3yUAKQYuQvkIi9wfr0ZIb+vvwYkUSRofUhax74VirSddgBRc5xJjcWxVj9SsDIQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2da869b-20b1-48e4-1faf-08dbd55702a2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 12:36:28.8037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O8Aelg1IV3y+Q+znGTIZCdQD960bHzRZOMbWoFLkWcpbGcT4KiVAF4bUkYujFa/V3QTG8EZkDvpC7cZifC1wcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5035

On Thu, May 11, 2023 at 02:05:11PM +0200, Jan Beulich wrote:
> This allows to initiate machine reset, which we don't want to permit
> Dom0 to invoke that way.
> 
> While there insert blank lines and convert the sibling PCI config space
> port numbers to upper case, matching style earlier in the function.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Should we also do something about port 0x64?

Thanks, Roger.

