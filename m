Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D131C4D9D3B
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 15:18:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290824.493372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU80W-0002Zs-Qg; Tue, 15 Mar 2022 14:18:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290824.493372; Tue, 15 Mar 2022 14:18:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU80W-0002X8-Mb; Tue, 15 Mar 2022 14:18:40 +0000
Received: by outflank-mailman (input) for mailman id 290824;
 Tue, 15 Mar 2022 14:18:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fAQZ=T2=citrix.com=prvs=0668da279=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nU80U-0001dw-GL
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 14:18:38 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd046a9f-a46a-11ec-8eba-a37418f5ba1a;
 Tue, 15 Mar 2022 15:18:36 +0100 (CET)
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
X-Inumbo-ID: cd046a9f-a46a-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647353916;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=pmw0n5EiSj/Gg8CcI/wnNglcX0lP9n/ViiMh4cLvFpU=;
  b=SoI+ZJqFSnSTqBYxUJjYjqnrTbg1dGJDjGntwo70yB5BvKhVzD2vbAFE
   7saWV1BGLkF0CQ7M4ympod4btDr4YPlj8nwEH4vUgHyN9xGndkhkyIr7m
   TrOMwtYnkETn8KRv7XlyzU/of7IfaHcPPCo6zytdVJ21nADg/byXjoCDH
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65756333
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:mE/+P6hxmHeXQiCRtbPo2rv7X161fhAKZh0ujC45NGQN5FlHY01je
 htvXGzTb6mDZGDxLt1xPI7goU1SvsfTz4NjHgJrpCEzQSkb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWFrQ4
 YiaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YV0WPYH+uOgmaEl3SRBlEPdnx5b4A0Hq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bkmtnwjzDS+4vXLjIQrnQ5M8e1zA17ixLNaiDO
 JdHMmE0BPjGSxgVNEsvV5QUpdqxiXquXC10rXS1nrVitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzRABsXKdiewjqt6W+3i6nEmiaTcJIfEvi0++BnhHWXx3cPE1sGWF2ju/67h0WiHdVFJ
 CQpFjEG9PZoshbxF5+kAkP+8CXsUgMgt8R4SdI5xDOtxpHvsynDN3MpFB9+QeMEjZpjLdA17
 WOhk9TsDD1plbSaT3OB67uZxQ+P1TgpwXwqPnFdE1ZcizX3iMRq10+UEI4/eEKgpoetcQwc1
 Qxmu8TXa187qccQn5u28lnc695HjsiYF1Vljuk7s4/M0++YWGJHT9HwgbQ4xawZRGp8crVnl
 CNc8yR5xLpSZaxhbATXHI0w8EuVz/iEKibAplVkAoMs8T+gk1b6I9wPumAkfR05a5xeEdMMX
 KM1kVgIjHO0FCH2BZKbnqrrU5h6pUQePYmNug/ogipmPcEqKV7vENBGbk+MxWH9+HXAYolkU
 ap3hf2EVC5AYYw+lWLeb75EjdcDm3BvrUuOFMuT50n2jtKjiIu9FO5tGEGQddow8K7siFyTq
 76zwePRkE4BOAA/CwGKmbMuwacidiFqW8qp95QJKoZu4GNOQQkcNhMY+pt4E6RNlKVJjObYu
 Ha7X05T0l3kgnPbbw6NbxhehHnHBP6TcVpT0fQQAGuV
IronPort-HdrOrdr: A9a23:GpX6d6oiOgW5nfm54QGasOkaV5pIeYIsimQD101hICG9E/b5qy
 nKpp8mPHDP5Qr5NEtLpTniAsi9qA3nmqKdiLN5VYtKNzOLhILHFu9f0bc=
X-IronPort-AV: E=Sophos;i="5.90,183,1643691600"; 
   d="scan'208";a="65756333"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D3CF3vPZhvE4JNhxDFB2NTdHUbHjLVGzu1+6FDfalrCuDhPhfXUZnzRNx5FQTOI4jF6AuzpjVpUSpp+vDC54xbDYUe4eOYI5nZzIfwfNZTQHBmA++H4L3GPuYLiIdFBlBSujPtOXYsFsgFvJ/cCi1NheY7tfIESM6yAdGP4RG/6VD3PHR57aD7Jys0lD5b8jzTe3Kow8oLoDTo5DhQyAZsh9aTOnbyy3vBjmzFmOW17o9JTOg+POAP3qPwzzZu4SVFEogkrI8QzKq1AcEAXz2sSl9Gl71Wr+L5BLmcOnanRADFlDHH5ZiRHChl6dxxkR7A2+UL/jQglerjVQXk0TUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ahOA0++gPYSAW5JG8yCQm/xSXxp3ybZIcobHc88tnw=;
 b=L1C8MZjXn9wVnhJHtbobX8Ovuw2DmDxUJxGDszjdJOiDvAWRufctWLbJskBC8MglwuaN5NtioXvw/N0rjcMRjZEl+Wfjc2vjq/DP/S+OtaEmFb2CrvEkRRiaK8dfDW3kkX4ljYpMkVPXfFiXBQiGTrNA4t2eIFMea3mGcrsmj54igW9qJ6lkpsbhhPr4yHr/H2odOqYS+xV7XKIY5xMOUTjwtqtdS/SnG4kDlmUXYFpVzDBrXTDSnGjzI5NcuOmOMwvkxe4dGxTo5zdZsQK7Ny5t08VC92cLol6qmG77x7VjLh5gVYzOs4t1WmKfPVYL4CuSwGaVTafR/ufTRwNo1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ahOA0++gPYSAW5JG8yCQm/xSXxp3ybZIcobHc88tnw=;
 b=M7eF+xc3U06cztmKQWQ+esRfCzpLEOwARTrBv3IfMYbavxtxK4qnTKz5Ay4gdqR90POYvNi2L92oyH0cBXRyofPnADozDY3HastvzpCacY9pQMyScLSSYWP2yMEHZGiS+ZZBvzXE9hxTVe7IUsZna0QYhXEJ1MGdt85dum75INU=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 3/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests using legacy SSBD
Date: Tue, 15 Mar 2022 15:18:07 +0100
Message-ID: <20220315141807.22770-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220315141807.22770-1-roger.pau@citrix.com>
References: <20220315141807.22770-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0102.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50b178cf-0cca-45a4-30b3-08da068eaf40
X-MS-TrafficTypeDiagnostic: CY4PR03MB2902:EE_
X-Microsoft-Antispam-PRVS: <CY4PR03MB2902EDD96DD120C09F345E428F109@CY4PR03MB2902.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nvor1Cq1KxG1dnCaDUeSVTsW0Zepfv4INCSl0LmG7EfitUcC+KvWjvtuYakh0jy/IZEPccfPZQIaQp0zdypg1mVnYRZu4/iWl9DjH6Ccm/Y+qCfvW+DA/J114oa5rTDdE1u3wwIEbpzBHJq4rDk+MNBLr0/aOoy0ZuV8er6HS67xzyuG6r+VtH/Gvj7nCFnyR/WfO34tG0odKPI4wfJ4jLb2KaWjYWzqfvqm+nJarpI0nj4KJEMBHLD/1k0DqyX+eP7XPtD/vymR5zdvz+C+mG37Kc0EII14hRMmkHgEDSs/wCAcN5NI+2bpsgOxfY61n3eNK1yprmaPJJWdlyLzCsUwcQWQ4zd92YUbFE7w3a6Nty1ZVfFyXgdvXWfngqPF5B9cQWuQ0GP4cJtGRMZgAg32vvboJ3QWfhs9s+vFNjaXIR2l7e8HzzPalbfxMJ2PywePDREG30eAM6f3rAL1Rh5VBWCZHob//cGC5ESvSi44F9Qt+lFwPOXseZR0BagEGbVJzvUDK0yyXi+0jch+Y5uXFz0+xFkbwT4A4CfscMi+ud1FgAWzgxy8RivZ9ycLcl/gdMqEsIKSQ9eAVPSRI1BJrofpItMi+E0OyV+uB98k9KxRmTkal28CjjHfjqvqo9bUODt2QyBvUN0VjPoVQO7t2Datw9JX8xNE3LtF13zDk4EQQAwT9/z9qANxeneoZfZfbg1L5Ck4jXBB/QISJI+ZnlXrKnMr4kSm31pMIGY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(5660300002)(6506007)(38100700002)(8936002)(6486002)(6916009)(8676002)(36756003)(508600001)(82960400001)(186003)(26005)(1076003)(83380400001)(966005)(66556008)(66476007)(66946007)(86362001)(6666004)(2906002)(316002)(2616005)(54906003)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGtLbVprRkYzbkhKaDhNZDBRajlLYnV0YlNEb3hiOTJYeGNjTEphZ2xVZnRn?=
 =?utf-8?B?SDVBTXJHZ1RjSEIwOS9pUjZ6S3BDUXNYWXg1V3ZOMVRub1o1QXFZUHhRa3o4?=
 =?utf-8?B?MmZZeGdPclpRWUhvZ1dDYXhyL1IvWmp0T2RyZnUxMmd5OTRXcjkzY3luK3g5?=
 =?utf-8?B?Z3VqUCtHUWtRUG1ZZytaTzBTL2t2VENUam44VzZXMCtKbG1sdm5MSU5PUS9E?=
 =?utf-8?B?enNlMzRQb3pyK1hLbklqVFpLQUJGNkRoeXN1aEpLYmNhN0FiSDlYM0g0NkhI?=
 =?utf-8?B?N0lnTEZUSUxSVmFqNUxicm81TlVqS3BOc1h2Uk1mb2V5MGlleVBybk83bkpx?=
 =?utf-8?B?RGh2RmlLV2IrQ2ZYb1JNeTFpbUcwNFVCZUNlazhuZHhraVk2RjE4cWlLMFps?=
 =?utf-8?B?bEgwYTVWT3JqRXNvSVRBUkN2bGJIdGdEbmc0bnFScjRsdzVYdzAzZFNDeW1w?=
 =?utf-8?B?aGZTVjdqOURIS29lL2pOUGYvNGFkOXhSNk9RWURHOUxwN2d0L1E1THEyYUZJ?=
 =?utf-8?B?d2J3aDFEUitnQzg5SjQ2ZVY0N2w3ZDR0N01HRmNIaUNWYmViV1JtMXJIK0pL?=
 =?utf-8?B?YzU0TDBrYVkvbWxKOTR0a2RZSWJUZThKMnZ4RG5FZkd5cU93eVlmTmhJbndE?=
 =?utf-8?B?amR5RTFiWFBjblFOWjVETXBPYTQ1Q3JGWXBwUG9HVUFLb3UzdERySDBRUjMw?=
 =?utf-8?B?QUcrRVYzTFR0eDJPTFdQeGhTUWM3V3JiWW8zNFVYdzF1cSttL2Y4MGRjbHhR?=
 =?utf-8?B?TlJCNUpPblhXRkNGbUhJb3drcG9vUGtXY1plRnFzUzFHMTVHdVpZMTZYZ2JQ?=
 =?utf-8?B?Nmt3TmN2Y3dGeW5MMVhHb0IxMmljTzBMMU9pODBuY01UUlp2M1dGbWoxVitn?=
 =?utf-8?B?OG5FeENnZU01Ti8yQ25QSW1pODZmcDdSU056WEN3RVh4aXJ6cVdMb1F2REJs?=
 =?utf-8?B?eGlNWlNZVldMc2NTeUw1VzNFRmxKRHc0bTNTdG5PL2UzQ0ErY1JyN1M3YlUz?=
 =?utf-8?B?Y1RwUGxjU0RqN2lscWFzSVY5NkxyTU1MSGtLeklTempnV0Q1QkJhTk5BWUl6?=
 =?utf-8?B?NHh1c3ZwandoSjhuZXVXWW5HWkdibk9oQkpKdENQN3ZSNmNPN3Jsd24ybXEr?=
 =?utf-8?B?NnlieWtxejVqa1NDb21MYWVDSjR4dnhPMUtuU2QrclBWaVY0di84enRoQ2FM?=
 =?utf-8?B?ajRHQjZaN0JENTVHNmc3eUI3K1Q1eE5JL2hWVlBwd2x1a2drV0JobDBIMnZi?=
 =?utf-8?B?Wmk0OFY3WlJ5QVRWYnFNOUxNUDNrdzJsdFV5RDQvRlBOZUtyTkRCcDM5clNt?=
 =?utf-8?B?aktoSzl5dWpqK2ZkekZhTlBnUmRHN0w0RjdFTzVEaGFHWm1CcUg5N3hVb0Jk?=
 =?utf-8?B?MnRRLy92K3pxVjBJd2VOdU1oejZSVGV0L3cwVng2eVpGOWtGbUcwSnFWMW5t?=
 =?utf-8?B?TGJOQW9EQWNtSXMrQmpCb1FQaDh4WjJMbHV1Q2lCTUZzdStqdDFlb1lmUHhj?=
 =?utf-8?B?RkNLYThhRkhnVzJDOWxjU3k2ZzRUWi96UlVwVENiSFJ2OEVwRWNyQWlYSkhX?=
 =?utf-8?B?L21oZGYyUTNjTlo1cFViY2JGLytqRnRzWmJrY1lxaG5jVlpjcDl6anZ2R1ZO?=
 =?utf-8?B?LzRtVG0yRjlMVGoxOTlTV0NwYUNuaVYvVENrWUlPSmIxM1M5bnhyT3JMS1dy?=
 =?utf-8?B?anIwZXdGSE80NURVV0JhUFVpanA5a1pDYWNsMkUwTFl5K1NHb3hQNmJHVDJQ?=
 =?utf-8?B?ODNxOUVaeHJ1eUx4YW8yU3VUcTNUdUN3eW9mVE85MTRSaWVmaklIazJnRHBn?=
 =?utf-8?B?WEtuWjdhYnlKVmRkcVBRYndhRm1YOGxoQTdyTnN2ei9rbDBTTk8zeHUwSkFj?=
 =?utf-8?B?ZXQ4RWVCTWdIaUFQQ2RmemlETWxscDNpNFRoSWYwVVNIeEl3QStnWXNPUXdD?=
 =?utf-8?B?eXpKb2ZocHVnUHpPRUZOMXNiM2JFZEd5aVFNOThmYzU3eE1UbEo1OTd1Sldp?=
 =?utf-8?B?dER4aFg5MjV3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50b178cf-0cca-45a4-30b3-08da068eaf40
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 14:18:32.3407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o5jcZjORmQ6n/fr+eocHKMifrW8dC9IwiFvvgMs6/bc911Tf9R+JEF2M3/EApGacEQrsDKCZnIlwqhNpIk+RBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB2902
X-OriginatorOrg: citrix.com

Expose VIRT_SSBD to guests if the hardware supports setting SSBD in
the LS_CFG MSR (a.k.a. non-architectural way). Different AMD CPU
families use different bits in LS_CFG, so exposing VIRT_SPEC_CTRL.SSBD
allows for an unified way of exposing SSBD support to guests on AMD
hardware that's compatible migration wise, regardless of what
underlying mechanism is used to set SSBD.

Note that on AMD Family 17h (Zen 1) the value of SSBD in LS_CFG is
shared between threads on the same core, so there's extra logic in
order to synchronize the value and have SSBD set as long as one of the
threads in the core requires it to be set. Such logic also requires
extra storage for each thread state, which is allocated at
initialization time.

Do the context switching of the SSBD selection in LS_CFG between
hypervisor and guest in the same handler that's already used to switch
the value of VIRT_SPEC_CTRL in the hardware when supported.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Report legacy SSBD support using a global variable.
 - Use ro_after_init for ssbd_max_cores.
 - Handle boot_cpu_data.x86_num_siblings < 1.
 - Add comment regarding _irqsave usage in amd_set_legacy_ssbd.
---
 xen/arch/x86/cpu/amd.c         | 116 ++++++++++++++++++++++++++++-----
 xen/arch/x86/cpuid.c           |  10 +++
 xen/arch/x86/hvm/svm/svm.c     |  12 +++-
 xen/arch/x86/include/asm/amd.h |   4 ++
 xen/arch/x86/msr.c             |  22 ++++---
 xen/arch/x86/spec_ctrl.c       |   4 +-
 6 files changed, 141 insertions(+), 27 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 4999f8be2b..63d466b1df 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -48,6 +48,7 @@ boolean_param("allow_unsafe", opt_allow_unsafe);
 
 /* Signal whether the ACPI C1E quirk is required. */
 bool __read_mostly amd_acpi_c1e_quirk;
+bool __ro_after_init amd_legacy_ssbd;
 
 static inline int rdmsr_amd_safe(unsigned int msr, unsigned int *lo,
 				 unsigned int *hi)
@@ -685,23 +686,10 @@ void amd_init_lfence(struct cpuinfo_x86 *c)
  * Refer to the AMD Speculative Store Bypass whitepaper:
  * https://developer.amd.com/wp-content/resources/124441_AMD64_SpeculativeStoreBypassDisable_Whitepaper_final.pdf
  */
-void amd_init_ssbd(const struct cpuinfo_x86 *c)
+static bool set_legacy_ssbd(const struct cpuinfo_x86 *c, bool enable)
 {
 	int bit = -1;
 
-	if (cpu_has_ssb_no)
-		return;
-
-	if (cpu_has_amd_ssbd) {
-		/* Handled by common MSR_SPEC_CTRL logic */
-		return;
-	}
-
-	if (cpu_has_virt_ssbd) {
-		wrmsrl(MSR_VIRT_SPEC_CTRL, opt_ssbd ? SPEC_CTRL_SSBD : 0);
-		return;
-	}
-
 	switch (c->x86) {
 	case 0x15: bit = 54; break;
 	case 0x16: bit = 33; break;
@@ -715,20 +703,114 @@ void amd_init_ssbd(const struct cpuinfo_x86 *c)
 		if (rdmsr_safe(MSR_AMD64_LS_CFG, val) ||
 		    ({
 			    val &= ~mask;
-			    if (opt_ssbd)
+			    if (enable)
 				    val |= mask;
 			    false;
 		    }) ||
 		    wrmsr_safe(MSR_AMD64_LS_CFG, val) ||
 		    ({
 			    rdmsrl(MSR_AMD64_LS_CFG, val);
-			    (val & mask) != (opt_ssbd * mask);
+			    (val & mask) != (enable * mask);
 		    }))
 			bit = -1;
 	}
 
-	if (bit < 0)
+	return bit >= 0;
+}
+
+void amd_init_ssbd(const struct cpuinfo_x86 *c)
+{
+	if (cpu_has_ssb_no)
+		return;
+
+	if (cpu_has_amd_ssbd) {
+		/* Handled by common MSR_SPEC_CTRL logic */
+		return;
+	}
+
+	if (cpu_has_virt_ssbd) {
+		wrmsrl(MSR_VIRT_SPEC_CTRL, opt_ssbd ? SPEC_CTRL_SSBD : 0);
+		return;
+	}
+
+	if (!set_legacy_ssbd(c, opt_ssbd))
+	{
 		printk_once(XENLOG_ERR "No SSBD controls available\n");
+		if (amd_legacy_ssbd)
+			panic("CPU feature mismatch: no legacy SSBD\n");
+	}
+	else if ( c == &boot_cpu_data )
+		amd_legacy_ssbd = true;
+}
+
+static struct ssbd_core {
+    spinlock_t lock;
+    unsigned int count;
+} *ssbd_core;
+static unsigned int __ro_after_init ssbd_max_cores;
+
+bool __init amd_setup_legacy_ssbd(void)
+{
+	unsigned int i;
+
+	if (boot_cpu_data.x86 != 0x17 || boot_cpu_data.x86_num_siblings <= 1)
+		return true;
+
+	/*
+	 * One could be forgiven for thinking that c->x86_max_cores is the
+	 * correct value to use here.
+	 *
+	 * However, that value is derived from the current configuration, and
+	 * c->cpu_core_id is sparse on all but the top end CPUs.  Derive
+	 * max_cpus from ApicIdCoreIdSize which will cover any sparseness.
+	 */
+	if (boot_cpu_data.extended_cpuid_level >= 0x80000008) {
+		ssbd_max_cores = 1u << MASK_EXTR(cpuid_ecx(0x80000008), 0xf000);
+		ssbd_max_cores /= boot_cpu_data.x86_num_siblings;
+	}
+	if (!ssbd_max_cores)
+		return false;
+
+	/* Max is two sockets for Fam17h hardware. */
+	ssbd_core = xzalloc_array(struct ssbd_core, ssbd_max_cores * 2);
+	if (!ssbd_core)
+		return false;
+
+	for (i = 0; i < ssbd_max_cores * 2; i++) {
+		spin_lock_init(&ssbd_core[i].lock);
+		/* Record initial state, also applies to any hotplug CPU. */
+		if (opt_ssbd)
+			ssbd_core[i].count = boot_cpu_data.x86_num_siblings;
+	}
+
+	return true;
+}
+
+void amd_set_legacy_ssbd(bool enable)
+{
+	const struct cpuinfo_x86 *c = &current_cpu_data;
+	struct ssbd_core *core;
+	unsigned long flags;
+
+	if (c->x86 != 0x17 || c->x86_num_siblings <= 1) {
+		BUG_ON(!set_legacy_ssbd(c, enable));
+		return;
+	}
+
+	BUG_ON(c->phys_proc_id >= 2);
+	BUG_ON(c->cpu_core_id >= ssbd_max_cores);
+	core = &ssbd_core[c->phys_proc_id * ssbd_max_cores + c->cpu_core_id];
+	/*
+	 * Use irqsave variant to make check_lock() happy. When called from
+	 * vm{exit,entry}_virt_spec_ctrl GIF=0, but the state of IF could be 1,
+	 * thus fooling the spinlock check.
+	 */
+	spin_lock_irqsave(&core->lock, flags);
+	core->count += enable ? 1 : -1;
+	ASSERT(core->count <= c->x86_num_siblings);
+	if (enable ? core->count == 1 : !core->count)
+		BUG_ON(!set_legacy_ssbd(c, enable));
+	spin_unlock_irqrestore(&core->lock, flags);
 }
 
 void __init detect_zen2_null_seg_behaviour(void)
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 91e53284fc..e278fee689 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -537,6 +537,16 @@ static void __init calculate_hvm_max_policy(void)
     if ( !boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) )
         /* Clear VIRT_SSBD if VIRT_SPEC_CTRL is not exposed to guests. */
         __clear_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
+    else
+        /*
+         * Expose VIRT_SSBD if VIRT_SPEC_CTRL is supported, as that implies the
+         * underlying hardware is capable of setting SSBD using
+         * non-architectural way or VIRT_SSBD is available.
+         *
+         * Note that if the hardware supports VIRT_SSBD natively this setting
+         * will just override an already set bit.
+         */
+        __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
 
     /*
      * If Xen isn't virtualising MSR_SPEC_CTRL for HVM guests (functional
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 73a0af599b..43fc9a3f8e 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -3132,7 +3132,12 @@ void vmexit_virt_spec_ctrl(void)
         if ( val != lo )
             wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
         current->arch.msrs->virt_spec_ctrl.raw = lo;
+
+        return;
     }
+
+    if ( val != current->arch.msrs->virt_spec_ctrl.raw )
+        amd_set_legacy_ssbd(val & SPEC_CTRL_SSBD);
 }
 
 /* Called with GIF=0. */
@@ -3141,7 +3146,12 @@ void vmentry_virt_spec_ctrl(void)
     unsigned int val = current->arch.msrs->virt_spec_ctrl.raw;
 
     if ( val != (opt_ssbd ? SPEC_CTRL_SSBD : 0) )
-        wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
+    {
+        if ( cpu_has_virt_ssbd )
+            wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
+        else
+            amd_set_legacy_ssbd(val & SPEC_CTRL_SSBD);
+    }
 }
 
 /*
diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
index a82382e6bf..6a42f68542 100644
--- a/xen/arch/x86/include/asm/amd.h
+++ b/xen/arch/x86/include/asm/amd.h
@@ -151,4 +151,8 @@ void check_enable_amd_mmconf_dmi(void);
 extern bool amd_acpi_c1e_quirk;
 void amd_check_disable_c1e(unsigned int port, u8 value);
 
+extern bool amd_legacy_ssbd;
+bool amd_setup_legacy_ssbd(void);
+void amd_set_legacy_ssbd(bool enable);
+
 #endif /* __AMD_H__ */
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index b212acf29d..1f4b63a497 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -385,7 +385,10 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
         if ( !cp->extd.virt_ssbd )
             goto gp_fault;
 
-        *val = msrs->spec_ctrl.raw & SPEC_CTRL_SSBD;
+        if ( cpu_has_amd_ssbd )
+            *val = msrs->spec_ctrl.raw & SPEC_CTRL_SSBD;
+        else
+            *val = msrs->virt_spec_ctrl.raw;
         break;
 
     case MSR_AMD64_DE_CFG:
@@ -677,14 +680,17 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
         if ( !cp->extd.virt_ssbd )
             goto gp_fault;
 
-        /*
-         * Only supports SSBD bit, the rest are ignored. Only modify the SSBD
-         * bit in case other bits are set.
-         */
-        if ( val & SPEC_CTRL_SSBD )
-            msrs->spec_ctrl.raw |= SPEC_CTRL_SSBD;
+        /* Only supports SSBD bit, the rest are ignored. */
+        if ( cpu_has_amd_ssbd )
+        {
+            /* Only modify the SSBD bit in case other bits are set. */
+            if ( val & SPEC_CTRL_SSBD )
+                msrs->spec_ctrl.raw |= SPEC_CTRL_SSBD;
+            else
+                msrs->spec_ctrl.raw &= ~SPEC_CTRL_SSBD;
+        }
         else
-            msrs->spec_ctrl.raw &= ~SPEC_CTRL_SSBD;
+            msrs->virt_spec_ctrl.raw = val & SPEC_CTRL_SSBD;
         break;
 
     case MSR_AMD64_DE_CFG:
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 0d5ec877d1..495e6f9405 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -22,6 +22,7 @@
 #include <xen/param.h>
 #include <xen/warning.h>
 
+#include <asm/amd.h>
 #include <asm/hvm/svm/svm.h>
 #include <asm/microcode.h>
 #include <asm/msr.h>
@@ -1073,7 +1074,8 @@ void __init init_speculation_mitigations(void)
     }
 
     /* Support VIRT_SPEC_CTRL.SSBD if AMD_SSBD is not available. */
-    if ( opt_msr_sc_hvm && !cpu_has_amd_ssbd && cpu_has_virt_ssbd )
+    if ( opt_msr_sc_hvm && !cpu_has_amd_ssbd &&
+         (cpu_has_virt_ssbd || (amd_legacy_ssbd && amd_setup_legacy_ssbd())) )
         setup_force_cpu_cap(X86_FEATURE_VIRT_SC_MSR_HVM);
 
     /* If we have IBRS available, see whether we should use it. */
-- 
2.34.1


