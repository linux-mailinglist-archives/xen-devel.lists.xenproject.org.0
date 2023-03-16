Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 182876BCACD
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 10:28:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510425.788070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcjtV-0002kE-5H; Thu, 16 Mar 2023 09:27:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510425.788070; Thu, 16 Mar 2023 09:27:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcjtV-0002hg-2a; Thu, 16 Mar 2023 09:27:33 +0000
Received: by outflank-mailman (input) for mailman id 510425;
 Thu, 16 Mar 2023 09:27:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQdT=7I=citrix.com=prvs=4326333c9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pcjtT-0002ha-BJ
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 09:27:31 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c31c6985-c3dc-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 10:27:29 +0100 (CET)
Received: from mail-bn1nam02lp2041.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Mar 2023 05:27:21 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by PH0PR03MB5847.namprd03.prod.outlook.com (2603:10b6:510:35::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Thu, 16 Mar
 2023 09:27:19 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 09:27:19 +0000
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
X-Inumbo-ID: c31c6985-c3dc-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678958849;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=noeeStbSwfEN9WGKxSLo/qFpVEV3FNLZMybDH/ZJL5o=;
  b=aDgpSe0S/Jb8SgEh0xv5JeKmGFvrmo/5eoG++ZakUcS98OQWlbYE2wpP
   FMiU2n8nyXapbUGbUXrZUpVlu18mI9mFQhchK4+aAz6npDBKq66XpP67g
   8K4sbtzp4yEboifoFVqWBKx+53VCweOd1kkm4VsFZm9NCtw7F9O8j9cJH
   k=;
X-IronPort-RemoteIP: 104.47.51.41
X-IronPort-MID: 100452991
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:SWeSD6omrCJWgFpYE+aer1Tb0tBeBmJ2ZRIvgKrLsJaIsI4StFCzt
 garIBnTO63ZamGjL410YYSypkkEsZaHxtRiGwBs/nswFS9E+JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weFzidNUvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACJQbirEjMvn/JmcZvdKpfsxNpTCOapK7xmMzRmBZRonabbqZv2QoPV+hXI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeGrbIO9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiANpOSefpp6cCbFu741IpJ14odVKAg6OQsQngV5Fgc
 mE15X97xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L8+B2FD2IJSjpAbt0Ot8IsQzEuk
 FiTkLvBHzV+9r2IQHSS3r6RoXW5Pi19BX8PY2oIQBUI5/HnoZovlVTfQ9B7Cqm3g9bpXzbqz
 FiipSwzl7wVgcMRkam24FvHjiiEr53FCAUy423/VWK/7xhlZYejIY+v5F7a4t5JKYrfRV6E1
 FA/h8WB5foSS7GMkCCASv8EGr2B7vOJdjbbhDZHFYQ75T2p/HKkYol47zR3JUMvOcEBERfpZ
 0ncvQ5QvdlTIXKsYod+Zo73AMMvpYDiCNDkX7bGbtNIbbB4cQPB9yZrDWay3nnsmU5quqEyP
 7+SdMrqBnEfYZmL1xKzTuYZlLUtnyY3wDuJQYihl0j+l72DeHSSVLEJdkOUafw057+FpwOT9
 MtDM8yNyFNUV+iWjjTrzLP/5GsidRATba0aYeQNHgJfCmKKwF0cNsI=
IronPort-HdrOrdr: A9a23:uW6EUajKra7CF2JYpEL4i4IGNHBQXiAji2hC6mlwRA09TyX5ra
 2TdTogtSMc6QxhPE3I/OrrBEDuexzhHPJOj7X5Xo3SOTUO2lHYT72KhLGKq1Hd8kXFndK1vp
 0QEZSWZueQMbB75/yKnTVREbwbsaW6GHbDv5ag859vJzsaFZ2J921Ce2Gm+tUdfng8OXI+fq
 DsgPZvln6bVlk8SN+0PXUBV/irnaywqHq3CSR2fiLO8WO1/EuV1II=
X-IronPort-AV: E=Sophos;i="5.98,265,1673931600"; 
   d="scan'208";a="100452991"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YD5DbfvFXGse6e8dnbIlH1Qt0hk6x6w/mmv4gdg+YCC8bWPeWZz8dyb83aLuMGaJKd0U7G7t83JtGomwWH9GPQtPEb8lFdFsAoEm68WiBF9SkilHKkTk3jd9iNaKw9aAlIjAtd0qPnh/BZpCAOvgTyq53xUm65VwDKOIVVObOFXzYgoNIy0GDHvOKOtScbHBjHafTqwk4aVQQXIFE0oZM7TAIMATSUmhJu2KBmuqab9Ah+76P7nfoPwob6qkiX0FkC9juc01YHdumHEiR6AHcK4m4dKVIVZSAwN3JSxLVhvr9aIwmLrkjm+CszYr4cKW6g6MfGg86YwX0Br1ijqPwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I1C8dBfsG21s0mNc6NHFCuH8z+BB42CbPVqLevqhTuY=;
 b=TUw8xUEXR8/VqMaaZiQfghEg7HzrO6tvmOpR3ghHZi89C7lb/YHTfC0AnNTw+bu5mO2s1i2vnhpYjfKl4f3bcjc0v7W/Dhf1QccDJTMOLNru3nnn/n47kwf++YVflO4MvVaRzY7XsA1GRFaXKrE6w7tdq2FQ6z8gl7AhUVc1zCSx9xij6ZCtErqqvAG93MzPEpWtlFggtQA2G0EkmThuvARwY+mTpqnpzG22YmiuKVgd48dzqTr7qVSguSr5CuQxzQ9QRHaVrOQe9KUAhdyiBx+aeyPq0MjE9qQa18AxtN8ShKLIb+fIjOSlVctgJ/twGKOodwVDvSIjsGqA0iZ+7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1C8dBfsG21s0mNc6NHFCuH8z+BB42CbPVqLevqhTuY=;
 b=Yn6r8VYvX/VqP1O6X4Wi0Yg4gh9sJbAwHekX/6GsT7HajNr7ErmDtNPYxFNieC0SfSIRl9m1Vmqn7PtZD7yzR/t+PVeFwcj7k1HP6EYFY189Gj4KN18hlOw/lNAtMKrVlLrOEnPq/UCAU9OFRYst5dm/VxdnWAejbx5dz84aRLE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 16 Mar 2023 10:27:13 +0100
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
Message-ID: <ZBLg8WB8HCoZvwz5@Air-de-Roger>
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-7-ray.huang@amd.com>
 <ZBHz7PpUbKM69Xxe@Air-de-Roger>
 <alpine.DEB.2.22.394.2303151729590.3462@ubuntu-linux-20-04-desktop>
 <e8843d7a-eecc-373c-a6b3-6a893bc0eb2a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8843d7a-eecc-373c-a6b3-6a893bc0eb2a@suse.com>
X-ClientProxiedBy: LO4P123CA0680.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::9) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|PH0PR03MB5847:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a66e7bb-71dd-4e7f-efcb-08db2600a366
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d+tUEKHge/N+1+mYBgi2Oz8AzpYPudCpYhoqiULbR4H02WdUqM3E0kI38n16oeF8qnDDfGVDqORcBckuY3RanWWrQYtQIvYL20FwL0Q5pLx54HX5K7Sx3YZHOtyVv5QMUKBHnqC4JD2X9lm77j9x+eItGt7SDjCqkdrQZ7UK8tq6xWFSZUNf+CCrnrI+drqBRFItVV9xgf4nonqRoxjOxPSy1gRe1fgyK+gumtyMm5tswaV2SXvUQ65ltdqBGh2y/Q0f+XZyKh5wYctTpaDvK53nfrAbvsAaFwv6qCp3PCXP7sUmSrKbaXdczfoV4SWYgt4bpPrzuI0a9gbbgRN99alz2KbXzFTvgSC3Rzs7gy8RBjq6VgH/+82+7AJ3aGDOUARbNQcSx3+izSXAc3qghV+UIg3hpTtGqtEYj0QPjdgz587O4FfAUjfW2B5lxIILZw5bzbSxbganXIYXr+XD45XlRSMkNXKacwL5riR7/ovSddUPb5CBctJNGacp5e2LMtlV3bKTJ0L/tBWvqv+aOLcYJZhL5o9KoNHrFbbtciVUkaWLLjEs5rHC9cN8Azf1C9rh745pMGBzdS3wzl7Hi8fCd99oZSj5GcvaipYJmp07vxzf+R6VMe1x5oWaLlXaeHbsVyJxJzjIU0avEDXSvA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(7916004)(136003)(346002)(376002)(366004)(396003)(39860400002)(451199018)(8676002)(8936002)(85182001)(2906002)(478600001)(66476007)(5660300002)(66946007)(4326008)(66556008)(6916009)(7416002)(41300700001)(86362001)(316002)(54906003)(9686003)(6486002)(6506007)(6512007)(82960400001)(6666004)(53546011)(186003)(33716001)(26005)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVFQMUttUzRYRzExUENNQ3VFS0k3UUhsMGlwT1hwWFFUQkRUaGdSa1h2enR0?=
 =?utf-8?B?WmZuV3JxaGdzQkYzZ0UwbjhpNXZhOFlUcjNGSDFDdFh0blFMcnNCT3hGYlJL?=
 =?utf-8?B?VTZIVkhOb2UwMENwNFdPOEFFOGEwMTVZTjY2N2l4UFlJWDJMSTJUTEZGaU5W?=
 =?utf-8?B?YkpqUEV3aWtwWHN1ZVNqLzU2U3BPZDl3ZVFKcGg3SlkweG5RQmZMN3N6d3M1?=
 =?utf-8?B?cFBOZlYzaFlOcUtJTjcxZVA4dnZwV00rdjdjUEpZYnQyempUTW14dlpVbkh3?=
 =?utf-8?B?cW16Rk0zL0JYVklOQmIxSEhHTWw5L0F0ZXFPbE9ib3NZTjl2R0VoUEhldVIr?=
 =?utf-8?B?MSt1KzloZmFSbHZidmhEOU5iSjQwaU9hdnZjb2x6WDBPb1BLM0pzWkNSOTIw?=
 =?utf-8?B?UzBnUkRDV05XdXgwZEorT1RLdVEveXRKcitWcHBJSDhtUDNKVDNQREpGeDJL?=
 =?utf-8?B?TFA2Tm9nL0JFeXIxQ0RPT0N2UUtJUEk3S3dBM093VkVuSUFVWWJnZThSeU5o?=
 =?utf-8?B?Wkk4a3JiN0pPRTB3OEJNMTYxOHhDVVFqRGtHYVA4SVNYbE1sV3M5SkppUlY5?=
 =?utf-8?B?cVhXZmUycFpkT0plWmVORDNOZDdCV091M2cwMVBBa3ZsV25vczc5OE5Xelpu?=
 =?utf-8?B?RXJsTmd2UmZiME9aSjl6K3F2K1QvNHIxaXZnRDhLRGovNy94VGlYSFBGaEZG?=
 =?utf-8?B?YkhYUGNkYkpNbkFKTHp1V2hIaEN6QmJ6bjd3WlJNczZaem9hV0tKZXYwM2ly?=
 =?utf-8?B?TUMvSVJpZGpzVUt0NFpzU0pYWHdyL1ZZNTFlb3Y3bFZiMzgrY3dLUW1Ickdk?=
 =?utf-8?B?emt4NkgvL1Uxc0J1cmJIMWNXVFlKRWhYRzdpQnEzSC9BT2dHQ3FHMlpqam5x?=
 =?utf-8?B?aFc5a0twMUtWTFpyeUltWWp1WGZLYnRNZVdmTHJyV3ZjZGpmMmVPNlZ1QWU1?=
 =?utf-8?B?NGpINkJUM2xhaXBUMTdOM0lHT3Jpb3VRWUNkK2ZUY055by9JNzdHcE5OM0Ft?=
 =?utf-8?B?bWRMK0hLV0lJeDF4bGNKWWZGVE5zLzZLZEYrcGdBZ2NSeXNyRzk2RXd1OTc0?=
 =?utf-8?B?VzNYVkNTMUxCNmxyVWREZDJBZjNubzNveGJwK1B3b2VCa1F0QXRMQ3VVRnY2?=
 =?utf-8?B?bGMvMjNNL2t6OEVBUlVTTVAyRzJTbkFhQjlZTGNULzIrejdxU0NoaS94Qmp0?=
 =?utf-8?B?S21zb3Zhbmw1RW5ZeUhKNkVLQi9KU0tCaFJ2WnFUMklTdkp0aXZrd0RoYW8x?=
 =?utf-8?B?alpkV2xNUGtBWlFOUmZzOGd2REZjT05FdVZRQ3RnOG03c1FoZVVKS1pncFRr?=
 =?utf-8?B?SlAxcjBISkQrdU8rWHRmY3VZcUYvNzdPVDYyQWJTSU4yMGJJd2RPZDNsc2F3?=
 =?utf-8?B?cDV6M0N6Z0NLR044L1VmOUh0b2hMU0hSaHlwcjA2QXRpdW9oTEYyazBURnVU?=
 =?utf-8?B?S0ZYYU1PZW1uRFFoS01YZTB3SStaNjVkc3pPWWpGWi92OFlDanhvelNEMXBK?=
 =?utf-8?B?ZjkwMWhFb1h5M0RnS2hoTXN5dVNLbThod1lKbTJMeFh1dTFybWd5MjNrNm1a?=
 =?utf-8?B?U2ZVQ1U5Z0U0YlY5R3ZZRkJsSUdQOU9aNVNVK0lPejI1Nmt4bEw4cnBVSUNP?=
 =?utf-8?B?ZVZ4U29zYWJjamsvRDlrR0RDVXM3ZE1PdENKMVZ3NHBUNnNrdGZJamlyaEQ2?=
 =?utf-8?B?OFhsL2tibzNNU2l4eUN1cTlad2FlRDQxYTJUbjVSRHcyc3dzb0FXNndROC9I?=
 =?utf-8?B?T1cxcm56T2toODEvRjdHZlpUdkEyUXMyVEdmR054M0oxejV6dmVCSkZWZmRT?=
 =?utf-8?B?UjRnQVBJOHlmd2NBZUNhcHBaMm5xTkp1NTU2cjNrQktZdWY4b0NmeTRqZmxY?=
 =?utf-8?B?TzMvTWx2amE2cytLOEkxSGZnTmZhZHM4VFJOZ1ZoamN6NWovVjhhbnhIK054?=
 =?utf-8?B?S082U1FzWXBrZUZuN0xldks1RHd0UFExc0x2cVNhWitKY09ZVWlIc2psUEx6?=
 =?utf-8?B?UGlvUmUwRWpYY3BmS1BBTk5Vbms4OVNzVTl4ZE9WSEgxTmV3YndsQyttOHor?=
 =?utf-8?B?TEZGMW00T3JLbEk4T29xL3paUjBHcmcwMHpFSElUZDcxQW9NTEN1QTdNQ3BY?=
 =?utf-8?B?MW1yOGNzaEZ2dlk4UGJqd1Z4MnByTGhRRGlUTVRwbFFxVno0S3VuT2pRNkxL?=
 =?utf-8?B?MUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XeD8n0+gkWC1TgdPxBDQMyRsTBTeD586OVSSA4+KGI3CfsETAiHpV3ORca+b+4KTUKe8din7MLVcgZSEaf4ShaNDwk5D9ztSTOn6t/ppO+nv6P/hWVenjtUGDO2H70xyIAkbkBDujzrufvvE/2ghlNPYbmhu28aCgYRL42lsJB8e98U8mk7TxR5MXdXvNmNWS5auXAvi7qlnaa8TQIJTo9y+Yi3yTQnouturcAY7TKNrgw8pbOAhEV0XoD+bHMfmSK6l3L3b9C8EwwZp/ma3ujQt+RZKF9ZWUkfmmBxdYvvHXjaImXxqnxysTWMwSrBrvWzU16qwciR3GOAgHkNd9j+l3ybMeBdStJ75I30KvUJLAPoaaV+BQI9tO+eWRCHcprrNhGxelnC42uwqeYON/ZWIW6B6lgXGui/p8l+UQmMzYO3v52RID6x4vECuFsxGJxnkr78W5BnPJFzAQ5j9r6NjQFY5KKBM9Qr/5tvEM7TuZKsDNwJdjDSGCV2UBOphkOufpvkj/sDb1uBWFkRsmOuVooJzzV2e0xiuxmKgDlHgYJ6dRtdYZoWLXXWHr3YHqcHXah+OWMkH24vjY49eIPj/5aK5YwaKrrsxHQwpM0pzDWdxeKKFMBw18p8IE9e4JpEMDLpbTZWlok6M3XlBH2xhszq/kKj/ULcp4gw6C86LHNlutZp4yLzMawLV9j8D3jAuJkQjW37FQZySAET23pVH7YH5dtrilafJyoeNIAmVSaEiOu6ubxY6RuebaiFTLDob+X8LUQ9uPrzHL3HAV6slID6fXGyZHHg4hdPvkZMpsKl5TTVVSJ93jMRYa47kL1wreV8alS7UAHzHo23NnsjgseoEW17guedctdjdQ0JFtjcKw+ns/VWRsYRoyb2E
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a66e7bb-71dd-4e7f-efcb-08db2600a366
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 09:27:18.9000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WnuRN2r1tA2ic4YxCqpBQ7afilq8F9t7mYXE0rLN3CToEoJSxFzPTk8JVzlx2ecaRrAlbwPV+oPT5BRgb2Tp/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5847

On Thu, Mar 16, 2023 at 09:55:03AM +0100, Jan Beulich wrote:
> On 16.03.2023 01:44, Stefano Stabellini wrote:
> > On Wed, 15 Mar 2023, Roger Pau Monné wrote:
> >> On Sun, Mar 12, 2023 at 03:54:55PM +0800, Huang Rui wrote:
> >>> From: Chen Jiqian <Jiqian.Chen@amd.com>
> >>>
> >>> Use new xc_physdev_gsi_from_irq to get the GSI number
> >>>
> >>> Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
> >>> Signed-off-by: Huang Rui <ray.huang@amd.com>
> >>> ---
> >>>  tools/libs/light/libxl_pci.c | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> >>> index f4c4f17545..47cf2799bf 100644
> >>> --- a/tools/libs/light/libxl_pci.c
> >>> +++ b/tools/libs/light/libxl_pci.c
> >>> @@ -1486,6 +1486,7 @@ static void pci_add_dm_done(libxl__egc *egc,
> >>>          goto out_no_irq;
> >>>      }
> >>>      if ((fscanf(f, "%u", &irq) == 1) && irq) {
> >>> +        irq = xc_physdev_gsi_from_irq(ctx->xch, irq);
> >>
> >> This is just a shot in the dark, because I don't really have enough
> >> context to understand what's going on here, but see below.
> >>
> >> I've taken a look at this on my box, and it seems like on
> >> dom0 the value returned by /sys/bus/pci/devices/SBDF/irq is not
> >> very consistent.
> >>
> >> If devices are in use by a driver the irq sysfs node reports either
> >> the GSI irq or the MSI IRQ (in case a single MSI interrupt is
> >> setup).
> >>
> >> It seems like pciback in Linux does something to report the correct
> >> value:
> >>
> >> root@lcy2-dt107:~# cat /sys/bus/pci/devices/0000\:00\:14.0/irq
> >> 74
> >> root@lcy2-dt107:~# xl pci-assignable-add 00:14.0
> >> root@lcy2-dt107:~# cat /sys/bus/pci/devices/0000\:00\:14.0/irq
> >> 16
> >>
> >> As you can see, making the device assignable changed the value
> >> reported by the irq node to be the GSI instead of the MSI IRQ, I would
> >> think you are missing something similar in the PVH setup (some pciback
> >> magic)?
> >>
> >> Albeit I have no idea why you would need to translate from IRQ to GSI
> >> in the way you do in this and related patches, because I'm missing the
> >> context.
> > 
> > As I mention in another email, also keep in mind that we need QEMU to
> > work and QEMU calls:
> > 1) xc_physdev_map_pirq (this is also called from libxl)
> > 2) xc_domain_bind_pt_pci_irq
> > 
> > 
> > In this case IRQ != GSI (IRQ == 112, GSI == 28). Sysfs returns the IRQ
> > in Linux (112), but actually xc_physdev_map_pirq expects the GSI, not
> > the IRQ. If you look at the implementation of xc_physdev_map_pirq,
> > you'll the type is "MAP_PIRQ_TYPE_GSI" and also see the check in Xen
> > xen/arch/x86/irq.c:allocate_and_map_gsi_pirq:
> > 
> >     if ( index < 0 || index >= nr_irqs_gsi )
> >     {
> >         dprintk(XENLOG_G_ERR, "dom%d: map invalid irq %d\n", d->domain_id,
> >                 index);
> >         return -EINVAL;
> >     }
> > 
> > nr_irqs_gsi < 112, and the check will fail.
> > 
> > So we need to pass the GSI to xc_physdev_map_pirq. To do that, we need
> > to discover the GSI number corresponding to the IRQ number.
> 
> That's one possible approach. Another could be (making a lot of assumptions)
> that a PVH Dom0 would pass in the IRQ it knows for this interrupt and Xen
> then translates that to GSI, knowing that PVH doesn't have (host) GSIs
> exposed to it.

I don't think Xen can translate a Linux IRQ to a GSI, as that's a
Linux abstraction Xen has no part in.

The GSIs exposed to a PVH dom0 are the native (host) ones, as we
create an emulated IO-APIC topology that mimics the physical one.

Question here is why Linux ends up with a IRQ != GSI, as it's my
understanding on Linux GSIs will always be identity mapped to IRQs, and
the IRQ space up to the last possible GSI is explicitly reserved for
this purpose.

Thanks, Roger.

