Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA632716195
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 15:22:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541164.843613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3zHu-0006jE-CJ; Tue, 30 May 2023 13:21:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541164.843613; Tue, 30 May 2023 13:21:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3zHu-0006gl-90; Tue, 30 May 2023 13:21:22 +0000
Received: by outflank-mailman (input) for mailman id 541164;
 Tue, 30 May 2023 13:21:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1tCH=BT=citrix.com=prvs=5074c9224=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q3zHs-0006gf-Q9
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 13:21:21 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db05d8b3-feec-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 15:21:17 +0200 (CEST)
Received: from mail-mw2nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 May 2023 09:21:10 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ2PR03MB7096.namprd03.prod.outlook.com (2603:10b6:a03:501::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Tue, 30 May
 2023 13:21:07 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6433.020; Tue, 30 May 2023
 13:21:07 +0000
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
X-Inumbo-ID: db05d8b3-feec-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685452877;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=c6m9rV6kn4YukBz5sQHUkC/EEUKrjL6Of7kEgL+seck=;
  b=CiAcBbbusSMAcgVyi8UC5falnO/1bf557xHYGLmfpdSfjf1evn+yvWIm
   n5uewSSnJCBcgQ4sKneRiGu0xzH0Y/MwYncIEOmihkt6cHnbbfjyXYqY3
   lvEGjK4xITKsopcJ6odYpJiwNUSoRjs4cPNfbV2wRAp6snVI4vBew+F1G
   I=;
X-IronPort-RemoteIP: 104.47.55.102
X-IronPort-MID: 110252937
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:zCK/9q5yXIu6wobpYDAKigxRtHbHchMFZxGqfqrLsTDasY5as4F+v
 mEXUD+HPP6MYmT2Loh+aIqwpxwB6pTUndRrSFRqryFkHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35JwehBtC5gZlPa0Q5AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mp
 MwnLjATRzG4iLiS0O/hE8R23/YtI5y+VG8fkikIITDxK98DGMiGZpqQoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkUooiOKF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxHuhBdhDT+LQGvhCuXOB6FYuVFosdXDgvOSc1lS+RPd7E
 hlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWKTVqN+7HSqim9UQAXMGsDaCksXQYDpd75r+kblQnTR9xuFKq0iNzdGjzqx
 T2O6i8kiN07k8kP0Kmq+EHdtDilrJPJUw0d6x3eWySu6QYRTISofZCy4F7Xq/NJNp+ET0Kpt
 WIB3cOZ6YgmB5aHnj2AW+UJEbSg4d6KNTTdhRhkGJxJ3z2p+mW/dIFKpj9kLUFiM90sZjPiJ
 kTUvGt575hVOnyoYaZpYpmZBMEjzKymHtPgPs04dfJLa5l1MQqYpidnYBfI23i3yRB216YiJ
 Z2cbMCgS24ADrhqxya3QOFb1qI3wic5xiXYQpWTIwmb7IdyrUW9Ed8tWGZipMhjhE9YiG05K
 +piCvY=
IronPort-HdrOrdr: A9a23:WKG+kapjUXfcCaF/jta27zkaV5r3eYIsimQD101hICG9Ffbo8v
 xG/c5rtyMc7Qx7ZJhOo7y90da7MArhHPJOjrX5RI3SIDUO2lHIEGgS1/qA/9S6IVyHygc178
 4JGZSWYOecMbEQt6bHCWeDferJUrK8gcaVbXe09QYLcen4AJsQizuR/TzraHGf22J9dOEE/L
 723Ls7mwad
X-Talos-CUID: =?us-ascii?q?9a23=3A7OBrC2kwxWYC+7u5ycUJrKs2VmPXOSzt83HQPWa?=
 =?us-ascii?q?ZMmkzbK3IEwa94vpWncU7zg=3D=3D?=
X-Talos-MUID: 9a23:iGz9kwprm3xye07dpsUezwhMJulS3vjpMmAmyogbnpWeNTNVHw7I2Q==
X-IronPort-AV: E=Sophos;i="6.00,204,1681185600"; 
   d="scan'208";a="110252937"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZJfh4DltdHj/nDy2ujjXm/5xrO7fYyrSMuuJfvSAkcPAkqDDk99PzRGoQohf9lJXzN/Y4cstyRKTQ7m+JssAK52usjxOQSom8K2pn/aBtISGcg6SuaTSY1hWBm/AcnazK4WJMV37yFj/U+VqZTYvRyzrpZpl11E+rgcpQhZyeHmSlWPUOCVTUmXeCijBepVyjRThliCXMQ/2k+Xk+UVhLw8xFoCjwAdQhRQXmwMH7QBYOF/aWQzRk/RWxbBh6ufQDglTHzWbPrcqYiw0POzQO3qqmXVIUgK0Iqz0TVRLm5HwKv7dHLKX/PC2/UqV9zKeHaAsvd4M+1j9cdy19A7cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vdftul0ofhlyXkKxCRAToYyfaEmztmaHlBduCfR8TJM=;
 b=b1c6wDIp0Ly90c0XW2kT1Jc1OVJ++9+g1AIgpz5odYn96RywR8LmscVmQX8I69bu0DUQL1YO/hx5FqidE2bjL8Wwb+Cq6q0oHzo39wOsqnZyF47MJ712xNcy91VCm3hNAgqLsain6XnPLgJnaUVViIudlxsWMYAd/KcxJjUV5cZaD3ZWhyg2pQo2nBT/moUM0oHmbWEh29BhsKOWzPhbqD2D+RKJQpUSl3FwsOuLpsOSgSpjl/k6abFZPMMMJr3cKW30+N1sOm9wEofz3D/QtGDyL7ezQQCxllCKrKdYRy/DVQ53iyPUJDmtYasDv+HQ40bmq08FTI9icZtMahKhpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vdftul0ofhlyXkKxCRAToYyfaEmztmaHlBduCfR8TJM=;
 b=piQUgBfuUCZcNg4dEeCpm5z04heZa9vyp39/VJ8JZKXp2YFlP1hJ9m72U8lIpQpsZMsFNVIq/K5AjKU1L5dWyCWhgIIH0NlU9R6xYo3R/r71uOr+9wo8iqlbESEHSi6nOeRZNZ+KbHs+PAzPhY2ubrNJ54ipa63b8d+uqazkU4U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 30 May 2023 15:21:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Bobby Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: Re: [PATCH v2 1/2] x86: annotate entry points with type and size
Message-ID: <ZHX4PR56MQZQCVUX@Air-de-Roger>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <db10bc3d-962e-72a7-b53d-93a7ddd7f3ef@suse.com>
 <fd492a4a-11ba-b63a-daf4-99697db0db0e@suse.com>
 <ZHSp9+ouRrXFEY4R@Air-de-Roger>
 <bba057a2-0a68-bf05-9a92-59546b52c73c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bba057a2-0a68-bf05-9a92-59546b52c73c@suse.com>
X-ClientProxiedBy: LO2P265CA0134.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::26) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ2PR03MB7096:EE_
X-MS-Office365-Filtering-Correlation-Id: c780f6fc-3eab-4bec-91c8-08db6110ba08
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sW+mOiD4nYO0NpOfTgprihms/1yvnl66KlVLrFMrylR+XskGrPB9dLa9KelDGMjPljBvIN26Tw2bQEzeJf3mhYHDkCpcaCmHztWVb+iVTqfhttiQMujqZf+FJ0FD89kiik9pjxgnybkAkuVEIrvDZ7umGm7DmE9UXSyTjsrZfEhaJJ1cntqE2pOoDvq1mY+HDXGOyti6D3/0V0mZxrxFP7yROT9wXnf7+WIHI3zcJmcW/HNX/M+XDYLFS00C8dXuHqS86l6WpTLmPCwW6Q+fPnF7e2huCEu52u/k6me0Ayu9ByfR6QOBa2QUg3E+asw/A1wMwT4eP1KL6mr+1+bJvRdDj8KPpd2z94G1Vz8dUWICD8oA5MuBTQ6FCRUVEDQnI5877m8Oc5RwA58co3/ch1+FyAo7ZAEbYpOvS60OAzyBOw/pd5JMDEA1P09S0DSwDddfC6UhEHGfbqSoXBi3gHGYg8nZ0qS36oBOGM0pscTsy06O+SuaQQC3A1PRLK2ryrrKQM2+JB+0CsagYFlb6DZunn4eXkQA7yKeKNWfLIAAqruIGkT5752kyxrtahgk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(136003)(366004)(346002)(376002)(396003)(39860400002)(451199021)(186003)(26005)(53546011)(9686003)(6506007)(6486002)(6512007)(33656002)(316002)(7416002)(6666004)(2906002)(85182001)(5660300002)(41300700001)(8676002)(8936002)(478600001)(82960400001)(38100700002)(54906003)(6916009)(4326008)(86362001)(66946007)(33716001)(83380400001)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVVBdXVDc1hGVzNUSFBvZUlzdG9jV3UrLy8zajk1Q21iUjBRblRpaFdWZUlk?=
 =?utf-8?B?MUd3L05XT3ZUY3owWjA1aXk4TlR0ZkhSUnF5aUpsUFJjMlU1allrUDFnVmNG?=
 =?utf-8?B?TnNoUkU4VzhHK1FCb25aOW1UNWZXQ05LTUJlL3BDRFNPNUYwSUFISTdmSDNN?=
 =?utf-8?B?Si95NVJTQzU4TFpibDF1TGNUV2ZaMlJldkk2cXVXMnN3bEZsQmhvNUlXa0Zl?=
 =?utf-8?B?ZzR1SWVFdFFVeHF2akxia2lkTjdiRStVM0IwMEgvQ1VKeW81TG13L2hENDJX?=
 =?utf-8?B?SFVFWUYxdjY2MzhNQzlVL1NMbnFMbXEyL3BiL214YzExQXU0NVRXbTlvRzBW?=
 =?utf-8?B?S2R6VG45RzdTRTFqV1h1QUhRMXhDdEpkZWtXNGZoVGhkY0lrcHZJZmZtUnpH?=
 =?utf-8?B?ejJvQ2VNVWVDdnVvbS9oL1lUTjVGS20xQ1pWdk4vZ0t2b3JrSk0zTm5hOTAv?=
 =?utf-8?B?UjAyYWFGZDRUcWlBNnBmNEVkSDVuRSt0SjVDUGhscUN6Vm41QVNPbXdMaGJk?=
 =?utf-8?B?Slludm5NdVJTKzlYdnNuM2RxVFk0dkNoaFdHNXhsVmdudzlPWWsyTlV0dEsx?=
 =?utf-8?B?M3F2OEtibEVBN3RXN3JDRHhEY1A3TTBlNFhhek9hcGZsbGNoU0lhNUh0Znha?=
 =?utf-8?B?YWNpaXVvTUNtSGs2THdWditaOXh2RC9rM3VLZ1pDVlB6cXQyeWg2SG9uQm80?=
 =?utf-8?B?b3lBcUoxaW1sR05QY0NWWmJwYlppRGszaytYc010ZlBFbmxSZUdmd2h5Ti9K?=
 =?utf-8?B?TzBJVTRvbUtvbWNBQUIweEFiTVZMUzB2anVENWVBMkRIM3V2bXlmcnNsRzIx?=
 =?utf-8?B?T2hVR2kra3pESU5EM1lKQnp4akRCZ2ZTaVc3SGJQS1ZSdzN6U3gvMmhra0dZ?=
 =?utf-8?B?czh1T2tDM2tBbUt6MzF4MHRaMW0yaHo0dllYODNyL0t2WkJSMlo4by8yNnFN?=
 =?utf-8?B?TGUwMHhpOFdUSXg0K3FmV0hmSFZLSDdFSGgrdHVlUFp1Y21FVzV1ZGsxbW50?=
 =?utf-8?B?SEFqWTR3MUdiSnlRWFdnRnVVWkIyQ2lkWWJMeXh4WDgwdUozb2FBTHF0ZFpH?=
 =?utf-8?B?TXZaOUtFQ1JncXZGcmRvSjRHQ1hIL1B5bEV5TTdyZE85bHYrSEVvbWZMalUw?=
 =?utf-8?B?ZGU4a3ovTmgwRTRyVkd4Zi8zZDZzU0FKMUp0RFFBMW1UczBCZzhydDFmV1VH?=
 =?utf-8?B?K0FKclRGSHJ2SVNyeisxMTkrUDRYV0FJNWE3SEVJejltUU14WDQwY3FpdVZ3?=
 =?utf-8?B?T2JCVld5eHJUNVQ5SU9MRWxHeXFTVVk2UU1Pa0dtc0FGeUxNUG92SCs0QUdl?=
 =?utf-8?B?RStLY3dzSzZlTEQ2NXoyaEgxLy9ONnY1NHJGOTlKSEZKV0gxQ1lJU2taVExo?=
 =?utf-8?B?VE05MHN5TFRRbXRGZTI2aGZQcml6SzROWENhU0RXTjZ1NzlMVG91U1BwMGwy?=
 =?utf-8?B?QW9DM3VyVGVzMVpVYmo1aFlwK3N3eldpM2pHbzBHZ1lKZHQrekExSjBaWUNZ?=
 =?utf-8?B?Ykw4ZlMyMEw5Y3F5UGFodkdMZG5MOFBlVHZPSjNEQXBSV2RrMEtsWjdHcmxJ?=
 =?utf-8?B?MGlRMHdJUjc5cjc4djUydmJoZ1FBKzlhc01vTUZjOTVvbWd6bzEvTituTHlO?=
 =?utf-8?B?Y1RKT0dqQmtLckpyZEN3ajlmQythOWVIYTdWMEtteGl0RkhGS3NsaE9WQnNV?=
 =?utf-8?B?RUJQclJ3MktjaGl1OHpNRjdRMXJlZ0F0ME4ySnY5b25kUFpVdWFxblVsNDd4?=
 =?utf-8?B?RHRaTW52Z3BFMWNZWHlrdUZTeFBMaUl5VVVmWDBnM2xHTm9LQnZRWGF4RkNH?=
 =?utf-8?B?ZG41eFR2d0tBakJNREgwa29rQ3VFL1RjZzZKNjRMYjgzTVhoSHZISEtrbVg1?=
 =?utf-8?B?RDJXNGUxWTN2TUVRVDloS3dxZ1R0Z003cDF0a25JdVZiNWJKTkhKQzlRSDFN?=
 =?utf-8?B?RmtadFlxUlV6TFBDMmk2T1JYbjNvbkl0djZ5ZDB0ZTQ4aGVUTHBlNUZkVlpR?=
 =?utf-8?B?OE1sQW9HT0JYcm1YOEVDaFBLRzQ5dTNaWlFsT2FhSjJyQ252dG1SWjl0ZWNo?=
 =?utf-8?B?b2JGVmlwaVduQ1c1bEM0RStPU2F4VmNVMWd0c0g0bjFHMk1seEx2QSt5WDNK?=
 =?utf-8?Q?RhUpZ1GFS3b0+Nsv2TfMmP9we?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?bHZGMjgzWE9vN0svZmU0MTA3bnRhbGZrMHNueVM0TTVmdC9jWmIwS3dvTmhN?=
 =?utf-8?B?SXFESFZXRVJhRVpvMFhOMGFINDh1M1hJNUtmeGE5SGFSdUdEbWg2RXJoYXR4?=
 =?utf-8?B?R1NKV29XSm5Zd3VtY0tOTDd6NSs5RSs3aUE0Z3pNZUh3WDYwWGZHQ3BKYWJ2?=
 =?utf-8?B?TzVQV2JIMTluNkF5MnN5a1RjUXNzdU5hYVhrVG51TXI5RVBEMEVXSmF6VG9W?=
 =?utf-8?B?Nk9HbFpiMHVKSU1ha2k4V0h6TFpMTklQVHF5STVQUkpRa25IdVl0S3FrVTJ0?=
 =?utf-8?B?M3VGUmlqNmxIVHpvaXREUkI5dkdGWFJHZll4QWVLWFBXNFQwWDJKS2Fod0NY?=
 =?utf-8?B?N0tYdWRKdk1aU0tHZXYvSXUxNTBBS3pzWDd2a0dKaTlKUlNzZzcwNzdTSEgz?=
 =?utf-8?B?ODhGeFhSWkJPc1J4U0p6VElVTHJSTng5Y0oyVENTN1ZMQ0kreVN5SEl3ZjVI?=
 =?utf-8?B?cit4WnVhd0d1MEM2c3ZFcEM3a0FlTVZGOWV0a0RPdk4ramRaVTVXWU5vYTFN?=
 =?utf-8?B?VThyM1hzTXFSeUpjbHdzdmZ2c1UwR1lZSXEzbmoyc0haVG1od095d05ISUNB?=
 =?utf-8?B?ZjNncFBsb3pkcDVuUGZzbURSMnJiZWFsVndRK2JocnZYT0E2ZDMzaW1nVURs?=
 =?utf-8?B?b0NjUDBSZUFibFp0VUZzVjVidFRqanpHemZMdWVORExKMzVWdGV0eWNuQzFm?=
 =?utf-8?B?MUNyQVg0RHFXRFBmcXJkTi82SUhPTmh1SVNBRnR4NDhXdHY0KyszNzZhR21m?=
 =?utf-8?B?UlhSOUJvQjlTU1JMb3laTzFIRkVRTDFXTUl3ZFFrUEhnbW5aaWdWVkN5cjls?=
 =?utf-8?B?enYvSkdqdkdzVmk0TDN6czlZeUJ5RGphZFVma1BjbEp1d0ZNVGxOZnFVTkZP?=
 =?utf-8?B?Y0VKa1F5SHJBTURZc0ZFRHVEYTBDdU9sbTBMNXFhWllwRUcraW9XUjFDTjlD?=
 =?utf-8?B?WlQ0MHl6U0hHVHBsUW9VdnZrajQ5VGpoa1JHUzNBWk1wZ0k2L2NLYmQ1UExQ?=
 =?utf-8?B?TUdIanFFZFViT2hPcWErOXBRR2dWMVN6b3ZWRkEwZ1lnQktEZmxpSFIwL21t?=
 =?utf-8?B?ZXBGYkxudHFLYVdDWCtFMFJnMy9oZEV3Q24rTW5neVJKR3pBS3NBVWs0eXJl?=
 =?utf-8?B?YUo3SGNpQWM3dDlaazRMeDE4UWt4eDRmMDlJbUxSVU1iVFBtaHFEbk5obnpY?=
 =?utf-8?B?US9mT1hESmRJU0VoRG8vWjhOcDZIYWZiejRYZWxUK2VWT2FuNGZONTF3Wit0?=
 =?utf-8?Q?gmnbUqxuLpNudnI?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c780f6fc-3eab-4bec-91c8-08db6110ba08
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 13:21:07.5251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YbyAiEmsT7JiM271UlODeyGA4WNPyL0Q9hVtyQulikm6ZtrX5Q5mA4V3qApge9024EefQrOmrOzD7c29N9H0RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7096

On Tue, May 30, 2023 at 10:06:27AM +0200, Jan Beulich wrote:
> On 29.05.2023 15:34, Roger Pau Monné wrote:
> > On Tue, May 23, 2023 at 01:30:51PM +0200, Jan Beulich wrote:
> >> Note that the FB-label in autogen_stubs() cannot be converted just yet:
> >> Such labels cannot be used with .type. We could further diverge from
> >> Linux'es model and avoid setting STT_NOTYPE explicitly (that's the type
> >> labels get by default anyway).
> >>
> >> Note that we can't use ALIGN() (in place of SYM_ALIGN()) as long as we
> >> still have ALIGN.
> > 
> > FWIW, as I'm looking into using the newly added macros in order to add
> > annotations suitable for live-patching, I would need to switch some of
> > the LABEL usages into it's own functions, as it's not possible to
> > livepatch a function that has labels jumped into from code paths
> > outside of the function.
> 
> Hmm, I'm not sure what the best way is to overcome that restriction. I'm
> not convinced we want to arbitrarily name things "functions".

Any external entry point in the middle of a function-like block will
prevent it from being live patched.

If you want I can try to do a pass on top of your patch and see how
that would end up looking.  I'm attempting to think about other
solutions, but every other solution seems quite horrible.

> >> --- a/xen/arch/x86/include/asm/asm_defns.h
> >> +++ b/xen/arch/x86/include/asm/asm_defns.h
> >> @@ -81,6 +81,45 @@ register unsigned long current_stack_poi
> >>  
> >>  #ifdef __ASSEMBLY__
> >>  
> >> +#define SYM_ALIGN(algn...) .balign algn
> >> +
> >> +#define SYM_L_GLOBAL(name) .globl name
> >> +#define SYM_L_WEAK(name)   .weak name
> > 
> > Won't this better be added when required?  I can't spot any weak
> > symbols in assembly ATM, and you don't introduce any _WEAK macro
> > variants below.
> 
> Well, Andrew specifically mentioned to desire to also have Linux'es
> support for weak symbols. Hence I decided to add it here despite
> (for now) being unused). I can certainly drop that again, but in
> particular if we wanted to use the scheme globally, I think we may
> want to make it "complete".

OK, as long as we know it's unused.

> >> +#define SYM_L_LOCAL(name)  /* nothing */
> >> +
> >> +#define SYM_T_FUNC         STT_FUNC
> >> +#define SYM_T_DATA         STT_OBJECT
> >> +#define SYM_T_NONE         STT_NOTYPE
> >> +
> >> +#define SYM(name, typ, linkage, algn...)          \
> >> +        .type name, SYM_T_ ## typ;                \
> >> +        SYM_L_ ## linkage(name);                  \
> >> +        SYM_ALIGN(algn);                          \
> >> +        name:
> >> +
> >> +#define END(name) .size name, . - name
> >> +
> >> +#define ARG1_(x, y...) (x)
> >> +#define ARG2_(x, y...) ARG1_(y)
> >> +
> >> +#define LAST__(nr) ARG ## nr ## _
> >> +#define LAST_(nr)  LAST__(nr)
> >> +#define LAST(x, y...) LAST_(count_args(x, ## y))(x, ## y)
> > 
> > I find LAST not very descriptive, won't it better be named OPTIONAL()
> > or similar? (and maybe placed in lib.h?)
> 
> I don't think OPTIONAL describes the purpose. I truly mean "last" here.
> As to placing in lib.h - perhaps, but then we may want to have forms
> with more than 2 arguments right away (and it would be a little unclear
> how far up to go).

Hm, I would be fine with adding that version with just 2 arguments, as
it's better to have the helper in a generic place IMO.

> >> +
> >> +#define FUNC(name, algn...) \
> >> +        SYM(name, FUNC, GLOBAL, LAST(16, ## algn), 0x90)
> > 
> > A rant, should the alignment of functions use a different padding?
> > (ie: ret or ud2?) In order to prevent stray jumps falling in the
> > padding and fall trough into the next function.  That would also
> > prevent the implicit fall trough used in some places.
> 
> Yes, but that's a separate topic (for which iirc patches are pending
> as well, just of course not integrated with the work here. There's
> the slight risk of overlooking some "fall-through" case ...

Oh, OK, wasn't aware patches are floating for this already, just came
across it while reviewing.

> >> --- a/xen/arch/x86/x86_64/compat/entry.S
> >> +++ b/xen/arch/x86/x86_64/compat/entry.S
> >> @@ -8,10 +8,11 @@
> >>  #include <asm/page.h>
> >>  #include <asm/processor.h>
> >>  #include <asm/desc.h>
> >> +#include <xen/lib.h>
> > 
> > Shouldn't the inclusion of lib.h be in asm_defs.h, as that's where the
> > usage of count_args() resides? (I assume that's why lib.h is added
> > here).
> 
> When the uses are in macros I'm always largely undecided, and I slightly
> tend towards the (in general, perhaps not overly relevant here) "less
> dependencies" solution. As in: Source files not using the macros which
> use count_args() also don't need libs.h then.

I tend to prefer headers to be self contained, as it overall leads to
a clearer set of includes in source files.  It's not obvious why
entry.S needs lib.h unless the asm_macros.h usage is taken into
account.

> >>          sti
> >>          call  do_softirq
> >>          jmp   compat_test_all_events
> >>  
> >> -        ALIGN
> >>  /* %rbx: struct vcpu, %rdx: struct trap_bounce */
> >> -.Lcompat_process_trapbounce:
> >> +LABEL_LOCAL(.Lcompat_process_trapbounce)
> > 
> > It's my understanding that here the '.L' prefix is pointless, since
> > LABEL_LOCAL() will forcefully create a symbol for the label due to the
> > usage of .type?
> 
> I don't think .type has this effect. There's certainly no such label in
> the symbol table of the object file I have as a result.

I was expecting .type to force the creation of a symbol, so the '.L'
prefix does prevent the symbol from being created even if .type is
specified.

Shouldn't the assembler complain that we are attempting to set a type
for a not present symbol?

Thanks, Roger.

