Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D8C6D947C
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 12:55:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518826.805731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkNG7-0004pJ-OJ; Thu, 06 Apr 2023 10:54:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518826.805731; Thu, 06 Apr 2023 10:54:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkNG7-0004ly-Lc; Thu, 06 Apr 2023 10:54:27 +0000
Received: by outflank-mailman (input) for mailman id 518826;
 Thu, 06 Apr 2023 10:54:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RM5I=75=citrix.com=prvs=453d769fd=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pkNG5-0004lZ-Eu
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 10:54:25 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6290d447-d469-11ed-85db-49a42c6b2330;
 Thu, 06 Apr 2023 12:54:22 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Apr 2023 06:54:19 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA1PR03MB6530.namprd03.prod.outlook.com (2603:10b6:806:1c5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Thu, 6 Apr
 2023 10:54:15 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6254.026; Thu, 6 Apr 2023
 10:54:15 +0000
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
X-Inumbo-ID: 6290d447-d469-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680778462;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=n0HOUBqDK03BjZGCqepxi1ytGZNaJm+Aysk+6zq3pl4=;
  b=P6iNJTYzTbsVP8NYMp9yd6Zu6LfctSAtPQjvo5xczKR8txJ02P9kuiSf
   J6JZ46q475vUv4lPxg3QMWCfE700yXznOw5pXhsfbdpnqdBSLycZSR+T4
   KFD3GjwxdqdYLWpWJc3g6j7J3lWeJ3LmhhU0mhZUUufP04tyIsaGWMwig
   c=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 104575953
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/tfCuapO27wDsfOlmQ95dtii73BeBmIBZBIvgKrLsJaIsI4StFCzt
 garIBnTM/uMY2D0c9hxadjjoRsCvcPRyodrSQE4/ik8HilBopuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weCzydNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAG0DXBS7hLmX+oiqE8JhtOM4LZC1YIxK7xmMzRmBZRonabbqZvyToPV+jHI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeiraYSFEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdpOSeLlp6Mx6LGV7kwMUQUqdHu+m+CgyRW/acldC
 hJP/zV7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3Oc1Qjow3
 1PPgNLtBhRoqrSeTX/b/bCRxQ5eIgAQJG4GICUCHQ0M5oC6pJlp10yfCNF+DKSyk9v5Xynqx
 CyHpzQ/gLNVitMX06K8/hbMhDfESoX1czPZLz7/BgqNhj6Vrqb8D2B0wTA3Ncp9Ebs=
IronPort-HdrOrdr: A9a23:xJ9JzapBcIjOKmXmsKZA85oaV5oCeYIsimQD101hICG9JPbo7/
 xG+85rsSMc6QxhPU3J+7i7UpVoJEmwyXcb2+Us1NuZMzUO21HYTr2Kj7GD/9S6IVyGygc178
 4JGJSWbuefMbEQt7eY3ODXKbcdKHbsytHSuQ9zpU0dKj2DystbnmFENjo=
X-IronPort-AV: E=Sophos;i="5.98,323,1673931600"; 
   d="scan'208";a="104575953"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMzOjBpvtoyIEGeguEMooEmr//5NpK3Fr4JcucJ6gUDN3xVfVVntM2UkpXPqW/hWtKvws88vpYWEI5Cau/LbsqAHBzSxoS4HKrNPIxAXG6N5qRs1nVWHl8KsYrilkef+4jq921ZwEWf8Equlc4XqMJanVPEqA/e4JaYOxvz9H1u9viE31sTcaUp8aUiwAubHoiBsP0doNQI0n9kmJUIh74Zo5OOv/yRZParxVMu5xv0s4S1+AM+DdvWMSAaBUgXE0n8vbAlRYtARhf3waGlOTpbDeZRqg3wLl/lBV5tlklRXQUan+HfFQ0PJ0LkPIOdplXFPYuBCDIFB+EBsZgavBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EyMfEoLHM3v5KuwRZuXhJRCyB5szuGQEJtrTdAsqC3U=;
 b=KQaTi60ZmaEH28TooI+J0pzkXFgw7i/SxrqQ0ACRxpVWlf8YPyYDmc/f6+NLtB5EWZVptzAZvStb21jGlLXIaCDHVpbKEmc6smK79Wdu2NabxGSLIPuuFW80ORduR7DDt1XNdz9IB72pereHlE3p1G0xTWZ4BODhf8or4UG7LgKNxMoNWnaVA/MvSsl0u5Elp1G5iiQbOgZLvvp/0ihAcwoSczB4sRqy9ZtLGUeCusZEQITjb4V+/8vplKDJcbww5WNm/pO4JHI2b1I2GpC2LKJIK5KdQVpOCLe6ZomG8/O5FgUKm14w9Zkca8PnrWhcHZsAp2BOoIqFSm0+bavGxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EyMfEoLHM3v5KuwRZuXhJRCyB5szuGQEJtrTdAsqC3U=;
 b=iYgYwePhRgcO2OHymBU+JzIBB8lrYeQTsUphjVswsAOIAlsMhFOEdpVvm2mEgE7MgQfEFOIM5Z9vMtU+puSheCUmiZHt7B1luMHu3o50NsMiRV0KfXbdANm9CJZbXkj6kpAVFTFa02t5hr76msG4fGceiyj+jC9KCZAEyx+r5BI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 6 Apr 2023 12:54:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH] livepatch-tools: remove usage of error.h
Message-ID: <ZC6k0VNwb/+VzWHP@Air-de-Roger>
References: <20230406091807.49028-1-roger.pau@citrix.com>
 <4525547c-e309-c994-3dc7-5d1b398aabe1@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4525547c-e309-c994-3dc7-5d1b398aabe1@citrix.com>
X-ClientProxiedBy: BN9PR03CA0972.namprd03.prod.outlook.com
 (2603:10b6:408:109::17) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA1PR03MB6530:EE_
X-MS-Office365-Filtering-Correlation-Id: 84be8364-0641-432d-7f17-08db368d42a5
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uypdFIJuvCrUsSgTSZ6hd6E7ZM9+1myKDvLfju0AVOt6arscxnMFBo1cQBS28vWQFqBvtRh5XYLK8y/rAJruY5mYLrWFDA8tUQ4VLfZyN/xQOERZZ1Z+YBdMbLjb7+ZA6Bfkp3ZmJ8WK2CiDRYXkkhoJKHPEvqUtnk/DbEEmLD9vgGV0u9FU7rJ6rkbWhJxbTTz/tLuRcseHW0LXIBMpuAZNuQpzVcMZy8EB7EXnwthbrl/GgUsk/OzpASUvX4V2xRFtbzTuwzG+lYRvZEpdxVXN9DdRaghr4FJ4tsuAjQIN2Ag1X8a0xC/i1jasM0RtFE42WgXSvgb4P+MEqmHhxn99kx2c7uEwjX0Ks3TwQPqrEUXUkCwz5KWg3+ghw6WcC7HN2/924OGay4erAcueHndpgylzY10wrDJ4M7nP0TeRvRIeMOmaHdpCBjXfleOxeMRqK5/Z37iWVoEe9E+9AuPZlIlOnRMw0qgX7X504Ur1csrbJBe0oJ5E1hlKWAtWBtsVmlVuWjxsnCDmRAfpY+Hu36nE70ilXVnUlzHsc5SJMfMaPzctAU0GDVxkleHw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(451199021)(186003)(5660300002)(85182001)(38100700002)(66946007)(8676002)(8936002)(66476007)(66556008)(82960400001)(6862004)(41300700001)(86362001)(4326008)(33716001)(83380400001)(53546011)(107886003)(2906002)(9686003)(54906003)(6512007)(6636002)(6506007)(6486002)(6666004)(26005)(478600001)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eE1xZ3h5L3pOVDV3R3FoTGpab3p4YWNXUDRvTDhqR0U3NzJJb1FVMWhnRXNO?=
 =?utf-8?B?NVJDNHJ0QUJMOVlPdnVlT1IyZHNQdDlDdUFFT1FJZkc0b21lajBSYUdJU1Zn?=
 =?utf-8?B?VnlDdzZseW4yMTBYOEFZODVMMWdRdVIxcWdoZDhsOFFDdHVGRG9ONnVHOG5C?=
 =?utf-8?B?NGNWdVBlamhjRXFLeEJFRXZLV3hiSFhKZTVZZjErcDBEbUVmTzNqeE9WcE9X?=
 =?utf-8?B?MEExUWVUT3JBTDBvSXV5MDMwUHg4dEhLV2Yza0ZaWkNPbS83MzVmY2FoMjZv?=
 =?utf-8?B?cTEva0lkOHNmZlNNMkpnektlaHQ0QjNGYk5BT3h2dVFzdjdDeWVLcjhMZlNC?=
 =?utf-8?B?Q2x1dXE3cDlWTTNESGxSUkRzNDNHY0NIY2NOaGJYYU9OMWFHM3c4YWFmeW0w?=
 =?utf-8?B?UDhwbG12Q29FdXJlMlQrN1JQQVl1SXpHM2l5K1k1WWVpbHVxNVhYOC94NS92?=
 =?utf-8?B?V1BwM1pNQVFuTVZjR1pyTFRWQkRZc2xubGxOVUl5N1ZEdEc0K3RuSGxjTThx?=
 =?utf-8?B?Tnk3RFpHdEE0WHlsMTkwekhQZTFMVkE2amtFK0tzRnNWbXprcXBzeEs5VXBq?=
 =?utf-8?B?WC9ZU0lQME5obmNOckJZTGdFMTZ3c2JZSWMwTk9oOTMzVUZzcFFUajVvUDZa?=
 =?utf-8?B?SlJ4ZDZoWUdkaUR2dGVXdTlEcFBsNUdlL1ZLai9abVc4SEJRajJiZHMvWnZp?=
 =?utf-8?B?alVDMVNPZEcwTHE2SHB6dG0vRVZCZzRRM2lHdFNFM1BwZStrR1QrNGMxeWV4?=
 =?utf-8?B?Q0hBNEMwcis4ODFlSXVZQmg4aUkyUzhFUU0zVUExQlg5dHltdk16K1ZnazF6?=
 =?utf-8?B?dEw4b2ZNSWo0T1JaZ1U3TlYyL2ZCcDgwVE93YmxKdlJVQkhTN2k5WHRlMFl5?=
 =?utf-8?B?VEpPa3cxQStzTkhxRldmdExMaG5RaUpaMUhXb3kya2p2UncxZVVqYWNUU1VC?=
 =?utf-8?B?eTJLWHdGTFg3UlpzaE1IN3Zmd0lzVnAxN094Qkh3dXdOZGNueDBER0Q3amww?=
 =?utf-8?B?K3VLWDZtN04vbWtFSnlPcjVvNWxvbjNCUHJBZkNrejFLRWlVSERpbHdrTTJX?=
 =?utf-8?B?MnNQWWQvYlFWbVk0SlFrUk5UTWduSWN4TFdYTkZ3MUVVNU1penFKcURmK3U0?=
 =?utf-8?B?OHZ5NzJuUno1Zk1rWGRFSzROelY2VitBZDdBQmJjTDFPNG83bHVTZFVpVTFj?=
 =?utf-8?B?OWNlZ0psNkpjRzd3eTZHcjB1WXpSNlBVMVIxOUZURVk2ZnRGQ3J2NWZ1eDVG?=
 =?utf-8?B?UWhDVVpsVkxDeENYTmd0Y011RFpEaGdaOXBNaGFZTWUwdzYySEFGWkdsMFZj?=
 =?utf-8?B?TXJtYVZwenZIL2lUT1FnRGdPRnFKY1VXenZRUjhRVmY1Ukp5VWZKbzUxY0Jz?=
 =?utf-8?B?SW02SUZwYlhvYjB6dDRRL1g1c0pEcnRLd3YraEc0bG9qWDNuK05XcjdBNTNE?=
 =?utf-8?B?SVRGeUpXMnFUL1lNM1VoTEE5QlNlR3AzMmhyUURYMVVpZ29LTGVhNUFxcCt5?=
 =?utf-8?B?ZG92ajA0akVqMy9hT0QrTThBN1FaZDNzeVdWeTAxbTVtMzVOY2V1dUZ4YUZQ?=
 =?utf-8?B?WXJ6bWRzVHowdXU1dTBsM2h4Q3FqOFMwdlFSZy96Nk1FdHV1V2hUS2U1QW9v?=
 =?utf-8?B?VzJSc2srUWV0dlgxMWU1VDZ6QmNtbVlwU3ovWTdFWXp3SktmdGdCd2s1Vk9G?=
 =?utf-8?B?V01FN0xyS2pyeCt4T0FNbW9GTmRBYzk0VkRFbURicGhmWnhuaG5zK1NsQ1A3?=
 =?utf-8?B?U3lYNHNsSmUwUml4N2FOdjhyQSsvVG9MQWk0NlMrbDArS0JTRDkveXhocjYv?=
 =?utf-8?B?c0JFaWZDUmduU2FWclllOEhFdkVCRllWRG5RQ09IbjJLY0hEQk9ZQzlVTEN1?=
 =?utf-8?B?VWl0NHFHZXJWK25Vc3ZSSDBvRzNqTUdGN0pidHhFdG92K3NZV0J1c3hsV3U2?=
 =?utf-8?B?eDhoSVM3V1gvOXpPZXQzZ3B2SDhWQml4R2lrVVVvMTZkalROM0FYZXVRTkw2?=
 =?utf-8?B?N2NYZWQ3aWZSeko4SHBnY0tYM3NZRVZNSmx4R084Z1FDN1lSb0EyaFk4dE5V?=
 =?utf-8?B?amlXQW1tS3BiUTNPMFdxSVhrVUU0QkxzU1Roa0ROcFVaMDBRSGExUFVVc0lF?=
 =?utf-8?Q?WY9ugsLyQinCesbQI2l1/4iN0?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lwdgjmBzfvTGfdt6gPVzOLn5HcKBede/ss6WUPooGDk4+TI2IBtpoP+UQ9Pb3U66wai5+Inf1XDlYZCa7P81k1sguf9b1cETuRxLmg99iuCNNyH37Smd1u560buiO9mwiar42GIuT4Gbxg8aLMmWVDCWmg9OkE29DFs8ivuhVyJVSkKvS+CckWK/LzDRzLDKBpKja+ynVsjhTj38m2R9bOaPfjHVG7UIMjyv89VephZYkv/r42bQ8nejC4OkKbANIlnwAzbxh57cRy+y+U5pZrYc5gL//6gUPC00urpLp2IV/b+tkhIRk/E5LrnuFoo9ytJSKxqDmEn8CTi0lddG0nedIsTV1d+WlnW8ghkTD1u8034/oeA+8mb6LCdk4brilk+vEWd95eIlPL2BZ6/Ok1YBBxBPI1y5esqwRPfP0RLveDeKLl4LuRzKajC6ZzZFXi7ojsIDfvhBYSIBpTGW2+XMCEoPcbeooBeHS/m8wTHbxolnfnLCbUwsCJUD+L+J/LNz/qHAcD6zduBBHMUhbIU5I259GqAjVAurh07x990/ALa2lR5zfpu/ZxGswk5yYAwznRome1XNsxtoqbNd4rDnl9fIbMCHcvQloBK7YqhqfNnKMHW+wg6tEZgcdKO9ziBM4OqIbNVuIvHathd9qnt9CkZjMssXYYNqRi5Bf/PfStGYIaVpKEDDYCxNzL5EN+EF5l5JyLvFpV5fayUIoLCXGya5X5TEQboFgGN4cs0SArwU8Tj8H/ejpG3YfB1YACJXqWnIJhzpmAXUHu7spPNT3qz+4lhL6D8yK7P7kL6qIWs6MI9+9/jnLAOeCIv3
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84be8364-0641-432d-7f17-08db368d42a5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 10:54:14.6232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: klYusHizOEgwOdStYM8ivWH9VR9ypk8LSM2NRSrxJIGgSrQJW0PW13Hj7+wbybHnMOTLJpiZxUd1iRSlpVcq+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6530

On Thu, Apr 06, 2023 at 10:36:37AM +0100, Andrew Cooper wrote:
> On 06/04/2023 10:18 am, Roger Pau Monne wrote:
> > It's a GNU libc specific header which prevents building on musl for
> > example.  Instead open code an equivalent replacement for the usage
> > of ERROR() and DIFF_FATAL() macros.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> > Cc: Ross Lagerwall <ross.lagerwall@citrix.com>
> > ---
> >  common.h             | 10 ++++++----
> >  create-diff-object.c |  1 -
> >  lookup.c             |  7 +++++--
> >  prelink.c            |  1 -
> >  4 files changed, 11 insertions(+), 8 deletions(-)
> >
> > diff --git a/common.h b/common.h
> > index 9a9da79..ec2ea33 100644
> > --- a/common.h
> > +++ b/common.h
> > @@ -1,18 +1,20 @@
> >  #ifndef _COMMON_H_
> >  #define _COMMON_H_
> >  
> > -#include <error.h>
> > -
> >  extern char *childobj;
> >  
> >  #define ERROR(format, ...) \
> > -	error(1, 0, "ERROR: %s: %s: %d: " format, childobj, __FUNCTION__, __LINE__, ##__VA_ARGS__)
> > +({ \
> > +	fflush(stdout); \
> > +	fprintf(stderr, "ERROR: %s: %s: %d: " format "\n", childobj, __FUNCTION__, __LINE__, ##__VA_ARGS__); \
> > +	exit(1); \
> > +})
> >  
> >  #define DIFF_FATAL(format, ...) \
> >  ({ \
> >  	fflush(stdout); \
> >  	fprintf(stderr, "ERROR: %s: " format "\n", childobj, ##__VA_ARGS__); \
> > -	error(2, 0, "unreconcilable difference"); \
> > +	exit(2); \
> >  })
> 
> Looking at the usage, can't we just use err() instead?

Hm, err() will unconditionaly use errno, which doesn't seem wanted
here, as in both cases errnum is passed as 0, effectively preventing
printing it.

I could use errx(), as that doesn't append an error message, I think
that's available on musl.

Let me know if you agree with that substitution.

> Also, I suspect you don't intend to delete the error message in
> DIFF_FATAL() ?

I didn't think it was that helpful, but I could keep it.

Thanks, Roger.

