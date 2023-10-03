Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8D67B626A
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 09:18:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612069.951923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnZfu-0007bk-He; Tue, 03 Oct 2023 07:18:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612069.951923; Tue, 03 Oct 2023 07:18:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnZfu-0007ZV-D7; Tue, 03 Oct 2023 07:18:34 +0000
Received: by outflank-mailman (input) for mailman id 612069;
 Tue, 03 Oct 2023 07:18:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N/VM=FR=citrix.com=prvs=63394bc6a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qnZfs-0007ZN-LD
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 07:18:32 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d3f9d8f-61bd-11ee-98d2-6d05b1d4d9a1;
 Tue, 03 Oct 2023 09:18:30 +0200 (CEST)
Received: from mail-dm6nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Oct 2023 03:18:25 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by MW4PR03MB6652.namprd03.prod.outlook.com (2603:10b6:303:12f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Tue, 3 Oct
 2023 07:18:23 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f%4]) with mapi id 15.20.6813.035; Tue, 3 Oct 2023
 07:18:23 +0000
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
X-Inumbo-ID: 0d3f9d8f-61bd-11ee-98d2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696317511;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=bxV5iThqqw8QuDpQVMviTMLSSnO3RkXvsXBEcwUvzbg=;
  b=SgTQyI4LlS3+1vDRC6idqw/IXfGv74sUuBU4atd8churJc3ogSfU4ROt
   Ps+m2lYVNMrvfBoFyG5pa3MlpVmn8mHjxnc9TtUN3UukTv1jJLMoK68pr
   vt5qEqI186Z4D46pkhg6+HOYMbgAPqqgwm0ndfr9/JkH/Y/NsgwD21am1
   E=;
X-CSE-ConnectionGUID: C4sgwygvQl+3KUkH85lbCA==
X-CSE-MsgGUID: o6vEmMfLQwKGM+hZlgSWQA==
X-IronPort-RemoteIP: 104.47.57.175
X-IronPort-MID: 123078971
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:YUeDi6rEzPeGiQVht1pPBB4bR/1eBmIJZRIvgKrLsJaIsI4StFCzt
 garIBnVaayOYTH0coh3bI2yoEwP75fXmNcyHAY/rSBgH3sXoJuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbOCYmYpA1Y8FE/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GhwUmAWP6gR5waGzyJNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABtRdR+clu2o+bb4EcpRheRzcc3hF6pK7xmMzRmBZRonabbqZvyToPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeeraYWIEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdhJTOLop6Ez6LGV7mtNFjATcFWfmOaapWv9W+BbJ
 HcrwwN7+MDe82TuFLERRSaQpn+PuRoVHcRdD/c77gClwLfb+AufCS4PSTspQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkA9NnQebCUJSQ8E5djLo4wpiB/LCNF5H8adi9z+GTj0h
 TeQviU6r7wWgYgA0KDT1UDKhTOl4ILAQQ886gzUWX+N5wZ1IoWiYuSA4EnS67BDMYOQVB+Bt
 XwIltK25eUCS5qKkUSlS+ILB6yt+/eDPxXWnFF0Ep8usT+q/haLf4pd/TV/L0dBKdsfdHniZ
 0q7kSNc4oVCekSja6Bfapi0Tc8tyMDIF8nhV/3SRspDZN52bgDv1Ctjf1KK1mbh1k0li7giO
 IyzeNypS30dDMxP8j2yQOsM1K4x8Qo3z2jTWJPTwgyu1PyVY3v9YagBGEuDaKY+9qzsnenO2
 9NWNs/PxxABVuT7O3DT6dRKcg1MKmUnD5frrcARbvSEPgdtBGAmDbnW3K8lfItm2a9Sk48k4
 02AZ6OR83Kn7VWvFOlAQioLhG/HNXqnkU8GAA==
IronPort-HdrOrdr: A9a23:DHDx7amxkl3BwyMkQ+JRR1cz8fPpDfLo3DAbv31ZSRFFG/Fw9/
 rCoB17726QtN91YhsdcL+7V5VoLUmzyXcX2/hyAV7BZmnbUQKTRekP0WKL+Vbd8kbFh41gPM
 lbEpSXCLfLfCJHZcSR2njELz73quP3jJxBho3lvghQpRkBUdAF0+/gYDzranGfQmN9dP0EPa
 vZ3OVrjRy6d08aa8yqb0N1JNQq97Xw5fTbiQdtPW9f1DWz
X-Talos-CUID: =?us-ascii?q?9a23=3ALKzegWv7jfpfEASrElkSjNm36IsOLmbS02bfPXa?=
 =?us-ascii?q?8Sj1Kdb61GQKU8ohNxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A4zhhNwxLKTlboIJcpT3eRXms75uaqKPwFm0ItJs?=
 =?us-ascii?q?igtanGgkzOwWZgw+Ie6Zyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,196,1694750400"; 
   d="scan'208";a="123078971"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nC+yM5KTgjVGvHt20xwxe7HNum2m5yqiY0fH/DvcrktddJoVlkPJt4IlZtyPArUJ2/bJ89g5pNc1HGn0X2GMX5nD2fH5M9hU01yJ21glMyvA5R7FlN5n2nsEGSi6kCHZy08lNZ176V+VoTi7J5ZndcdNaK54RfU5N4EU0mh4ZJb/5wfsJ4FoQeZTZ4hLZ1kiobokhLatNMqDbluo9RgOMovMUHgGBrAYJguqV2fTIvbejJ57wNNAGHL2ikWSNF6y0VPZEkv/z5uf7WlXQhApXP+zuq0eeVVmlhdJO3QoTgLv9Ux4mTY05S6yzSIF4SM0Ktu7r9tQAGvJa6SgwzpLig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I7rl69jIeMBWqT+PDZP16nV3Fk//DKmaif0o/A6sywQ=;
 b=bZIoCg+7318i6sYSQzDSf/d02R7fA7rsZ9WP8dhPBzVeQlHFk/HvNlU/K0lsqCA8vnP8D5VXLWzXRT1VGyv6FoNntdHbaLFTl+V6SNQ7yE+9VaWpUbqJRQRs+9XDBbR8vMWssBh8Jn4LTeZqhbS/ZS4eCHEqUj6mefbp0f81puHecK8Rmk61NOlxhmjfiZ22/OQnP7eJD450AlK65Rq0BYIZqS+FClyzLRzzhmF0XKabMJAmtoUhTSvUUfLX1bltPzXWW1ZDMuACtHUXRQyt8zA4gwbJdNzTGC0mln/riOPm6zsZLvt5ZzgLTSrriPCZ6UkYg5FBFNwpIH1EvhkmtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7rl69jIeMBWqT+PDZP16nV3Fk//DKmaif0o/A6sywQ=;
 b=csYszKeWFvrj2GlwiRX7LNC/em90Z7Xw8KL7k+Jfq/Vngy/6So6HDQDtHcqSesJK/LwPlfREeWatyTDyilkyNKe0CQCK9U/8udleKwUbFrO07CISY6EYj71c6Ruc5jR6vk12kLzg8cybHS96flM9xdVGqsvDR0R66fSy27ce2xc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 3 Oct 2023 09:18:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
	michal.orzel@amd.com, xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com, consulting@bugseng.com,
	jbeulich@suse.com, andrew.cooper3@citrix.com, Henry.Wang@arm.com,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 1/7] xen: add declarations for variables where needed
Message-ID: <ZRvAOdKKD6T6l2cK@MacBookPdeRoger>
References: <cover.1696232393.git.nicola.vetrini@bugseng.com>
 <357a35c3035d0f8659a64d767791bc41d57494d3.1696232393.git.nicola.vetrini@bugseng.com>
 <ZRqkbeVUZbjizjNv@MacBookPdeRoger>
 <872f44542c8df6dab79965375376010d@bugseng.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <872f44542c8df6dab79965375376010d@bugseng.com>
X-ClientProxiedBy: LO2P265CA0380.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::32) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|MW4PR03MB6652:EE_
X-MS-Office365-Filtering-Correlation-Id: 43f2d4b6-bc28-4e98-b3fd-08dbc3e0ed92
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aEV6iN725Zv1BWdTIKEi+pra6knjzXuJl8qVMNDGevtSeF5h4+U0m+pInTtswVYt7ytIl+JLMfE+Zt5oWcLMc98iMn7CjyY9MluErmVo5aP8LVC+Ekoma6syXtw8a1MdpDujgfEnJjCV5on7oBF9uAlYobIE0bCSOBhwxEO9flbgve9G0ijA9VBN/ID3COJdY4ct9nl0tzrcmtP4qU07gQaNaMqyftaFbrSjLmXN/WNlXfk9TReJdePj6sMT34KqcltZyy8x5Hhmz1kGXGmVaLG+vb44slX5gHE2FbVmYTw5xWlhHfm5PvI7LVDerQk7K7K4G6euqo5iYx84IFYYhcwB1UrZFV/72udb1TmhjHg+/Nh/rD7n16xIjNomk5tTGjsvpmTJv7b6ru33d/12cl0joFByJys3DZqmZGKyN0JJlMxuJWMcDCqeR5BDXKuYI4OP5VdSdG/ussMYAk8FKi6irQ0OsQFXUrDq/20BHH17V1dbf/Auv7wepaiOFpYjhUgg+edJY9XmEEclZQrpoe11hlkp6xriSx3yt1Uzz1PNO8LjADXXfKJwz5C4F0bY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(396003)(366004)(346002)(376002)(39860400002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(66946007)(66476007)(66556008)(54906003)(26005)(6916009)(8676002)(4326008)(316002)(41300700001)(478600001)(85182001)(83380400001)(6506007)(6486002)(82960400001)(38100700002)(86362001)(9686003)(6666004)(53546011)(6512007)(33716001)(2906002)(7416002)(8936002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlJQWHE3V1UxOS9JTEs3ZUpoZTYvOERjY1N3Qks4Y0laYk9KOWVDTW13WHBr?=
 =?utf-8?B?QUN3UkJSQ2laL2J0UkVsZkt2allHM1c5RTN2ZWFmZkpQU0ZGZiswVkF4TTVr?=
 =?utf-8?B?WEJ2S2JvRkUrZzh6ZEdOM0ZpR1ZEbGdySDE3dktKa0JnUEt1UHQrdnZJRW1R?=
 =?utf-8?B?T1BINmJDZmVwajF4eWxGYzhBMTJ4alpmcnQ4U0VZK1ZKblJEMWVJSE8vbzJR?=
 =?utf-8?B?aUh2dUhmeVUreFZlanZFNmRaWFhXbGI5RVBwdDBqUU5xQTRYYUxtY1Mvc3F1?=
 =?utf-8?B?R2pjWU5YSnF6cXJQN3hsVkVrTXd4YnVkd1orSGlzQ0ljeEdUd1ZYaUUvYm9i?=
 =?utf-8?B?Wk5rUS9MUkNTUWcxTWUybTJ4b2tUbEhoeFRBajRHa3hYK0wycG9IdGV2eTdU?=
 =?utf-8?B?cmtyTnNteXRGN2xwUkljS0RFNWNXUTlJRDZldXdHMXE5ZERITVF4bk9DYklt?=
 =?utf-8?B?d2FwMnk4OWkrdDZtOGcrZXVCNnpUMlp6TUFJZlJjOEZ4WVU4MTc5bkhIc1JK?=
 =?utf-8?B?NUw2NEFHa2Y2VHI2dHV1ak45dnYvK202cGFVZWNvNW5HNjBQc2xDVGwzZ2tM?=
 =?utf-8?B?WDZvdXJlMS9Kaks0aUhtOWtZTVViU0Y4RW9hV2tBSkJhOFVKcjFsVHp2a3VK?=
 =?utf-8?B?bFV3bWNHd0h2a21LQlRidlphSXVneVI2TVAxbi9Wbi9abTAzck1xUEIzbUlj?=
 =?utf-8?B?T3lYTDBKUUJiL3ZzUE9nMWVwd1FnK01SdmVzUzB0TGhBVFJwVXQ2RFo5OVZI?=
 =?utf-8?B?TEp0ZG1CL3FRMjVKaXk3K20rb3NhTnVDSWlNVlVuNzJzU3ZnYWl0VElKMVpW?=
 =?utf-8?B?VDAvMlhSUXNHcTE2WFNkdHhOZ2JDZEU1dGRQQ3J2RkVuQTJIbU5hVmtOVDJZ?=
 =?utf-8?B?NitZSUt4RFN6K0doUk10YU5Dell4WjFka3NiZW5pOTZrRVVoR2dXc0ZMTkRv?=
 =?utf-8?B?U0VRRms3eW5RQlFzbi9hZGhGMXB0TkRtVWc0NHRCeEVEZE13UVhnbXNuMzgx?=
 =?utf-8?B?aTFNRlprY0oreHExZXRxNGwxUjA2bHN4Wm1nbnJ3UC93alRnNDRUcUFGTVNp?=
 =?utf-8?B?bk5razNSWXd5bUlJWGNKWEdrVmNCTTRNbHltUWFFR0ZTR0JONmNpYlV5OEdq?=
 =?utf-8?B?NkhhbHBLZUxYemd6YktJSDBmZ0ZEZHhWN3FENm9wandEalNnZVcvN3Izc05r?=
 =?utf-8?B?YWJuSnVuQStiMjZrMSsyMFB0RUdhdkk2NWxDU0ZmTE5QSmtHOVdrUHZ6RjlK?=
 =?utf-8?B?RWpMbVFDSzdLN0dUcURxWHExQjVzaUpFUFZJUUpmMnE3aW1taENzSGQ0L3BE?=
 =?utf-8?B?VU9TS0FUNG03WXNCVzRSVUt3bVZtQ0RaK2c3ZkJRMnN6V2k5ajREaXlZekhH?=
 =?utf-8?B?RGgxbzdxbkJtZVBoc2N1R2JsL0E1THNJVVd0TmdGWmpTZnVhOHpGY1A2NkFa?=
 =?utf-8?B?SFk3THdrZ2ZqRGlHQWp2Y2UzdE5WOWNra2V5WHVoQ08rN1NDSDQ3cVZHY3gw?=
 =?utf-8?B?MTJEb3pjY0hxN1krUHBJZEt4bHUxVTdDVlY3SnpqY0JVSlI2ODV2bkpkdHlJ?=
 =?utf-8?B?RHViMDJvVHFGbFBnSStEUUs3eFdCdU9BbWxrU0lJY3pSZGh1a0U1cXhwMHNT?=
 =?utf-8?B?NFNOYjlPdVVMd0xuRlhYclkvNlRUUWNKWFNtSSs5WlFoaUlxSFQxVFMxMmt1?=
 =?utf-8?B?N0JsQjErOEUwb1c5Z0FBdFFXbEliYWhnWnd2OE5wclJlVzdVeHdnRkJMUm1w?=
 =?utf-8?B?Y2lnNW5mVEZLV2dBYy92M3RjaTZuMjdlMVhJUGRNdjByZWEzLzV6WXhoTTF3?=
 =?utf-8?B?dG84azRtTDU0QThVMUtPYXZtbVdjRi9UaFZHR1VKbUJhNWJYbUFQN0orZEVU?=
 =?utf-8?B?NU9pc0FuYVFBMDFyRkw0dnJsZEZpYktSb0NhZFBOTXNkc0dQU25MT2ZoM1Jw?=
 =?utf-8?B?bUluMmtCR1B1Mml4SXhGYlFJN0J3aUQrWFlIN0o4V0RyWFA2TTBXMUxkT1k3?=
 =?utf-8?B?ZEh5U1J2Um00cjZ0WGtpdURqbjN6UEpub3Y3SzZSSXdOeGJUbm52QTgyTU14?=
 =?utf-8?B?MHlmTENVRlQ1ZEV5NkZwTXYzcnBUYTduVDZHT0lSWmZFNDJXZDVDeEhNMmhi?=
 =?utf-8?B?OUpxbWMzcys0VFRYa05CY3FGU0s1c2JSTFpFNkdYQjFjTGZid2hYNWFRNS9W?=
 =?utf-8?B?UWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?S3FSVEFlYngvdE5mcjB0NGRpR05qTW1mbFFyK0xLUGM1WHVsaXZpekZFY1Nm?=
 =?utf-8?B?Qi9KYnNwNHdjaytZZlpjY0QvSFREd1YyRW02cFJKdEE5eHEzL3laOGRFTjJX?=
 =?utf-8?B?RVMvSUtkcXdRT1JYelB3MmExdy9YV2V1Y2hQUTZUSGloQVJkenRMb08yQkp3?=
 =?utf-8?B?RHhUR2NxeTBtTDNacHdrbEtlaWRQd0ord043QU13Z0ZMU0dDM2haTHl4RnUy?=
 =?utf-8?B?ZVBCZW1rWHB0ek5PN1FsYlY3V2s1aUdySW1KbkV4ekp4RlFSQXpuQ0VsNEZZ?=
 =?utf-8?B?bEdLVmdKZUYxeXpzTjFnYVZCZC9Rb05RUzZ2T043MElWODRvRkRLSkxDbFAw?=
 =?utf-8?B?bTM1TjQvWGtjWkxCQUcyZy84M0MwMkcvZnJZbGUrK3M0YVFWN2ZUUGUxMjhO?=
 =?utf-8?B?dmw5UE5mOHQxVTUrV0pjOUJLZk1WZWFPNFFVK1ZYRG00NnI1ak9PczZTd2hq?=
 =?utf-8?B?bG8xdmdYT2R4N0RaUjIwMVhqbzI4cE9wUWJKajJqV09SOVdjQ2lqdUY5cUNn?=
 =?utf-8?B?QkZ3dWdJSXd6cTBhN0JpanFqb2RpUzNvak0rK2ZZcVNSM0lHY2d1U1EyU2po?=
 =?utf-8?B?UkplOU1Kd09EWFRxemF4cEY4RDg5c0J6dDZ5cG81Ly9XMGgvVlBJdTFTOWM3?=
 =?utf-8?B?ZTNGOUtjZkJ4aDZ3K2RuYjI1czNVK0Fad3FJNEpqaUlnUklHek9UZUlSaU90?=
 =?utf-8?B?N3RmZ2NJK3UvbUtKZkkyWXBlM29pZ1NPSzV3VmNwR1grWkovalFHam1LWGF4?=
 =?utf-8?B?S3FuS3BmL1Y5UGpldUVUY3Y3NEtsUFJ0TEx6MWZDK2RoQlN4UFd3bEdiOU1M?=
 =?utf-8?B?aU81K0Z4NTRDUUdEVTcvb25IdENleWsxcXJyWXh4Ynd0S3hzTWwwcWNnS2dr?=
 =?utf-8?B?d1BMelBtWjZ1WFFnTkpFRjllUktxSHQ0MG5DMlNLaHM3N3RPMnZsaDJGNHd2?=
 =?utf-8?B?eVFHcDgwQ1hNdGJRUk5Zbi9Jd2xmc2lLNk1reXVDYTEwTDJxcVJlSGV1UlFz?=
 =?utf-8?B?amVZSTdHa3ZTVW9hUTQraWdla1RYZ2xpRmk5SkhXWkFxTUR4TlZGRDZ4SGN3?=
 =?utf-8?B?WU9zSU1nb25qUno4NkR3ZkZVbU5sMUhmZis1WDY0MVdBM3JGdjcwTXYwaWdh?=
 =?utf-8?B?bm4vSTg1b1pvTVV4WmFVREl6ZzRJKzhVMm5PK1NhVks4Q1pZZWNhUnVIWThQ?=
 =?utf-8?B?T2JaSEdYUEFsZEY5NTI1MlQ4T1g4UWNXRnJ3a2xrNWZ6bE1jZmlnNzNtNTIv?=
 =?utf-8?B?WVNqcHlFa0h0R1h3bmZaeUdod2xnNXBHakh4Qys1aGppV1V4Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f2d4b6-bc28-4e98-b3fd-08dbc3e0ed92
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 07:18:23.3514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Dr0+70NrWkNciMMsxK0BQpGm0qnOCvaG6ccRfJZiwXnOwQiD8gNvJCHTf9em/b15ISPwq2gHTmVlawF4v7BCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6652

On Tue, Oct 03, 2023 at 09:05:34AM +0200, Nicola Vetrini wrote:
> On 02/10/2023 13:07, Roger Pau Monné wrote:
> > On Mon, Oct 02, 2023 at 09:49:44AM +0200, Nicola Vetrini wrote:
> > > Some variables with external linkage used in C code do not have
> > > a visible declaration where they are defined. Providing such
> > > declaration also resolves violations of MISRA C:2012 Rule 8.4.
> > > 
> > > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > > ---
> > >  xen/arch/arm/include/asm/setup.h  |  3 +++
> > >  xen/arch/arm/include/asm/smp.h    |  3 +++
> > >  xen/arch/x86/cpu/mcheck/mce.c     |  6 +++---
> > >  xen/arch/x86/include/asm/setup.h  |  3 +++
> > >  xen/arch/x86/irq.c                |  2 +-
> > >  xen/arch/x86/platform_hypercall.c |  3 ---
> > >  xen/common/symbols.c              | 17 -----------------
> > >  xen/include/xen/hypercall.h       |  3 +++
> > >  xen/include/xen/symbols.h         | 18 ++++++++++++++++++
> > >  9 files changed, 34 insertions(+), 24 deletions(-)
> > > 
> 
> > > diff --git a/xen/arch/x86/include/asm/setup.h
> > > b/xen/arch/x86/include/asm/setup.h
> > > index dfdd9e555149..3c27fe915ed4 100644
> > > --- a/xen/arch/x86/include/asm/setup.h
> > > +++ b/xen/arch/x86/include/asm/setup.h
> > > @@ -13,8 +13,11 @@ extern char __2M_rwdata_start[], __2M_rwdata_end[];
> > >  extern unsigned long xenheap_initial_phys_start;
> > >  extern uint64_t boot_tsc_stamp;
> > > 
> > > +extern char cpu0_stack[STACK_SIZE];
> > >  extern void *stack_start;
> > > 
> > > +extern unsigned long cr4_pv32_mask;
> > 
> > This one might better go in compat.h, albeit that would require it's
> > setting to be gated to CONFIG_PV32.  setup.h is IMO for init time
> > stuff.
> > 
> 
> Ok
> 
> > > +
> > >  void early_cpu_init(void);
> > >  void early_time_init(void);
> > > 
> > > diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> > > index 6abfd8162120..604dba94b052 100644
> > > --- a/xen/arch/x86/irq.c
> > > +++ b/xen/arch/x86/irq.c
> > > @@ -43,7 +43,7 @@ int __read_mostly opt_irq_vector_map =
> > > OPT_IRQ_VECTOR_MAP_DEFAULT;
> > >  static unsigned char __read_mostly irq_max_guests;
> > >  integer_param("irq-max-guests", irq_max_guests);
> > > 
> > > -vmask_t global_used_vector_map;
> > > +static vmask_t global_used_vector_map;
> > > 
> > >  struct irq_desc __read_mostly *irq_desc = NULL;
> > > 
> > > diff --git a/xen/arch/x86/platform_hypercall.c
> > > b/xen/arch/x86/platform_hypercall.c
> > > index 9469de9045c7..e4dbec73d784 100644
> > > --- a/xen/arch/x86/platform_hypercall.c
> > > +++ b/xen/arch/x86/platform_hypercall.c
> > > @@ -36,9 +36,6 @@
> > >  #include "cpu/mtrr/mtrr.h"
> > >  #include <xsm/xsm.h>
> > > 
> > > -/* Declarations for items shared with the compat mode handler. */
> > > -extern spinlock_t xenpf_lock;
> > > -
> > >  #define RESOURCE_ACCESS_MAX_ENTRIES 3
> > >  struct resource_access {
> > >      unsigned int nr_done;
> > > diff --git a/xen/common/symbols.c b/xen/common/symbols.c
> > > index 691e61792506..7c3514c65f2e 100644
> > > --- a/xen/common/symbols.c
> > > +++ b/xen/common/symbols.c
> > > @@ -21,23 +21,6 @@
> > >  #include <xen/guest_access.h>
> > >  #include <xen/errno.h>
> > > 
> > > -#ifdef SYMBOLS_ORIGIN
> > > -extern const unsigned int symbols_offsets[];
> > > -#define symbols_address(n) (SYMBOLS_ORIGIN + symbols_offsets[n])
> > > -#else
> > > -extern const unsigned long symbols_addresses[];
> > > -#define symbols_address(n) symbols_addresses[n]
> > > -#endif
> > > -extern const unsigned int symbols_num_syms;
> > > -extern const u8 symbols_names[];
> > > -
> > > -extern const struct symbol_offset symbols_sorted_offsets[];
> > > -
> > > -extern const u8 symbols_token_table[];
> > > -extern const u16 symbols_token_index[];
> > > -
> > > -extern const unsigned int symbols_markers[];
> > > -
> > >  /* expand a compressed symbol data into the resulting uncompressed
> > > string,
> > >     given the offset to where the symbol is in the compressed stream
> > > */
> > >  static unsigned int symbols_expand_symbol(unsigned int off, char
> > > *result)
> > > diff --git a/xen/include/xen/hypercall.h b/xen/include/xen/hypercall.h
> > > index f307dfb59760..12de5a69b5b1 100644
> > > --- a/xen/include/xen/hypercall.h
> > > +++ b/xen/include/xen/hypercall.h
> > > @@ -24,6 +24,9 @@
> > >  /* Needs to be after asm/hypercall.h. */
> > >  #include <xen/hypercall-defs.h>
> > > 
> > > +/* Declarations for items shared with the compat mode handler. */
> > > +extern spinlock_t xenpf_lock;
> > 
> > I'm confused about why this needs to be moved, AFAICT xenpf_lock is
> > only used in platform_hypercall.c, and the declaration is
> > unconditional, so there's no definition without declaration issue.
> > 
> 
> The violation was on ARM code, because of a slight inconsistency:
> xen/arch/arm/platform_hypercall.c:DEFINE_SPINLOCK(xenpf_lock);
> 
> xen/arch/x86/platform_hypercall.c:extern spinlock_t xenpf_lock;
> xen/arch/x86/platform_hypercall.c:DEFINE_SPINLOCK(xenpf_lock);
> 
> therefore, by moving the extern declaration to the common header there
> should be no issue.

Just make xenpf_lock static on arm, that would be a better solution.
The only need for the lock to be global is because of compat code, and
arm doesn't seem to need it.

Thanks, Roger.

