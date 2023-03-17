Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD64B6BE5E8
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 10:51:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510978.789596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd6k8-0001VV-A1; Fri, 17 Mar 2023 09:51:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510978.789596; Fri, 17 Mar 2023 09:51:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd6k8-0001Sh-6r; Fri, 17 Mar 2023 09:51:24 +0000
Received: by outflank-mailman (input) for mailman id 510978;
 Fri, 17 Mar 2023 09:51:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=001K=7J=citrix.com=prvs=433d55c46=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pd6k6-0001Sa-36
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 09:51:22 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 441e37f3-c4a9-11ed-87f5-c1b5be75604c;
 Fri, 17 Mar 2023 10:51:20 +0100 (CET)
Received: from mail-mw2nam04lp2177.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Mar 2023 05:51:17 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BN8PR03MB5073.namprd03.prod.outlook.com (2603:10b6:408:dc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 09:51:15 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.031; Fri, 17 Mar 2023
 09:51:14 +0000
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
X-Inumbo-ID: 441e37f3-c4a9-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679046680;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=0ZqAxLLHmfIW/Bwl/6W/+sYiJNjVEK33xBsjBtBmAn4=;
  b=Qw+ycX0MWXUbVAmKHuWMkEsVIPlViCMKXsgb5lC/lUe8D4e0/XOyDC8n
   c4065zU5YRaJ7Ul3y1kLeo62iz8IXPbutLHRP03peCJbHX+nC7ic2WNPK
   DZVXLH+FNXRMqdgMrzHJKC8sc1TwlIfRKd/gPTylZ4Go6Mhott6mjQFHZ
   M=;
X-IronPort-RemoteIP: 104.47.73.177
X-IronPort-MID: 101245768
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:HXJN3ahWg3czcu9ph36X4/PPX161CRAKZh0ujC45NGQN5FlHY01je
 htvWW7Xbq2OZjP1ftpwb4/joRhT7cTRmtVmTQc/rS42Ei4b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT5waBzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ+NioOaS+Kjdms65GQR/JHip0ADtjCadZ3VnFIlVk1DN4AaLWbH+Dv2oUd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilMqluGyb7I5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqjAdhOSeLmppaGhnXNl3ANDjkrVGCA+/CEkxWYfPVhL
 Qstr39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLP+BqQDGUASj9HafQludUwSDhs0
 UWG9/vzDC0psKCcT321/7KY6zi1PEA9PWIEICMJUwYBy93iu50oyALCSM55F6y4hcGzHiv/q
 xiDqCUujrMfgNRN26im9lDKmRqlo5SPRQkwji3cXnik9R94bYjjZIul71nUxf9FIMCSSVzpl
 EMYlteX9vxILZCJmCGHWuwLEJmg4vrDOzrZ6XZlAoMz/jCq93m8dKhf5Th/IAFiNcNsUT/uZ
 kDXtAIIop9ONX2lRaZyb8S6DMFC5ar9EdXsEOLUZ9xBSpF0eEmM+yQGTWyRxmHklg4Hkaw5E
 Z6efYCnCnNyNEh85D+/RuNY1KBxwCk7nT/XXcqikEvh1qeCbnmIT7tDKEGJcu0y8KKDpkPS7
 spbMMyJjR5YVYUSfxXqzGLaFnhSRVBTOHw8g5U/mjKrSua+JFwcNg==
IronPort-HdrOrdr: A9a23:RqQuWa7V2StpoJuBJQPXwamCI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HkBEClewKlyXcV2/hpAV7GZmXbUQSTTL2KgbGSoAEIXheOjdK1tp
 0QD5SWaueAamSS5PySiGfYLz9j+qjgzEnBv5ai854Hd3APV0gP1XYaNu7NeXcGPjWuSKBJYq
 Z1oaF81kqdUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpixBiSgSiu4LvaFQHd+hsFSTtAzZor7G
 CAymXCl++emsD+7iWZ+37Y7pxQltek4txfBPaUgsxQBiTwhh2ubIFBXaTHmDwuuumg5Hsjjd
 GJiRY9OMZY7W/XYwiO0FDQ8jil9Axrx27pyFeej3emicvlRAgiA84EoY5CaBPW52cpodk5ic
 twriqknqsSKSmFsDX25tDOWR0vvk2ooUA6mepWq3BES4MRZJJYsIRa1kJIF5UrGj789ekcYa
 BTJfCZwMwTXUKRbnjfsGUq6NuwXk4rFhPDeUQGstz96UkioFlJi28jgOAPlHYJ85wwD7Ne4f
 7fD6hunLZSCucLcKNUHo46MIWKI12IZSiJHHOZIFzhGq1CEWnKsYTL7LI84/zvUIAUzaE1hI
 /KXDpjxCEPknrVeI2zNaBwg1PwqD3XZ0Wu9ige3ek0hlTEfsurDcXZI2pe1vdJoJ0kc7/msr
 iISdZr6sTYXBrT8LZyrnLDsqZpWAcjue0uy6IGsgG107X2A7yvkNDnW9DuA5eoOQoYewrEcw
 g+tX7IVYh90nw=
X-IronPort-AV: E=Sophos;i="5.98,268,1673931600"; 
   d="scan'208";a="101245768"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YLyZKuLWR+qw4yfQkxJVY/86/EBt6xSOPi6CSo5xCOGgRbLgTuC2Uk2OKJfbJe/KfzIziPA2dQJvJPHPhG0/YnxdURPdWwI8WAcS19oE/H6G1hPDQQ1tbqVGnPmJAqkNWKel4Jxh8X+2Qz8ixKQjGNeuWBPDTCU57zFeQI6oOLN8ez0MTNWOHrrzblss6DuoPmABnUXYzfL53JSNnqD4z68mWfT4BMOnl1Ok4ywr6YK3SyvY/zrWOcuG/YKQw7hmUc87IXYcTbaJ34CGX/8ntQv/+dZNN7r7/vekNfK/ufaFtwQdTG+0qz5I9QZ6epGbFYXAjH+Fdh/zuUPh91ZvTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cl0/kShxx+HcEi+8NT7FKK9Xp6Zia32LdMzcPdnKER0=;
 b=lm1gbsy0/vU2WEHQybnsZr5KAV7pnVt2mcVNquGLzLEBH7usO297coqfJWzskWMAtN/yk++NdLlvz09v/+pYCkF+5gyFQqz3FG0MZLP+w2Vl2sQRvwgwn8LYWdpX39YS5oYu1XHPuYKtN2baaEE4hRcsvzOKdJ/5U/YykX5GOgk5yBevtjNoVCuzpGeqLD00qFVUglCB6tSUadhXMVNSp+lCPMgZQULEZhJsYr6vYAyj5it1gPmlgdBf0MzxJDgeu+qHwrpEvt3zL9M+vKEOZPHHfItDhaYbE3JQtcn0g5F9jsHONrtK2zDWkLEfOXj29WKvfWv8/FcnN8CnBGA/oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cl0/kShxx+HcEi+8NT7FKK9Xp6Zia32LdMzcPdnKER0=;
 b=CgvFQUdeg0UnDXZfzEWtBvugAKAIfmXInwwC0x4jTbGfT/2YMQ49/N3Z10ohfVF6PurWC4iN1IXxq1MnLyVvR7qOXSjm52mcj7fTeyPjLfrsDXj66YF69OvHlTO5UBm1y67lZIrGEHjpT1zlAZVSqPOEIbd4A92n43DD3asplpE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 17 Mar 2023 10:51:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Huang Rui <ray.huang@amd.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	Honglei Huang <honglei1.huang@amd.com>,
	Julia Zhang <julia.zhang@amd.com>,
	Chen Jiqian <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH 6/6] tools/libs/light: pci: translate irq to gsi
Message-ID: <ZBQ4DKJ8ZAroyPIQ@Air-de-Roger>
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-7-ray.huang@amd.com>
 <ZBHz7PpUbKM69Xxe@Air-de-Roger>
 <alpine.DEB.2.22.394.2303151729590.3462@ubuntu-linux-20-04-desktop>
 <e8843d7a-eecc-373c-a6b3-6a893bc0eb2a@suse.com>
 <ZBLg8WB8HCoZvwz5@Air-de-Roger>
 <df607690-0bfb-94a3-fac6-5e20f183dc20@suse.com>
 <alpine.DEB.2.22.394.2303161611220.3359@ubuntu-linux-20-04-desktop>
 <4edb59db-d2b8-122a-fc10-59001857bee0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4edb59db-d2b8-122a-fc10-59001857bee0@suse.com>
X-ClientProxiedBy: LO2P265CA0144.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::36) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BN8PR03MB5073:EE_
X-MS-Office365-Filtering-Correlation-Id: 19110f5c-0b2a-4371-d799-08db26cd2569
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e/5z+Xzma9TDSK39PVXSQ5KuokapCkH1Eoa4rNayj8FTzuJq8yoqpDJcqI3SVkoXJaM8Bko50GJJ+bg6QaTaLwLal85Bb1PyCil1Imtn70ekAKf74KdVdu1301AP63riUJu+qKYJjaSiG2bHOAwN9Wjk5AlOlKyQSNSEH2FxJIOUawYiFqTLKQ8CPLQ+iluKJzLdfXYWZZnMVGOA/raGie1bAC1fdr9Q9JHk/w6yTFzZL/DKNjtu7OC0xDVyRo0H0PHjNVtFn6Iz904+2Vaw3dmX6MQ9yPJqfIEZv0g/ohnk5tqpWM5RigPBDx9Fy5k13j3jXtNRlZn2GU4sSr5I1Cr0ZM21HD++7htaOY+zqdRQR4dF+Z7cFx/01Kd/4IdmcwY664MivLXAESMQCm2nq1QMNL00G5GoiKODD5jo1AbE6sAn3tsoBQ2Z25caJ7Yagtx7BeGZY7Pm5kBrU08bUwO80cKCPH1HhN7L8RiCOrCA1Uqrl+rodrlw2pReVI/OFYwhK5BnCTe5P9p279gjE2xMGuS6RasLNtKz/hDvvuLUTI7gYansIpljvXskFZVH86NjiwOYP31yOmn2p9YKv7u7zuc8+A/X+KPJPQlFEItbvK7q7z1/fmInWXknF1x/gRQ+Irz1/Gx7Uz/RDZWtLg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(346002)(396003)(376002)(366004)(39860400002)(136003)(451199018)(85182001)(33716001)(6486002)(82960400001)(6512007)(9686003)(186003)(6506007)(53546011)(26005)(83380400001)(6666004)(86362001)(8936002)(5660300002)(7416002)(41300700001)(478600001)(2906002)(6916009)(54906003)(38100700002)(4326008)(66556008)(66476007)(66946007)(316002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NU1hTmJMeGp0RW56RExhMW1Va3BEME5mRUU2UGJQU05WQytNemZHRCtrbHRz?=
 =?utf-8?B?dVVZUUY3VlFvYy9yMVhrVlhMY0ZKQ3JKT3J3aEhsek4vbE1kTk96L21qTXVx?=
 =?utf-8?B?bUgrdjJQbVVvNzM4Zi9GbXlhS3Aza1lUQU1JTTVpMVFOTGFqcnI1aUdYRHVi?=
 =?utf-8?B?VWppRlI2K0pWZHJKZWw4cTVmNTVIRHRqbmFIY3BjY2w0YlZ0aE02aU44V0xp?=
 =?utf-8?B?VEtZaXpiVE1aVWlOQWl3KzVhNi81ME5TakU4aU1WNHlhMWVRdHc2WUhad3Rv?=
 =?utf-8?B?SUpSV2JjTVFwMGJrdndEekZ5SHhDd0Z0THZnRVpsMEZndnhiUUtrdjlDais4?=
 =?utf-8?B?NUI1V3hMaVlsWmxTSDh4Q01vQTI1TkROR2ErWGc0VWtGa1dNZDZtTDlEeW5q?=
 =?utf-8?B?MkxXWDlTZ2lTMklreVM5T3BMZUhmSDhxY0lySjRQekJScE1pQ0xta2RyS0JZ?=
 =?utf-8?B?Q0owNTFqSk1ZWW9wcVVNSE5pbi9DZ0dGbVNXcm5zRkw1cWJQdlIyRllvQ2Ur?=
 =?utf-8?B?MVVOaDJtREZ5a25UMWFVRzdLdXl1M2dLMGlKcVgrMUkwZ0wrQ1hoR2w5QVM2?=
 =?utf-8?B?MnNhUDh2TlpzNHQ1ZXBzUWtTTDM2R1dZdkFNVzBxYWluVHAreVg5MXptejBr?=
 =?utf-8?B?S2I2blRMQzZ4QjVSMGo3by96YjVNdnhIbisxUUsvelE0Q2J0SjhFZThUQXBB?=
 =?utf-8?B?RE1mcnJMMjREWTQ5ZmNUSXlEWHo1aDZvSkhTZlAyaEZMZWVDTXRPMTg5Y2w3?=
 =?utf-8?B?aVVSbGtST0ExOFZJN0FFZjR1Q3kzeFVMSTYyWU40UTVibk1XcWlRczYyZW1H?=
 =?utf-8?B?bEJhNm5Ydml5dW9vZFFtTGNYMkV3NWlUSWJDUCt4UXBvNzg0aFJmS212RXRZ?=
 =?utf-8?B?a0dES0FZdWVlOXRhN0c1TGNTN1hFcFdmbThha09lc1FIaUQ3UG5JK0tXMnFS?=
 =?utf-8?B?NFFuMWtvR0RzM0tja1VTMzltTGNGUXV2TmR1VTBzOE9pK2d2V2xSY1NQT0Nt?=
 =?utf-8?B?MW5ITGZrTWw3dTZlSjRnMFhscHIvZzlnWlB2QVlnUXJoaVlzZnd4eTdIZW00?=
 =?utf-8?B?UEswdkw3eUh2SXozaUNtSFV4Uk9CbkJER1RiZkpzNDU1ZXVoQkRjeEFuUjQy?=
 =?utf-8?B?MlhZQnNtLzh4eFJRMC9wMXRxMzlhOE0rdUJwTlVka2xIR1lZa3R4TDl2UVFL?=
 =?utf-8?B?bE1Ld2R0OTVzNE9nOFdjUmZyNmFidmZHOE4vbUU3REY4aGljc3Y5TW5ObmMv?=
 =?utf-8?B?QVViNk92aGVka0t1cmw4dmd4djNDdFhjZlVmQTdaY2QxRW01ZmtHanZhOE5D?=
 =?utf-8?B?VkNFNnk2b3Z2clh5NjB6eVVTcE1pTWNGQmtPYS9NV3JpRnUxYlNyYks1bytT?=
 =?utf-8?B?SHR3QmRxWnFsQVl3MUJIVlU5aGEzMkwvbDBYazZEL3ZYV0VjMDFnZjQzL0gz?=
 =?utf-8?B?c09tdkhXZ3dGdW5MOHc4c1VDVERTYUY1NWxidllUSWZVNjZNMUpqMkV5bG9Y?=
 =?utf-8?B?ZHc4MmJTOGU1Z2dUNUpWQW0yUVM4ZVlPQ0FIV2RuVUVtVndwQVFJRW5iVUNY?=
 =?utf-8?B?SEF4cUp6MmRRUEpqNlNMSjBZQTJvY0luYldjNWR0c3V4eUhzRW1MSTNNWHVW?=
 =?utf-8?B?VkNORlBPbHM5MDNIbnVXdG41VUNoMy85RTRsSzQvL1BwUXlyQUNkYXlZaE8y?=
 =?utf-8?B?aDJ0WnFOR2tWUVhaeW9JdWQ5MHQvRTQzYmUrNG9ZSnFDclFkVVZWQm5LM0p2?=
 =?utf-8?B?SDVzYUJEd00zUm0raUJWM2hlOFFHMis4OG15K2c5SWtkVXlBN0dHdkxBc3dZ?=
 =?utf-8?B?U3ZJckJMOVo5RDBIakFYblZiRTVOcTYvT25kV1RxL04vaDdHSndrYm1GKzdO?=
 =?utf-8?B?eWxtZkEycXZoMmpjZTVVaTc5b3ExbG5pODJLd1RsMGk1RDV2cktVc0pzV0xs?=
 =?utf-8?B?Tnd1eSs4cWt1MXpmWnN5QjZHY3Z6TEcwMmM1S1pJQnJId2syOGtsdit4ZU9Z?=
 =?utf-8?B?VThCWW5tM1BFS25kbFI0d3BxdE9yeS9wdGFPM25Rc2R1OTUwOGRrQVFYd0tH?=
 =?utf-8?B?SzdwbExmaXNrdE5VRWEwaGllV2RKSzRLK1IydUd0VlRnSzJZWUx6ZnYyRTNW?=
 =?utf-8?B?V0xiVGZWcDI3dmdXQVgvejV2TmFpR21FeXJ0ajA0SjUzMVhkTWdRZ3FQYW8y?=
 =?utf-8?B?a1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DUBRTql3JL2EbHYUbDzUg/eQWUCj+aikGLgMXI7UAhrLB5l7Ib4fmk4hSgxLuJKEXqZ3JqywPTNqL2x46iU5mKjokPu0HlgzAbFLkyU0UUtb9T51Hw0ZQqJKd8Th6AlpZT9ZUXqg/7JkVMjEIJg7wQJNJHsoRr8l7JMSUjHxbCoAsxpecz+rlvGiwq1TFJF/YGPehG5dtzjLW7fmr19TSZFzMUFgHxBFFsxgH5zKDyoVC+yKxLcMQ3Mcb80urMbs6Xjsl9vLKS3spw6kqtCEoRojFlhTde0QGT7bnkf+641sUS+pZpczWeYNPwVVSwbwc1EA5U738TX5+HF/0UpaZKo5UxQEjzutMKuHKXr0DCSgAxKIs8uTiz0m7xB6VchrEkWWWgFyMGY0wLUGtvS01TeFUdXc60qiYg6if8ZXSu04G6sCBf1QovdGJNj5nzbJY3I9kwlJzK1g4onGtbkUwTDK2CEBT3TGfY7Bx4EsHIjdBHhUcHqvLxVnpljIksuwrtJQpGA2+qaW4BwTttz2EeQ9pBnXf3HBnI7l7YRL9r6w/uklRAMZ1YP8Fu3wX6eH1HT/ZbvFZSQvGep2dvjMPLd4vBDJsG9TrIiKABL0tlI7PYAgWZZ+bJ5rTbgIYU9kTO8z/sQ7xIQ34QFpmQhboI3LaDAUHMhS49/hnAnemZJ+Z8uz9wl1YXn02c0E9LCoHYJcrRn+ExhfhCbxZkSOTC6q8rTv+h9VRNNRQrJLlBUDw6zzPJH8BClMiuy6XGByKzyibKx8fXEWLw31tN4dYLv4GXUAWCyHriIuWUNSYfNb96dX2MpK3ebdUZ7UXMMLPL9OZvysRd8Id0t2RyeWIeP5e1Kp+jcXryZvgoeUr2PfOFssQ7TnDQAXryyonnyz
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19110f5c-0b2a-4371-d799-08db26cd2569
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 09:51:14.2776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2zcsCFJgujE/wLWzqYsfdS3KlMGDoB1yhnlBScl2+wpbsgGAEsE1HCTwu0R93Q6P3OZyCsAMBBH9c8ESxwTzAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5073

On Fri, Mar 17, 2023 at 09:39:52AM +0100, Jan Beulich wrote:
> On 17.03.2023 00:19, Stefano Stabellini wrote:
> > On Thu, 16 Mar 2023, Jan Beulich wrote:
> >> So yes, it then all boils down to that Linux-
> >> internal question.
> > 
> > Excellent question but we'll have to wait for Ray as he is the one with
> > access to the hardware. But I have this data I can share in the
> > meantime:
> > 
> > [    1.260378] IRQ to pin mappings:
> > [    1.260387] IRQ1 -> 0:1
> > [    1.260395] IRQ2 -> 0:2
> > [    1.260403] IRQ3 -> 0:3
> > [    1.260410] IRQ4 -> 0:4
> > [    1.260418] IRQ5 -> 0:5
> > [    1.260425] IRQ6 -> 0:6
> > [    1.260432] IRQ7 -> 0:7
> > [    1.260440] IRQ8 -> 0:8
> > [    1.260447] IRQ9 -> 0:9
> > [    1.260455] IRQ10 -> 0:10
> > [    1.260462] IRQ11 -> 0:11
> > [    1.260470] IRQ12 -> 0:12
> > [    1.260478] IRQ13 -> 0:13
> > [    1.260485] IRQ14 -> 0:14
> > [    1.260493] IRQ15 -> 0:15
> > [    1.260505] IRQ106 -> 1:8
> > [    1.260513] IRQ112 -> 1:4
> > [    1.260521] IRQ116 -> 1:13
> > [    1.260529] IRQ117 -> 1:14
> > [    1.260537] IRQ118 -> 1:15
> > [    1.260544] .................................... done.
> 
> And what does Linux think are IRQs 16 ... 105? Have you compared with
> Linux running baremetal on the same hardware?

So I have some emails from Ray from he time he was looking into this,
and on Linux dom0 PVH dmesg there is:

[    0.065063] IOAPIC[0]: apic_id 33, version 17, address 0xfec00000, GSI 0-23
[    0.065096] IOAPIC[1]: apic_id 34, version 17, address 0xfec01000, GSI 24-55

So it seems the vIO-APIC data provided by Xen to dom0 is at least
consistent.
 
> > And I think Ray traced the point in Linux where Linux gives us an IRQ ==
> > 112 (which is the one causing issues):
> > 
> > __acpi_register_gsi->
> >         acpi_register_gsi_ioapic->
> >                 mp_map_gsi_to_irq->
> >                         mp_map_pin_to_irq->
> >                                 __irq_resolve_mapping()
> > 
> >         if (likely(data)) {
> >                 desc = irq_data_to_desc(data);
> >                 if (irq)
> >                         *irq = data->irq;
> >                 /* this IRQ is 112, IO-APIC-34 domain */
> >         }


Could this all be a result of patch 4/5 in the Linux series ("[RFC
PATCH 4/5] x86/xen: acpi registers gsi for xen pvh"), where a different
__acpi_register_gsi hook is installed for PVH in order to setup GSIs
using PHYSDEV ops instead of doing it natively from the IO-APIC?

FWIW, the introduced function in that patch
(acpi_register_gsi_xen_pvh()) seems to unconditionally call
acpi_register_gsi_ioapic() without checking if the GSI is already
registered, which might lead to multiple IRQs being allocated for the
same underlying GSI?

As I commented there, I think that approach is wrong.  If the GSI has
not been mapped in Xen (because dom0 hasn't unmasked the respective
IO-APIC pin) we should add some logic in the toolstack to map it
before attempting to bind.

Thanks, Roger.

