Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E11615FF5
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 10:37:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435725.689438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqABd-0004aA-Rz; Wed, 02 Nov 2022 09:37:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435725.689438; Wed, 02 Nov 2022 09:37:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqABd-0004Xg-ON; Wed, 02 Nov 2022 09:37:29 +0000
Received: by outflank-mailman (input) for mailman id 435725;
 Wed, 02 Nov 2022 09:37:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g/HA=3C=citrix.com=prvs=2988f804c=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1oqABc-0004Xa-4M
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 09:37:28 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4f4ee89-5a91-11ed-91b5-6bf2151ebd3b;
 Wed, 02 Nov 2022 10:37:26 +0100 (CET)
Received: from mail-bn7nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Nov 2022 05:37:10 -0400
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 by BN8PR03MB5059.namprd03.prod.outlook.com (2603:10b6:408:d9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Wed, 2 Nov
 2022 09:37:08 +0000
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::a093:1d6d:9e9:cbfa]) by SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::a093:1d6d:9e9:cbfa%5]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 09:37:08 +0000
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
X-Inumbo-ID: f4f4ee89-5a91-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667381846;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=YxfV0c7AEX9Hh2v2XHDix8xVkGkplYsJTKmoiFyajgw=;
  b=JdCpJZw/nXH11Qwcl0IArE6aYDJlvsSsrBiueA4dKLyVM2ZrHcZuCIVI
   VGgoeuwVPdGCSmiZ9x4b02niHTx9NF43mX9X8BJc4cavfiKH0Wc4mq4re
   ml9ILNb4AQcYXYXaW3tCb39R9OEXXS/JunOOoW6wh5s2a2XwvGy78QrQW
   I=;
X-IronPort-RemoteIP: 104.47.70.108
X-IronPort-MID: 86523628
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ZG0jSqJXdoSYtLKyFE+R95QlxSXFcZb7ZxGr2PjKsXjdYENSgzRWy
 GNLUW2BMvuMYmvwf9gga4SwpksHucXcmIJhTABlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPewP9TlK6q4mlB5wRkPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c56GUQUz
 8YjcgkGVU6DgP+3+pyre+xV05FLwMnDZOvzu1lG5BSAVbMMZ8+GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/VvpTGLnGSd05C0WDbRUtGGW8RT2Fqfv
 GXF12/4HgsbJJqUzj/tHneE1rGSx3ilAtJ6+LuQyqdmr3TKxUUvVUM0UnaCm/SI0na1RIcKQ
 6AT0m90xUQoz2S7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZjJIdtEOrsI9Qj0uk
 FiTkLvBGjhHoLCTD3WH+d+pQSiaPCEUKSoIY3ACRA5cu937+thr3lTIU8ppF7OzgpvtAzbsz
 juWrS84wbIOkcoM0Kb99lfC696xmqX0oscOzl2/dgqYAslRPdDNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:5/r3gau5uev87LVbnWIsURKB7skC1YMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H6BEGBKUmslqKceeEqTPqftXrdyRGVxeZZnMffKlzbamfDH4tmuZ
 uIHJIOb+EYYWIasS++2njBLz9C+qjJzEnLv5a5854Fd2gDBM9dBkVCe3+m+yZNNWt77O8CZf
 6hD7181l+dkBosDviTNz0gZazuttfLnJXpbVotHBg88jSDijuu9frTDwWY9g12aUIP/Z4StU
 z+1yDp7KSqtP+2jjXG0XXI0phQkNz9jvNeGc23jNQPIDmEsHfpWG0hYczAgNkGmpDr1L8Yqq
 iJn/7mBbU115rlRBD2nfIq4Xin7N9h0Q669bbSuwqfnSWwfkNHNyMGv/MWTvKR0TtfgPhslK
 1MxG6XrJxREFfJmzn8/cHBU1VwmlOzumdKq59bs5TOObFuF4O5gLZvi3+9Kq1wah7S+cQiCq
 1jHcvc7PFZfReTaG3YpHBmxJipUm4oFhmLT0AesojNugIm10xR3g8d3ogSj30A/JUyR91N4P
 nFKL1hkPVLQtUNZaxwCe8dSY+8C3DLQxjLLGWOSG6XXJ0vKjbIsdr68b817OaldNgBy4Yzgo
 3IVBdCuWs7ayvVeLmzNV1wg2XwqUmGLEfQI5tllulEU5XHNcrWGDzGTkwymM29pPhaCtHHWp
 +ISeBrP8M=
X-IronPort-AV: E=Sophos;i="5.95,232,1661832000"; 
   d="scan'208";a="86523628"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XPcp0xFqBMQP/5IXjjU3em6lNIrCieC8NCWqXMUSbkzeDbeXsXb5FPXll8k5dJdz2dwsRrzILpnYcO98TJuRpOguVAYlodIyL8vmH2Z5OhZNLTWqg5USpRdIsEHbN0ZtZnSnjO402+xKAOGRp3UPjRXK5GduKym5oOs1OdWugaJch79KE+NXQMM6tcQOnZYaKvMwFkOA8R2sK8FweoG6wGRzLqyZEMwvMrwGPILijWNXR+etl/EnUfLxpMZ1LDz9NDjYWQlB8tbvCEpEtWgCrZ1IpZ9VgIXb/cK3VU2xXZuSKGOW+Pv+mmiNcI91fv8IsP0DN7RpqFgaapZ0Haq4Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YxfV0c7AEX9Hh2v2XHDix8xVkGkplYsJTKmoiFyajgw=;
 b=Kserjiw07Tmot/JVLSCDS2SeRL8BgZZN0V2+UsqRPMXRxZ2BH7Q3OYvKDHHi/myqSNJsebQNekSu0YyI0w3OZWqPNpMjLSYt7pCV7caJRdnJJIeO170xK5kqdFy9ni78auO35avEkzQGhIIG8qtxNJ58I7S1JcAdHlQWYnPvdIoa/Yc03Lg466TVMfwv+TMSlL7mnQUbQrn8yR/7mQ3Qkdfy3ren8y1KnctuXaKALHn12xcgQWVZ4Z97UCRsCzFHHlp2JLsB0m0HUKrK3RQeibNWILGJTELArmjofOteY9DC42ISCZiPHqsFxPVz6CgLmZo6ntaKiEy5xYBlcXfqDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YxfV0c7AEX9Hh2v2XHDix8xVkGkplYsJTKmoiFyajgw=;
 b=OJ0hzSbife2MA13ympKW13mfrF9Vk21WVq37M8j8eYpe05tQnb7+MHpKV1U/qUW0k5RaS3KfT5jFXOXnfgW6W7VdFI0D7Ar5iVzIb1E1xJeFXk9c1jxShz7kbzqk56iaO1/qZly8bKBd/LX2IkEuKig+Io0bCpTM5f9oAIzWRaI=
From: Edwin Torok <edvin.torok@citrix.com>
To: Christian Lindig <christian.lindig@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Pau Ruiz Safont
	<pau.safont@citrix.com>, David Scott <dave@recoil.org>, Wei Liu <wl@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH for-4.17 v1 0/2] xenctrl.ml: improve scalability of
 domain_getinfolist
Thread-Topic: [PATCH for-4.17 v1 0/2] xenctrl.ml: improve scalability of
 domain_getinfolist
Thread-Index: AQHY7hu6Hfeu3cnxk0m/6L4xh+MTgK4rWegAgAAHLYA=
Date: Wed, 2 Nov 2022 09:37:08 +0000
Message-ID: <38BF59DF-B5DE-4D12-895F-874C41D6B34C@citrix.com>
References: <cover.1667324874.git.edvin.torok@citrix.com>
 <1FD039A8-AE3A-4D6E-A2E9-F446FD6653DD@citrix.com>
In-Reply-To: <1FD039A8-AE3A-4D6E-A2E9-F446FD6653DD@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5888:EE_|BN8PR03MB5059:EE_
x-ms-office365-filtering-correlation-id: 68684270-49b2-47f0-ed4d-08dabcb5cf82
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Wnq6wQjg4I2UsszzQpnLezHA7Pw7uMN3EgPX+sSv13Kg0OYLmZ3coLu1Kz2qkkLLarKwwCbjZYlrt4UDH0XFNa6KGj8tQZqL3wM6MXeq0zi1oT3NnfIv43ywBo9We3mBGaPqRzgJMpqXVTsc701oXTNkTJmVizCtJrgsE6hM/7b5y9BuuLnnc6qb8yAUx1Z8t7UftyKmXksZB5PdviPeH1IBouXkMDlFc5B9jRukfW+Evj4Evy35L8Pn5qxaSpmgGHcdXGfStnfSh3OEuuGKkypcdz9wHc2LlUWmseaCoPTc/jEG9JPXO5afeCXGksP3WyPCRfjPdVLS+hkPa1qWCijvesPWRqugoQBywULNo6NewwArWL3elftttyqPHq5lhdqLMtlREdnG3K8CyAqSkxYOfyTOi+Aus70cm6+Jcsc5qI7914RmfpzdZDyifzy3EJbBVNM6jr6AoivSyA7+pFSAdfEfSwBbuQMOKKBvMu2nWktgMGUZobMm4Bc9TiwASVfyY2KTMs+1hSmnwg0Zj6gIcopf6+9WXSfsZVRgMxOgFT7glePOZCR/mDaT74C9r0q9j4pYiCYE4lbwEBpbcY4OzCdf1PH1ru2IYn13VOUljCPer+7pagM+bSaJJC8b+NwXkuBu325Ln/jP9hCkV/4cKW1LUUc8FaYa/lzrgX5rxCBA9f7LRrT8g4S2tJE0k6wcdNwkum8eN9G54+IL5EQHJEtHnIVjeuBU646l2VTGdgDkkdR6i+rpUKYYDnorABcBZ87tOxTxmFTtlSfrjaFYMxUNXOEY0N9nAoMEULI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(376002)(366004)(396003)(451199015)(36756003)(54906003)(6636002)(6862004)(5660300002)(6486002)(478600001)(38070700005)(71200400001)(83380400001)(2906002)(41300700001)(66946007)(76116006)(4326008)(64756008)(66446008)(66556008)(66476007)(8676002)(91956017)(37006003)(33656002)(8936002)(316002)(186003)(6512007)(26005)(66574015)(2616005)(82960400001)(38100700002)(122000001)(107886003)(86362001)(53546011)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V1lMUWRhMWJjUzRKRUZlRzl5M2dDdFZUY2lrckhPVHArYlUvT0Z2TmMxN1hx?=
 =?utf-8?B?ZjBwUlBkY0dsRjlNdENqYXpvSTRwdDZQQzh2YnBPcENkS1RRU25MWDd2TXUv?=
 =?utf-8?B?QkUrYzhDZHo4T282dFRvTjBQSTgvcDFLdTNob3U4UDVzWDJRNlBNdW0xU0RC?=
 =?utf-8?B?S1FrYnNjQTlBT25nbmQyVStDT213Z3dVTGpzNC8yZE5rZ1FMZUVwSXNqeHdR?=
 =?utf-8?B?b1h5ZDJ2STVWWUNuQnNISmpKRlJ0eW8wNVdBaHZBMXVWMkdrRHBvZ3lyaE4y?=
 =?utf-8?B?NmRjMTEvYXZ5Y3JUYmJPWkRhRXBGNjJIK3RpeTVxNEVjVmFoOHlRVXhnWEFG?=
 =?utf-8?B?aVZYdkQvZDhTMTF6aURIK2Y0TnZ1enlIUGNaWDdNNHRROGxicTVDa1V2ZnVo?=
 =?utf-8?B?RG1WVnROUnJNeGFObEdINHZuMG4xSnlkOUdIY2FDYzRWeW9BZUFwR2RKQkV0?=
 =?utf-8?B?MHEySHoyZDdwQVJROEFTRk02NWhoamxPWDhqTUF2SFBkQWZYbXk4SUFkcDJE?=
 =?utf-8?B?UXdKN1IxYmFhKzlYZEJNL1hsNlVJWHY1RFdhMTVDTTk1TDB0ajZPQ3JSckl4?=
 =?utf-8?B?M1dmTzloYXhad2pZdTZ0MnhmRlhkN1dqK0RkNE1TVEl0blFtNGxYWTBPOHIv?=
 =?utf-8?B?RFNpNGZISEZWenExVTJaR0ZlQ0F0QWpjTUc3Ujc1QlRLSmZ0NHNjV29nTURv?=
 =?utf-8?B?Wm9leUNlb25lRmFCOEFYWHlIeFhHd0ZReElybkFWQVhLVG1nTS91L0NGSUlJ?=
 =?utf-8?B?TTZ3VjlCek5wT3VuZXM3cnAzTjkxL1loNkxUMHYwTkVBMytjNUN0dkhpL0Ev?=
 =?utf-8?B?MkNoL0dmbWZ0OEprQ3Bibkkyckg0cUZuaFFWTG1lMGVxUmVGRnhQY2ZkSG1p?=
 =?utf-8?B?bDVuZ2NheHlPNWZQMEY1djMvWElGVWh3NUJ4MWF3Tm5Qakt3KzZqMkl3SWsw?=
 =?utf-8?B?NUQyd2huc1gzSTFTRXpsSHp2VmFiUkRSVXlzTVFqTVlIOStPSEJkdjlpak00?=
 =?utf-8?B?bGxna3JOa0JpNEpQN2gycngwODhId0wzUG5ld2ZzZG93NWRhZ2txWFNnRjcr?=
 =?utf-8?B?TTJVMmZRVHM3Y2llNGtOQ3RyVjMvQm94dnpDL21zdGNGcEI5WEtzdjgrS09W?=
 =?utf-8?B?S2paMHBpT0QvTGRNV0R3ZU03ZFRDK3VLdEQ3amFWSDZGVXhOdnczS09UaDNR?=
 =?utf-8?B?NDZZQnZyLzhBdCszNU9OTXRJVnVuczk5SU4vQ3I5QVc0N2R3RTdoblFzeG1n?=
 =?utf-8?B?NGdCY1dYcFNBeDFMNFA1bVNXdWt6b056dG9MWkRjMVBlS1E2ZThuQ3AwRHE0?=
 =?utf-8?B?U1ArWXVBRGdEUGRNei94eHZ2YU1jOU55djNrdEltZTJmeGhIWSt2MU9RemVO?=
 =?utf-8?B?cVN0U3BrOUxhckQrL0dtVE9ZUmZGVHRjWjN6V2FXaHV5anczc0gvWE5oMFVG?=
 =?utf-8?B?VjQxMkt6UGpWMmJpK01nN0dSL24zM3JyUm9mR004cDNQNVVSNXZINkxKdXNj?=
 =?utf-8?B?U09qVkVHL2ZDcjNuMVJyUFZLdzlWd0NtQ1I0ejBScSthd1JqVXRGM3E1a2RT?=
 =?utf-8?B?M2gyZFhOanBOMEdoR0hUbnZBUCt2aGluR1JZNUVrNnJwM1ExcSsxYmdzMHA1?=
 =?utf-8?B?VFZoZHpGeGdZalYyVG9VMjNSZEN1MXo4U0ZHT3BsLzRGbkJpLytsTlRHVC9J?=
 =?utf-8?B?ZFdKTCtWREhiRlNLQmRvT2FtRVVjQkZvZVpOTVFNaWRUVkFmbllqSWdraUw0?=
 =?utf-8?B?UWFxTXJJSms4OTc2QVo3M2xzT2lOWmhmd0tyb3A0YzRaUG9lU3UyejZLaG00?=
 =?utf-8?B?L0w3MWtjbCtXemlWZFB3VlU2NmtheGU3Tmh4bDJuRFNVYjg0QjJYVE9WVitE?=
 =?utf-8?B?WVcyMHJRY3dQemJnRVpPR3VLUGVQTTdGUnhrUHdtNktmUDFHa0RES3VGRzI2?=
 =?utf-8?B?VXduZVNzMTBOeUJvOExWdzJMNTRGTmh0SUg4WWxsZUNjSkhEZ3Qvd2tFVS8x?=
 =?utf-8?B?OWhGY3RVN09rSzA4RHg3VzRBN1FEeXBTYWYwN0tTdTY2RndaMkRkdUc3Zisx?=
 =?utf-8?B?VmlURm40Zkw4QTlIUjNGbjFyQVV4UmxDQ2JHa29sU2NuSHRMWmJueG5ZdjNp?=
 =?utf-8?B?Y1ZmMXhoWGQ2dmpCanNEQ3QyK28zMElwcVNmenRRUFNOREpucHdrNS9HbXd0?=
 =?utf-8?B?Q3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <38A13B672E225C41A1C22044F8C21B38@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68684270-49b2-47f0-ed4d-08dabcb5cf82
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 09:37:08.2444
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AIfaj1zS/8rewYwTTZ+6KzMYUWOHli5HMTMA/0hcRnd7/kRG6BTtuIPRx6XoCG3oTb8HmSpPrNFS3K/1nxyknQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5059

DQoNCj4gT24gMiBOb3YgMjAyMiwgYXQgMDk6MTEsIENocmlzdGlhbiBMaW5kaWcgPGNocmlzdGlh
bi5saW5kaWdAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gDQo+PiBPbiAxIE5vdiAyMDIy
LCBhdCAxNzo1OSwgRWR3aW4gVMO2csO2ayA8ZWR2aW4udG9yb2tAY2l0cml4LmNvbT4gd3JvdGU6
DQo+PiANCj4+IA0KPj4gRWR3aW4gVMO2csO2ayAoMik6DQo+PiB4ZW5jdHJsLm1sOiBtYWtlIGRv
bWFpbl9nZXRpbmZvbGlzdCB0YWlsIHJlY3Vyc2l2ZQ0KPj4geGVuY3RybDogdXNlIGxhcmdlciBj
aHVua3NpemUgaW4gZG9tYWluX2dldGluZm9saXN0DQo+PiANCj4+IHRvb2xzL29jYW1sL2xpYnMv
eGMveGVuY3RybC5tbCB8IDI1ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0NCj4+IDEgZmlsZSBj
aGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiANCj4gQWNrZWQtYnk6
IENocmlzdGlhbiBMaW5kaWcgPGNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbT4NCj4gDQo+IA0K
Pj4gSXQgd2FzIGNhbGxpbmcgdGhlIFhlbiBkb21haW5mb2xpc3QgaHlwZXJjYWxsIE4vMiB0aW1l
cy4NCj4+IE9wdGltaXplIHRoaXMgc3VjaCB0aGF0IGl0IGlzIGNhbGxlZCBhdCBtb3N0IDIgdGlt
ZXMgZHVyaW5nIG5vcm1hbCB1c2UuDQo+PiANCj4+IEltcGxlbWVudCBhIHRhaWwgcmVjdXJzaXZl
IGByZXZfY29uY2F0YCBlcXVpdmFsZW50IHRvIGBjb25jYXQgfD4gcmV2YCwNCj4+IGFuZCB1c2Ug
aXQgaW5zdGVhZCBvZiBjYWxsaW5nIGBAYCBtdWx0aXBsZSB0aW1lcy4NCj4gDQo+IEFyZSB0aGVy
ZSBhbnkgYXNzdXJhbmNlcyBhYm91dCB0aGUgb3JkZXIgaW4gZWxlbWVudHMgcmV0dXJuZWQgYnkg
ZG9tYWluX2dldGluZm9saXN0PyBJIHVuZGVyc3RhbmQgdGhhdCB0aGUgY2hhbmdlIG1haW50YWlu
cyB0aGUgY3VycmVudCBiZWhhdmlvdXIgYnV0IGFyZSB3ZSBldmVuIHJlcXVpcmVkIHRvIG1haW50
YWluIHRoYXQgb3JkZXI/IEJlY2F1c2Ugb3RoZXJ3aXNlIHdlIGNvdWxkIHJldHVybiB0aGUgcmV2
ZXJzZSBsaXN0IGFuZCBzYXZlIG1vcmUgd29yay4NCg0KDQpBZnRlciBzb21lIGRpc2N1c3Npb24g
d2l0aCBBbmRyZXcgQ29vcGVyIGFwcGFyZW50bHkgdGhlIHhlbmN0cmwgQVBJIGlzIGJyb2tlbiBh
bmQgY2Fubm90IGJlIHVzZWQgc2FmZWx5IGFzIGlzLCBzbyBJJ2xsIGJlIHJld3JpdGluZyB0aGlz
IHBhdGNoLg0KRG9taWRzIGNhbiBiZSBhc3NpZ25lZCByYW5kb21seSwgb3IgdG9vbHN0YWNrcyBj
YW4gc2V0IGEgY3VzdG9tIGRvbWlkLCBzbyBpdCBpcyBub3QgZ3VhcmFudGVlZCB0aGF0IG5ldyBk
b21pZHMgYWx3YXlzIHNob3cgdXAgYXMgaGlnaGVyIG51bWJlcnMsDQphbmQgdGhlIG9ubHkgc2Fm
ZSB3YXkgdG8gdXNlIGluZm9saXN0IGlzIHRvIGVpdGhlciByZXF1ZXN0IDEgZG9taWQsIG9yIHJl
cXVlc3QgdGhlbSBhbGwgKGRvbWlkcyBhcmUgMTUtYml0LCBzbyAzMjc2OCkuDQpBbnl0aGluZyBl
bHNlIGlzIHByb25lIHRvIHJhY2UgY29uZGl0aW9ucyBhbmQgbWlnaHQgZ2l2ZSB5b3UgYW4gaW5j
b25zaXN0ZW50IHNuYXBzaG90Lg0KDQpUaGlzIGlzIHByb2JhYmx5IGJldHRlciBmaXhlZCBieSBj
aGFuZ2luZyB0aGUgcHJvdG90eXBlIG9mIHRoZSBDIGZ1bmN0aW9uIGluIHhlbmN0cmwgdG8gbm90
IHRha2UgYSBjb3VudCB0byBmb3JjZSB1cGRhdGluZyBhbGwgY2FsbGVycw0KKHRoZSBjYWxsZXJz
IGluIHRoZSAneGwnIHRvb2xzdGFjayBhcmUganVzdCBhcyBidWdneSBhcyB0aGUgb25lIGluIHRo
aXMgT0NhbWwgYmluZGluZywgYW5kIHByb2JhYmx5IGJldHRlciB0byBmaXggdGhlIEFQSSBpbiB4
ZW5jdHJsIHRoYW4gd29ya2luZyBhcm91bmQgdGhlIHJhY2UgY29uZGl0aW9uIGluIGVhY2ggY2Fs
bGVyKS4NCg0KU3RheSB0dW5lZCBmb3IgbW9yZSBwYXRjaGVzLi4uDQoNCkJlc3QgcmVnYXJkcywN
Ci0tRWR3aW4=

