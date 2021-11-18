Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D098456191
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 18:34:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227528.393542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnlIa-0003A4-SI; Thu, 18 Nov 2021 17:34:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227528.393542; Thu, 18 Nov 2021 17:34:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnlIa-00037P-OV; Thu, 18 Nov 2021 17:34:12 +0000
Received: by outflank-mailman (input) for mailman id 227528;
 Thu, 18 Nov 2021 17:34:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=45Id=QF=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mnlIZ-00036X-7C
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 17:34:11 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb502b4f-4895-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 18:34:09 +0100 (CET)
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
X-Inumbo-ID: bb502b4f-4895-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637256849;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ofiiQ1b0AutdvAbJN1H6ZKE46X5b6tcsRdTu9Qzuw3Y=;
  b=NaWJwv+zNieI8Xz1QXoreLb/Z+DdDbuv6hpNlGsGLD+FJjDHixxZ1kbs
   vQFwd8MIjHvvyf8nxiHfCP2mtmyy/QLC1EJ4UXKNUDQyJftvjS6uv7644
   IVbZAiyjiXYLgBAR6dGwISjy1AUz1b0sQWnV2rtPkfmBdEmyoWrffmoTm
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: tpaCmMDIXPAUSobx2PmNqpprz6SnliC8URUbAa7aRpABqL50NeN5d7B/AYhiwORTBPKqSnD84Y
 8rYBlhfDYGd3Tc2vDHKUkzmrRvhvRw4kfQWHYIv1CTwM+T8uOLAAZoqHcmMAoOrKMZRtIyPWJC
 xXRRxse3FjjLSVbkVM7fdF4Uw7i1yuPJZRRGtT7TK71RNvgAzc7jnsPkFMEYekk6wb3/cRfaf5
 2lhbMrOMlrGtplC/ifa8VVKOJxLFTQ2u+501eDDoqNjyUd09u3QWWPIl01d1wATQG1ORjCKBgO
 zvzO6wpBb4/s4oiZkpACd4ZJ
X-SBRS: 5.1
X-MesageID: 60140559
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23: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
 VQIeF0=
IronPort-HdrOrdr: A9a23:Wgpq7qskyG+fxEsoaeXXKjK67skC5YMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJhBo7C90KnpewK7yXdQ2/htAV7EZnibhILIFvAZ0WKG+Vzd8kLFh4tgPM
 tbAsxD4ZjLfCdHZKXBkXmF+rQbsaG6GcmT7I+0pRodLnAJGtJdBkVCe32m+yVNNXh77PECZe
 OhD6R81l2dkSN9VLXEOpBJZZmOmzWN/6iWFiIuNloC0k2jnDmo4Ln1H1yx2QofaSpGxfMH/X
 LemwL0y62/u7XjoyWsmVP73tBzop/M29FDDMuDhow8LSjtsB+hYMBEV6eZtD44jemz4BIBkc
 XKoT0nI8NvgkmhMV2dkF/I4U3NwTwu43jtxRuxhmbim9XwQHYAB89IletiA1DkwntlmOs5/L
 NA3mqfuZYSJwjHhj7B69/BUAwvvlaooFI5+NRjzEB3YM87Uvt8vIYf9ERaHNMrByTh8r0qF+
 FoEYX1+OtWS1WHdHrU11MfgOBEZk5DWytuf3Jy/vB8i1Nt7TdEJgojtY0id047hdAAo8Iu3Z
 WDDkxq/Is+BvP+I5gNXdvpevHHf1Aldyi8eV56EW6XZp3vBEi936IfwI9Frt1CK6Z4gafbpv
 z6ISVlXCgJChrTNfE=
X-IronPort-AV: E=Sophos;i="5.87,245,1631592000"; 
   d="scan'208";a="60140559"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qu7lYGmCpjsTDMaboJItFhenogwBLMJEuZkQL2SydfnF2Rmky0gB3UNn27fIFGONpBGU4abVTH8I9bLdF1/Qz9tkE0Kvmzxh4pZLrccDz3uX6NgXmm5Uel/+HW+M/2Fiu8nElOfp+X7JYtZnw2EVA1QU7BVLSrGNINwJX8dcDk7NftW95RorC0HEwIqdWRrlFdezn4t8wjLfF3tOBARcdSWLKvnX8wXi3kHR12G55J6dG3rlUzY3wGDTGCSXwjTuJx1AeTmLHg9rHXgD4RSodqRK9FsAgWAxuK4R3YsAVOJ1v80yCSRqOLplV5gl2Ga1a1kX5MBuXGGTvCZy9QLDmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9SYIj9X8nhBqniQWZySJ54EN0c1FgMTBGuAkN9AEhAw=;
 b=YSsgWel9x24Wcq0sqjeUSXMbvYYOCSmYCRl3c/ZDrx7l+l0FLJxH9+EIgcZ8/Helkd2UHOudspICH+vjMfyRcFnrGmCt300WmVj/+cON9Ds0AgVPe63yqTeb6rYqMl7+uLcXROt/ml7dzYpuvTAEJa3nxiMBqOP9j6v5iPjMa0QgHFm2FYOR46lcsj3AhsZP2JyuqbaAAxhVUHBR1DYumAbV3BK/S/tnHdjKAfyPH36ie+ARLyQK0+aQmv+ByYaKPSFL3R+5KP8ErMYWVih8QxzpZNMWF6rOq/2fi+wLVD7SNI9BhBfZwJMvTW4N3SEmSAAys914OaIxPDjrnwqFqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9SYIj9X8nhBqniQWZySJ54EN0c1FgMTBGuAkN9AEhAw=;
 b=RyRh0Syh/g9tvUnJNwqDNcMN3ei/uCUALMUT9RhfN6gzCUgp9HYqy267zeMO28MLGJQRJHZgangZaMc0DqpjOTfqAA58H5JhIFWumfS7KYvkIXRekdqYA96Vq99iu8vCdEtxWx7ChX/QmKo61qNMNLaIYDMWf7xaQTTgNlIvu8I=
Date: Thu, 18 Nov 2021 18:33:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Alistair Francis
	<alistair.francis@wdc.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Bob Eshleman <bobbyeshleman@gmail.com>,
	"Christian Lindig" <christian.lindig@citrix.com>, Christopher Clark
	<christopher.w.clark@gmail.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Dario Faggioli <dfaggioli@suse.com>, David Scott <dave@recoil.org>, "Doug
 Goldstein" <cardoe@cardoe.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Josh Whitehead
	<josh.whitehead@dornerworks.com>, Juergen Gross <jgross@suse.com>, "Julien
 Grall" <julien@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Marek
 =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	"Meng Xu" <mengxu@cis.upenn.edu>, Nick Rosbrook <rosbrookn@ainfosec.com>,
	"Paul Durrant" <paul@xen.org>, Quan Xu <quan.xu0@gmail.com>, Rahul Singh
	<rahul.singh@arm.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, "Samuel
 Thibault" <samuel.thibault@ens-lyon.org>, Shriram Rajagopalan
	<rshriram@cs.ubc.ca>, Stefano Stabellini <sstabellini@kernel.org>, "Stewart
 Hildebrand" <stewart.hildebrand@dornerworks.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, Tim Deegan <tim@xen.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Wei Liu <wl@xen.org>, Community Manager
	<community.manager@xenproject.org>
Subject: Re: [PATCH for-4.16 2/2] CHANGELOG: add missing entries for work
 during the 4.16 release cycle
Message-ID: <YZaOgGWfbDkIq4Lq@Air-de-Roger>
References: <20211117095338.14947-1-roger.pau@citrix.com>
 <20211117095338.14947-3-roger.pau@citrix.com>
 <CAPD2p-nb7u7om7zv5-KvfZTsmGis9uGfBkvwjEXrym_+4PN-RQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPD2p-nb7u7om7zv5-KvfZTsmGis9uGfBkvwjEXrym_+4PN-RQ@mail.gmail.com>
X-ClientProxiedBy: MR2P264CA0011.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01a2bca1-da3c-43bc-f11d-08d9aab999eb
X-MS-TrafficTypeDiagnostic: DM5PR03MB2921:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <DM5PR03MB2921FD79F672030205875EB08F9B9@DM5PR03MB2921.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KXCVnSbcBMQBa8MxAug4TjYc0929K96ixe5hgyC/Y94Ec3XjzSFmqbe4XL3T3QfbwcwgiWrPoDkHCd40xYHd2QePsWhuQjxnDz5oZzg3u+Pfiwm+7klSJWNSUBR/+z+Nj+b2PbVxwc0ybrGUVzD06chZprz+4l4WKE+6AdGmqXEbVoM98DV5fhOd4Ziw2DJBMzLAjsc6s0/q3j/bDM3xrZeCe0yR+rmkflTQMMqTWJ7bdZClv6RsmFyGiddmMVXTpQExIMDQKFoXhrnHn6dS5uAeDhvXcNZHkwntw//GzUu40BRw20Uk7wmstQq2vlAxG63FnmoJBvVIWM5VHCA30gi8b2ev5csmhD984bZtaj2r+Yq5fRsgCmMOEL32N7/R/i1ZaZtr6iOUJYFqk2hDtqrWEtK/Ssf75QZBkQScEPslzMkB8jL2OOdm65qjp3ouLIupS1CYnBfaeRe7/rh/HpAt8NQkyr0y/4wujCo8mIAGd/LiMacKRJC85AgilpVlIjJm7BqtXaszHldl1vWYRiUVG4uXcf2t6IpKwZFVza6CsF4qF4K+QkhSsZPeDpsE6ecjdz1nNlfsGep9cvDMA0c8VNsf4P82q5FHqRjBDfoJk3sK1mYnTPsTw0rrsfM0nEhFK+DAkEB4QIlIQoxlb/hD8elnMVNZRN10lLgDJEG4RAt8g+QM9xhy6js49GbqU1M5o8O/6glYsqjSGAq6LsMo/ub97O4o58q78JUQ/ySq83XqVRxh2PA6/mdUCY4tU9S2C8lewfxJG3lnfd3PLqgbwtlMwC4U6Kj9m4jxXEcXLY9B82HbboX8R7JK486GDgx1PL15Q7YVs5miPboFfw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(956004)(6486002)(186003)(86362001)(26005)(6496006)(66946007)(82960400001)(33716001)(83380400001)(4326008)(966005)(2906002)(38100700002)(85182001)(9686003)(66556008)(66476007)(8676002)(54906003)(5660300002)(7406005)(8936002)(316002)(6666004)(6916009)(53546011)(7416002)(508600001)(59356011)(219803003)(207903002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWpnRUFaU0l5ZmlCQXdiNndxSUg3YlNraVRPYXN0MWhrL1JJSlhyMWJkeEYw?=
 =?utf-8?B?TXhvYnBHQTlrVGxoeU1nZW9LV3B6cGhUYlArMDFDcktacExpQllIYjVtU3BC?=
 =?utf-8?B?R2U5WDhiakFoTFBYRnlvb3orWUU4eXFFNDlGS2N3WEZQdnVSNlVaUm9pRU1O?=
 =?utf-8?B?a1NhOXRyVWloQVN3MkluNkt0OGFmS0hTWU1RUWMxTkJnd1VlNzdMc3ZIMmor?=
 =?utf-8?B?cU1SZkp1UWJJMm5TeHVJbXcyVXJuZXowemN3cFR5aGpraG9TcHFTTnJGTHRw?=
 =?utf-8?B?SmdaTE80UVFWTkdxMkNyanB0ZDVEWkZDSEJ6b1ZGZVZrNzhUNFZHZXEyRTFq?=
 =?utf-8?B?SytkWFZEUjczVGtYM0RHZjV0TG9VL1Nkak9hWHNJWGdHNWtYUHVKTkY4UnVx?=
 =?utf-8?B?R1hPelBYa2RVMk15ZU5Lc1VkczZtOExpSzl2ZXZGTFk2cUJQTE1DLzU2VjVY?=
 =?utf-8?B?SmRwRURuRHhndm1EZXZRcDlrTmp0WkRSdnBZVEhwT21XVWM0YmdUZVY5am01?=
 =?utf-8?B?dEFaVTNUcWZ0OUR6UW5DVldjUFROV0JDRU0zNGhoZVhHcnk3REhLRmhpVSs1?=
 =?utf-8?B?ZG5nL0IvSjMrTHgwanVqSEJKcTErOERlajVZT1Y5U1ozVFNmdnBFUGxNV0FO?=
 =?utf-8?B?V0Y2eDVFM2tDM1ZwSml3ekxxTEhBdjZXRTBOc0RSWXM2NkVkdi94cGlOcmph?=
 =?utf-8?B?ZjR1aDl5dHhHMk5SdHZtMWRlSUNrZE9jaS9SelkzTTE1RXE0Rms5cFZxb1Ry?=
 =?utf-8?B?c2VXZzVpUEV1S0xScEkzejVoMUhjbDFBSFRQeVplWTZMRTVUZWlPQU9yQnVC?=
 =?utf-8?B?d0J3WWJDQkxJazZkeHUzQjJUQUhyUHI4UlVCbmtRazNzRUtER2FrektXRmdn?=
 =?utf-8?B?UGl4eVZrcXMveGlaVzdRdk1sZ3dXZGgrWEhrMzNEMDNrT2JXODVISHlxeDEw?=
 =?utf-8?B?ZDlHenBYY0lobDNmVFZRV1h2R2FBUUdxak5EY0NhZ3p5azhZR1lKMWhZT3ov?=
 =?utf-8?B?QVJDWnBGRmFackxXb2E2L2tGTGh6bzNqSjZVZ1UranlmYTNrYTZPSFlKMVZ2?=
 =?utf-8?B?eGlBNUFkSjY0NEg5WFRPNC9tc3NHK1pFb3NXay9iVktsLzRSV0tkSEVZaWhY?=
 =?utf-8?B?TS9NaHlHbWUvZ0tLdGxiOVdJTVF6MkFVelRTNTFrSHp5cy9rZ1hVNWZpVFFH?=
 =?utf-8?B?MW8xU1ZwWG9WVy8zUWROems1MkpMODdrODdqZXh2WVpGNk5Yci9BL3NWMGU4?=
 =?utf-8?B?UUJzWU5USVFMalR3QkY5VDVNdEY5aHhZNEJUbXoyWkwxR3V3OWswNU5NRTN0?=
 =?utf-8?B?ZW9aQnB2YmE5R2ZDL2ZXT2pSNVR2SFIwMGN5SENOL2dMRnhuZU5BRGJWM3FX?=
 =?utf-8?B?NHZBZFJvKzBvbnBFemtsZUdyVXRMQXg4S0hIdi9YcHYwd0tQZHVCN0M0NGNM?=
 =?utf-8?B?R09VRmlPY2tlaVp5NFJvcldmdjhUZjA3K2tpdE9PM01kS0NYaWlkdlNTUlkv?=
 =?utf-8?B?a0lvK1RQeStONVd6K1Z4cXpqbDBYb05xWk85N1d3SXNJZncreExxbENzREQ5?=
 =?utf-8?B?SlVaR1g2M3hVVzk2Nkh3clRGZy92aEtRVGFUQSs2NDlsVFFPUmJ2amxWY3c1?=
 =?utf-8?B?aVFDR1FFaUZHQVl0UlpzTjBQTC81bHpBRGpvVStmYVppSGtId256ekxwZlJZ?=
 =?utf-8?B?aVNQVGdiZ0JBMzJuUjNXRldUaG4wNEpkWHlSNnlTeTNEL0lvcXFRZFlraUls?=
 =?utf-8?B?cEp0akQ4QUFIcmZhZmQvUDR6K3QxOHBMQ013QUpBZnMyVGNxTkI3bXVsQkcz?=
 =?utf-8?B?R1AwU010N1dnVkx1cCtRTGZwWWtUa3pqeXpNTUl5TkwrdkVBdXVNTE5PenE1?=
 =?utf-8?B?b0FZNU1SSTFhUDg4aEgvL0xpUndtZEg0M3VqNXFLNVp3cTVmRklXcGw1Q1pC?=
 =?utf-8?B?T3orOC9kUDNyTHkxOXlyZ3pzSktZNVRzZ1RMQlVheVpCSDhCenAxdnJ3c2c3?=
 =?utf-8?B?b2c5SWVFUGZ6VUNFUmR1cSt6cVh4VDlrODdqTjNlcVI5RU1EYjR1dFgrYTg2?=
 =?utf-8?B?NDVMNlJFamlxSytpT0RqNWxOUVAzRUJ2NTU3eEwyM3ltQnl1Y3JwQzRxR1I2?=
 =?utf-8?B?TkwwMmJlSmZSYVVwenpZRjAxamlISmk1WmhzOXhMb0Z2NGk2THhOV3lZbTk4?=
 =?utf-8?Q?JVHX39Iai153PmE2PXWhIRQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01a2bca1-da3c-43bc-f11d-08d9aab999eb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 17:33:57.8948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uKhSo/FZ8prQOFyeAJjHqyErXY6c3SN8h0jfbKkrs6pP9SXBwTHy/e7LgWe3DnDXmeGdhGFcK5rETNFKa/1KJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2921
X-OriginatorOrg: citrix.com

On Thu, Nov 18, 2021 at 06:11:07PM +0200, Oleksandr Tyshchenko wrote:
> On Wed, Nov 17, 2021 at 11:54 AM Roger Pau Monne <roger.pau@citrix.com>
> wrote:
> 
> Hi Roger, all
> 
> [Sorry for the possible format issues]
> 
> Document some of the relevant changes during the 4.16 release cycle,
> > likely more entries are missing.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  CHANGELOG.md | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/CHANGELOG.md b/CHANGELOG.md
> > index ad1a8c2bc2..8b0bdd9cf0 100644
> > --- a/CHANGELOG.md
> > +++ b/CHANGELOG.md
> > @@ -21,6 +21,17 @@ The format is based on [Keep a Changelog](
> > https://keepachangelog.com/en/1.0.0/)
> >   - qemu-traditional based device models (both, qemu-traditional and
> > ioemu-stubdom) will
> >     no longer be built per default. In order to be able to use those,
> > configure needs to
> >     be called with "--enable-qemu-traditional" as parameter.
> > + - Fixes for credit2 scheduler stability in corner case conditions.
> > + - Ongoing improvements in the hypervisor build system.
> > + - vtpmmgr miscellaneous fixes in preparation for TPM 2.0 support.
> > + - 32bit PV guests only supported in shim mode.
> > + - Improved PVH dom0 debug key handling.
> > + - Fix booting on some Intel systems without a PIT (i8254).
> >
> 
> I would add "Various fixes for OP-TEE mediator (Arm)" here and ...
> 
> 
> 
> > +
> > +### Added
> > + - 32bit Arm builds to the automated tests.
> > + - New x86 pagetable APIs.
> > + - Arm vPMU support.
> >
> 
> "Extended regions support, device tree only (Arm)" here.
> 
> ...
> The extended regions are ranges of unused address space exposed to domains
> as
> "safe to use" for special memory mappings.

I've worded this as:

"Report unpopulated memory regions safe to use for foreign mappings,
Arm and device tree only."

As "extended regions" was IMO too vague. Let me know if that's OK.

Thanks, Roger.

