Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF2661141C
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 16:09:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.432092.684804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooQ2K-00089h-ND; Fri, 28 Oct 2022 14:08:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432092.684804; Fri, 28 Oct 2022 14:08:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooQ2K-00087L-Jw; Fri, 28 Oct 2022 14:08:40 +0000
Received: by outflank-mailman (input) for mailman id 432092;
 Fri, 28 Oct 2022 14:08:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=liZE=25=citrix.com=prvs=293a53108=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1ooQ2I-00087F-VY
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 14:08:39 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01c3ca1e-56ca-11ed-8fd0-01056ac49cbb;
 Fri, 28 Oct 2022 16:08:35 +0200 (CEST)
Received: from mail-dm6nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Oct 2022 10:08:22 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by MN2PR03MB4941.namprd03.prod.outlook.com (2603:10b6:208:1a6::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 14:08:20 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::5d4b:6b1d:efc2:20e5]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::5d4b:6b1d:efc2:20e5%8]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 14:08:20 +0000
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
X-Inumbo-ID: 01c3ca1e-56ca-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666966115;
  h=from:to:subject:date:message-id:mime-version;
  bh=IX5bE3d8w10EbdF50wfkcZWE8qhZTI4jDIK8O7RLuJE=;
  b=hMgp/revVFXp7fNwPJ8aqTT8l/IKiFodn4rwtFngSxh5KRXWULCCjCde
   fvXcgUzUwtAaIb3uiPLXTmDKbdtIvIwnHUGX0f3yJ1Hm7suhZB7gaVAHz
   wK433wi+3/RF3TwRDDT7zk9ilfNzxgswplcdjODtc9nw4WRcMRIEm6wXF
   k=;
X-IronPort-RemoteIP: 104.47.58.102
X-IronPort-MID: 86247844
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23: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
IronPort-HdrOrdr: A9a23:rv3M7KAMcq3hgwLlHegvsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+VAssQIb6Km90ci7MDrhHPtOjbX5Uo3SODUO1FHIEGgA1/qr/9SDIVyYygc178
 4JHMZD4bbLfDtHZLPBkWyF+qEbsbu6Gc6T5dv2/jNId0VHeqtg5wB2BkKwCUttXjRLApI/Cd
 61+tdHjyDIQwVcUu2LQl0+G8TTrdzCk5zrJTQcAQQ81QWIhTS0rJbnDhmj2AsEWT8n+8ZuzY
 GFqX202kyQiYD09vbu7R6T032Qoqqg9jJ3Pr3CtiHSEESutu/nXvUiZ1TIhkFMnAjm0idQrD
 CLmWZqAy070QKtQkil5RTqwAXuyzAo9jvrzkKZm2LqpYjjSCs9ENcpv/MsTvNIg3BQxu2U/Z
 g7rV5xjaAneC/ojWD4/ZzFRhtqnk27rT4rlvMSlWVWVc8bZKVKpYIS8UtJGNNYdRiKnrwPAa
 1rFoXR9fxWeVSVYzTQuXRu2sWlWjA2Eg2dSkYPt8SJ23xdnWx/zUEf2MsD901wg64VWt1B/a
 DJI65onLZBQosfar98Hv4IRY+tBmnEUXv3QRGvyJTcZdE60l722uDKCe8OlZ2XkbQzveQPsY
 WEVk9EvmgvfE+rAdGS3fRwg2HwfFk=
X-IronPort-AV: E=Sophos;i="5.95,221,1661832000"; 
   d="asc'?scan'208";a="86247844"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e2DyyeKnjNSbfNSBuKeoJ45j5DZnYjIOSduP4gdlGuZXFur82NmC/ISpJuCOE+lvezB6z29K+wxXwQpuOKdu1Hi51lyPAZBKyxrN6RF7eFQqM24z+68+ghdkAkunsrVoKCcVqbC6MHW4whafc83cIi93of11f9mg4YVcCAIDX7GSm1zjzZ+7RC1ZkHCWpN/bn9vvB+NaaEpfBjEgfTirEn9STRN80wWgW3kxr4QJKwRqxMkMXf4U7rP5834K74aG8tkUAQ8TV9tcu0VbacA6IujxV7+XA/TtX8EbL2r+DFSNL54EsDmjtGyKERxQMI56+EbZTetj0WMlC3Yf9HcMxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ILY2e1JF6EHNwafO8OS3b56l5srkzzN/om2u2AW4+0=;
 b=LkP+WLLWTq1FxIOVT1yi/Q+ArQMrDL307YbR7caF1pNNoR/XLDNpyLhNSimqvzGQISaewjtu8QdS/3XbPQ6YRZTc6jmJvfKlwqwoSer68oA6893nz9mq13Ee1mLuBrZR4I6m6UFCswbQFDAsihvI7dgrdectf2GHJfx6DDUpfo6d6LzQ0FEEv67TYVMotVBCTjlPwNtepeTpLifjmqiHCCpQ7r3ZJgQThfitom4zIb2jb7TIWjbuXbYKTEv900Psd3AuZJMi3OgP8IXL/hTU7QPIYWilNjy6kyoCjiqWz21cXqOqvaNrer9zM9SBXqn3gLtH+ntg6mxXdaTklsYPJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ILY2e1JF6EHNwafO8OS3b56l5srkzzN/om2u2AW4+0=;
 b=ROggbLD/jtXxrpkRbb0DMKHTI/nIg68nXYHMssbmOZMruH/Cchy6wjq4pIBu+pB9kjGC6YLFViGOrdyQDySOvwpdxOFP3a+SB2V8A9w5B20AtqQIL9vz5si12ofAc0OonAOVqnAhZVZtNt3f03NZmy6oeTC6jovJUjN0qEiirgg=
From: George Dunlap <George.Dunlap@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>, Tamas K Lengyel
	<tamas.k.lengyel@gmail.com>, "intel-xen@intel.com" <intel-xen@intel.com>,
	"daniel.kiper@oracle.com" <daniel.kiper@oracle.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, Christopher
 Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>,
	Kevin Pearson <kevin.pearson@ortmanconsulting.com>, Juergen Gross
	<jgross@suse.com>, =?utf-8?B?UGF1bCBEdXJyYW50wqA=?= <pdurrant@amazon.com>,
	"Ji, John" <john.ji@intel.com>, "edgar.iglesias@xilinx.com"
	<edgar.iglesias@xilinx.com>, "robin.randhawa@arm.com"
	<robin.randhawa@arm.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>, Matt
 Spencer <Matt.Spencer@arm.com>, Stewart Hildebrand
	<Stewart.Hildebrand@amd.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Rian Quinn
	<rianquinn@gmail.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLRG91ZyBHb2xkc3RlaW4=?=
	<cardoe@cardoe.com>, George Dunlap <George.Dunlap@citrix.com>, David
 Woodhouse <dwmw@amazon.co.uk>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQW1pdCBTaGFo?= <amit@infradead.org>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLVmFyYWQgR2F1dGFt?=
	<varadgautam@gmail.com>, Brian Woods <brian.woods@xilinx.com>, Robert Townley
	<rob.townley@gmail.com>, Bobby Eshleman <bobby.eshleman@gmail.com>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQ29yZXkgTWlueWFyZA==?=
	<cminyard@mvista.com>, Olivier Lambert <olivier.lambert@vates.fr>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, Ash Wilding <ash.j.wilding@gmail.com>,
	Rahul Singh <Rahul.Singh@arm.com>, =?utf-8?B?UGlvdHIgS3LDs2w=?=
	<piotr.krol@3mdeb.com>, Brendan Kerrigan <brendank310@gmail.com>, "Thierry
 Laurion (Insurgo)" <insurgo@riseup.net>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Deepthi <deepthi.m@ltts.com>, Scott Davis
	<scottwd@gmail.com>, Ben Boyd <ben@exotanium.io>, Anthony Perard
	<anthony.perard@citrix.com>, Michal Orzel <michal.orzel@amd.com>, Marc
 Ungeschikts <marc.ungeschikts@vates.fr>, Zhiming Shen <zshen@exotanium.io>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLSGVucnkgV2FuZw==?= <Henry.Wang@arm.com>
Subject: [ANNOUNCE] Call for agenda items for 5 November Community Call @ 1600
 UTC
Thread-Topic: [ANNOUNCE] Call for agenda items for 5 November Community Call @
 1600 UTC
Thread-Index: AQHY6ta7MD4AHdQWJU2vQ8pVwyf2LA==
Date: Fri, 28 Oct 2022 14:08:19 +0000
Message-ID: <75B69D18-27F3-4DC6-9308-CD2548967154@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB5669:EE_|MN2PR03MB4941:EE_
x-ms-office365-filtering-correlation-id: e89fb317-f219-496b-69c6-08dab8edde09
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 UfOZGTCmTMyIAILcRCzSqGo/BUWPjuZYAUaX0HfSMPKAeCNGuojw7D+CXutSxK1rbMM4C6AhP0jWZHGyajKi/tcCXC1JbfnRtYuoQ4DDe4z1zBRwZA3D8qf2U9piH34mdc9w0LIG9ICT4Q0fbPTyn1KJAdXKSSugRNzCKHl+OaG3KIKvArXVC1KHxpn/ZIbpM/naGZesgpgoGlINb17uT86YjdE1CxMihKBM/mdauutc6XKhVGL/Vf0Zrzt6XJsTpZCRpLt9/NlGn7g1u8aZSEyTvviiFG51ANV927uR8ZPV4tz2ldhX+TnGeHyAMV5zb/GGLatd26H0xkPA0wPSIHRlIjeg97I+VJfzgSm+yDR8oAymBtsUChZ/cqKAgbX70QZrs8S1wYe3BhG371o1fxGkyMvJPooQ14gtzdp+KI5q9yIjeSzkjIEcSO5AixIyyuV6M3owfWbsltcqO9IY+qfoHVL6BJCR6ZLGNAqGJLbs2tlVyWYN0DjFjhtDjKuMmLfzyeXp0XCAN7xW9rB0k0K205BmcoBYvg98WPr/xnBPdm9N6MbuEv5mHwOGbwV/cvcNS5ViONnCBCViBRG6PlwIpoKPW4vVakBzYLDb4e4g7iuikUB+Q6dA5y57+ac2F+6EIGeDomC6cdmbTV4VFzS0cWyaaYAlTA6OZk+JLcZ68PKqrmCguTXgFRwhcV3IKn9UlKuuATrX8Ry0qPwM91m5zcJEtyNS8qYpmFzz45muLv8m/g6e0XoU0BijJTX09SUW7zGEKUNHaiGkonZwB0FkqUKxCYWszgaK2zJf/4qL6/NjbYcovrJW2AjDM15xvjnuaJNjewqjLmOqWTGwTkHnBtfVx8Xp2alfCh/6DuU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(366004)(39860400002)(346002)(396003)(451199015)(38070700005)(921005)(316002)(110136005)(33656002)(478600001)(6486002)(966005)(5660300002)(71200400001)(7416002)(7406005)(8936002)(91956017)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(41300700001)(8676002)(186003)(2616005)(6512007)(26005)(83380400001)(6506007)(86362001)(2906002)(122000001)(99936003)(1191002)(82960400001)(36756003)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ak5pdkxvVTM2Z3RaRDhjRXo4Sy9zSFE4NS9lTXJiS3RHdlpTQXdXTzJmMUZR?=
 =?utf-8?B?M3diZFB1ZmsyeUYyQ0ZxWEtNc1ZzcUVVRVFib1FXaDFqckVaMmJjd2RUcGQ1?=
 =?utf-8?B?NXVqYUQrWjFRejByMnk5ZVNJS0drS0VTY1prc0xpbzdocjN3a2FpMUkvKzV2?=
 =?utf-8?B?RU1UWmpJMnJaNUtHd2hUbGt4T3RvQU5JVkdrYjFpR3ZaQVBjeDllZlBRWGhi?=
 =?utf-8?B?UVdBc0RybUhBcEoxUDdKUXZiOTNtZDZ3ZkJLQUZSdUVEeElGTWZJaVpLL2sw?=
 =?utf-8?B?aDF2YmFESEdjRjRJZnI4MEk3ZmVWOVMxWVBxZTMyb0VNRk5SdmN5MU1qV0pD?=
 =?utf-8?B?R0RxdnpSVWJoUTN1Uk1raUVvUVFTUmRtMEp4RStsbDVDVmtveXg2TVFZQmQz?=
 =?utf-8?B?bzRNcWVsRytDekVLY2s5cDVUaWFzemU2bDVvUVlQSGpqbUM3U1k0cjNVcE00?=
 =?utf-8?B?Q2RkOE5RQjZXOGlQL1pNQjU3R0xaMUFwY21LajczTDVVakFoVWpsc2pSOVpq?=
 =?utf-8?B?bGVxSldmamlDZFZoRmNqSkJYQWpVcU1Pak41cmwrUzhqc1RzRm5qK0NBK2Z1?=
 =?utf-8?B?SGxoSWtndFpHcTJra0M3aTh4TlZMUGpJSkZWRWZudVdBSGx1a3hMUFBLdHhU?=
 =?utf-8?B?MldkbkoxK3ZSbjdlN1h3bXVmbTdxMkNxekF5RDJYT2xWblZyUEJtNTdrWUFv?=
 =?utf-8?B?VjZzWCtlWWVkSXdud25ONE9XN1NQMVAyR1FTbGs0VDRMdUphbDRvRmxXRUta?=
 =?utf-8?B?QVBhYjZ1QVJmRXh3b2FBTlduZjFvU1liT056bVFQTDUrRmNSeTNSSFNSbFdu?=
 =?utf-8?B?NUp1MmttS0k0aE1XRE8wRlZvanFTQ1UzdkdEU1NpNWxmdnVKRGNRODZxMTVN?=
 =?utf-8?B?L2FyeTFuUVBQdCtvTko4akRZajFQQU9kL1BOaHF5bEJOT1J0bDgxd3BVcmhC?=
 =?utf-8?B?RHJycUJ6TEQ5TnpnZmpiOUdkT2FrampzWVVqSlcrUDlWTHdYbVMveGdrNmtW?=
 =?utf-8?B?MEloeFVCMWFnWFJHdkxsekxqbDdvMkZXcjZLTkgya0pVNUF2T1dzOVY4N0FD?=
 =?utf-8?B?MmR2YUUzRTBKcG0xTXAxN0wwbDB0bEcxd01RSDJ5YWhuRHN4RFNKaVZsTTNE?=
 =?utf-8?B?QzhXamtTZWRHblNteVNQTGZyRWYzcGlZbEhxcmFTL2RTY0doTisxa1lDWWwz?=
 =?utf-8?B?U2h6RXgxL1RDR01TTzJNa3lIQ1JudE80VDY3QjNxb3J1d0l1M0xBejBiMmQz?=
 =?utf-8?B?N0FEU1RmQXVrcVlyWk9TOC80ZytaZ3NMNXhwUmZMd2QwYnJVblhrRUVYbDE3?=
 =?utf-8?B?UmtUYVMwMnZJSUFoVGdoZ3duMVlrS3NsRGZDZXorY0pqOGhoZlBveXVSR3hO?=
 =?utf-8?B?K0lnRmRwSmJDMzJwUmRMd1dWSW9TSFNyYUNXZ0h2NklNVVZ0MFg2VlorQWhZ?=
 =?utf-8?B?cVA2K0xJNTBZUTdLSGxldlpyN01UbEZnalNUK2sxNWlLazRobEtTWHgzb3hz?=
 =?utf-8?B?SThNMitDRzFsZk9RdlNzeHpCczF2VE9rc0xpR2syMURpWVovMkNHTFFLT2Nx?=
 =?utf-8?B?aHBuNXhSS0lHckZFa0duMnVvLzh4aWJLazRVMFAybHJqYnlPRkpXS2F1TXYx?=
 =?utf-8?B?eW9sVTNzZ1p3SGNlUHoveEVtbnNROGlDOFJnYmNjY2dFaHJFRm15ekZzcWVh?=
 =?utf-8?B?Zkh6b2FzVXpTMGFDV0lpaVNmdkQ2R1J6U0dCQjdrSmdSUG5sNFpHa3VCaXRu?=
 =?utf-8?B?UUdFNThTV1hxVVlQZjFPVEFIZU1tWlBrZVVDVGlBVHB2RmJnQk5oWEluV09z?=
 =?utf-8?B?S1J0c1RFOVRVY1JTdFROdjZraUR0bEdRQm82UGhIemdPMTBoZlk0dFpFUkxw?=
 =?utf-8?B?RlNNUE4vajRvVXNjczBseVk2Sm56UGtIRTlLZEwrYzgzWDIrQWpUbWRQajU5?=
 =?utf-8?B?WWswWVQ3aDdiQUhkRlpLQjlJdFJUWXI3eXo3MnEwRzRMNWtoZlhpSzFBcG9z?=
 =?utf-8?B?U056NWtlbXR6UndJV0UrYndJY1Q5bm9sSzFvSkJQR2JIMENza2lJRlNaSUlW?=
 =?utf-8?B?QUV6amgxeHdJOC9hOU9EcHBEZUZBRlFEcTgwTE1vTkdtMjJWRU8xZWRxaks4?=
 =?utf-8?B?Y1RFbGoxVVRJUDkwT2pJdXFwUjdYc0hPeUFYMkx6WWV1SFJiRTgxWUhzcXA5?=
 =?utf-8?B?S3c9PQ==?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_18232369-4B07-4FC2-9AB8-DAB9C07DF87E";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e89fb317-f219-496b-69c6-08dab8edde09
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2022 14:08:19.7640
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: quUMdgT4nhr0eK4JsblqhKOWUMMuTMQgEiRELPSTc3f1G8bMV80PyavrAAsGeciW9uqfIGOmE+S4iQJHJNZC4y3y4jrfAlFCA9yuah4xCAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4941

--Apple-Mail=_18232369-4B07-4FC2-9AB8-DAB9C07DF87E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Hi all,

The proposed agenda is in =
https://cryptpad.fr/pad/#/2/pad/edit/5YUquBkUpmg-XuzK8cyvUQ8+/ and you =
can edit to add items.  Alternatively, you can reply to this mail =
directly.

Agenda items appreciated a few days before the call: please put your =
name besides items if you edit the document.

Note the following administrative conventions for the call:
* Unless, agreed in the pervious meeting otherwise, the call is on the =
1st Thursday of each month at 1600 British Time (either GMT or BST)
* I usually send out a meeting reminder a few days before with a =
provisional agenda

* To allow time to switch between meetings, we'll plan on starting the =
agenda at 16:05 sharp.  Aim to join by 16:03 if possible to allocate =
time to sort out technical difficulties &c

* If you want to be CC'ed please add or remove yourself from the =
sign-up-sheet at =
https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/

Best Regards
George



=3D=3D Dial-in Information =3D=3D
## Meeting time
16:00 - 17:00 UTC
Further International meeting times: =
https://www.timeanddate.com/worldclock/meetingdetails.html?year=3D2022&mon=
th=3D11&day=3D3&hour=3D16&min=3D0&sec=3D0&p1=3D1234&p2=3D37&p3=3D224&p4=3D=
179


## Dial in details
Web: https://meet.jit.si/XenProjectCommunityCall

Dial-in info and pin can be found here:

https://meet.jit.si/static/dialInInfo.html?room=3DXenProjectCommunityCall

--Apple-Mail=_18232369-4B07-4FC2-9AB8-DAB9C07DF87E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmNb4k4ACgkQshXHp8eE
G+1fpAf/eyxDIVjLCUWbvRxyrUcZG5fQABmDRZ428iM8XayVWSzHyBY7GUgPS3rz
GdhRY8YeQLxeWWZijpaNY1O/OLUkF5YQvrhZgUIeBo+GgHomAv/2nH4JqPqRg7qZ
CRS0JKsQNF6C2HxM09GRKjD8k8npM7Qc0YO2kDBG/NHLrRTuADskKJvgdppXuaeM
UXk4eseybBf7y779f+opWG+kuJGv/ehrGxX0fs4gPYYgC6J50H+QfgqmvAfTgPQC
3Fo2pA/X5rl9CmXGHv/Ph1JGiW0KH+VnjQiWbntoT5fc0QE+6JtLbhqp0GFDAoMC
rQ/xEO4NigGaNMy4jjd95U+8pHVXvg==
=jM1T
-----END PGP SIGNATURE-----

--Apple-Mail=_18232369-4B07-4FC2-9AB8-DAB9C07DF87E--

