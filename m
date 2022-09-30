Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 324895F0E51
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 17:00:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414271.658461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeHUY-0004rY-Cr; Fri, 30 Sep 2022 14:59:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414271.658461; Fri, 30 Sep 2022 14:59:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeHUY-0004ou-A8; Fri, 30 Sep 2022 14:59:54 +0000
Received: by outflank-mailman (input) for mailman id 414271;
 Fri, 30 Sep 2022 14:59:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wr4v=2B=citrix.com=prvs=26507fef3=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1oeHUX-0004oo-F6
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 14:59:53 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 879e5f76-40d0-11ed-964a-05401a9f4f97;
 Fri, 30 Sep 2022 16:59:51 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Sep 2022 10:59:43 -0400
Received: from DM6PR03MB4172.namprd03.prod.outlook.com (2603:10b6:5:5c::23) by
 DS7PR03MB5639.namprd03.prod.outlook.com (2603:10b6:5:2c6::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.23; Fri, 30 Sep 2022 14:59:41 +0000
Received: from DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::fef5:dc53:67d3:3498]) by DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::fef5:dc53:67d3:3498%6]) with mapi id 15.20.5676.020; Fri, 30 Sep 2022
 14:59:41 +0000
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
X-Inumbo-ID: 879e5f76-40d0-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664549991;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=WMQpZm3HSu3S7zdP39USfEMSqo83saX/tKwg2Rhrdms=;
  b=T+KIg68z8QAXkcb0c52aBIp3wiljIMdI9a/QEXw9HSADPkjKzyk5UvrM
   v5lQ24aZCZrSSk1Kiboje0RQiUDSUWAhE6UO5xUgBEs/Np2U6MaL0NEO/
   PVB5wZIBs9vh23W4HoOZU3Psq4rnw6b/2ThfpU53kL/U9wk0u5uOXoZa6
   g=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 80841302
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:FcLgmK1sgS8BTWb2s/bD5fVwkn2cJEfYwER7XKvMYLTBsI5bp2MHn
 zdLWWvSb66OM2T8LtsnaYm0phgO75SGy9A1QFc+pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNPg06/gEk35q6q6WhA5gZWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqVb3uBlXm9K8
 sU9NWEqfE6bhOCn6Z2SH7wEasQLdKEHPas5k1Q5lHTzK6ZjRprOBaLX+dVfwTE8wNhUGurTb
 NYYbjwpawncZxpIOREcD5dWcOWA3yGjNWEH7g/F4/NpsgA/zyQouFTpGNHVYN2RWcRcmACcp
 2TK/mvRCRAGLt2PjzGC9xpAg8efxXOnAdlKTtVU8NZGowSV7z0XFyEQbku/itCAj3CUaYNAf
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpZNU4uecsSDct1
 1vPmMnmbRRwtJWFRHTb8a2bxQ5eIgAQJG4GICUCHQ0M5oC6pJlp10yeCNF+DKSyk9v5Xynqx
 CyHpzQ/gLNVitMX06K8/hbMhDfESoX1czPZLz7/BgqNhj6Vrqb8D2B0wTA3Ncp9Ebs=
IronPort-HdrOrdr: A9a23:bw7jka6F9XRANusjXQPXwWuBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhI03Jmbi7Scq9qeu1z+853WBjB8bZYOCAghrlEGgC1/qp/9SEIUHDH4FmpM
 BdmsRFaeEYSGIK9foSgzPIXOrIouP3lpxA7N22pxgCcegpUdAY0+4TMHf4LqQCfngjOXNPLu
 v42iMonVqdUEVSSv7+KmgOXuDFqdGOvonhewQ6Cxku7xTLpS+06ZbheiLonys2Yndq+/MP4G
 LFmwv26uGIqPeg0CLR0GfV8tB/hMbh8N1eH8aB4/JlagkEyzzYJ7iJaYfy+Qzdk9vfrGrCV+
 O85CvICv4DqU85uFvF5ycFlTOQiQrGoEWStGNwyUGT3fARAghKRfapzLgpDCfx+g4uuspx37
 lM2H/cv51LDQnYlCC4/NTQUQp2/3DE6EbLAYYo/gNiuKYlGchsRLYkjTVoOYZFGDi/5JEsEe
 FoAs2Z7PFKcUmCZ3ScumV02tSjUnk6Ax/DGyE5y4eo+ikTmGo8w1oTxcQZkHtF/JUhS4Nc7+
 CBNqhzjrlBQsIfcKo4DuYcRsm8DHDLXHv3QSqvCEWiELtCN2PGqpbx7rlw7Oa2eIYQxJ93g5
 jFWEMwjx9HR6svM7z64HRmyGG/fIzmZ0Wd9ih33ekIhpTsALz2LCaEVFci18O9vvR3OLyoZ8
 qO
X-IronPort-AV: E=Sophos;i="5.93,358,1654574400"; 
   d="scan'208";a="80841302"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eFvcqo/1w+EvbDM0TFtnxi0e5RF3cRHUooUtf8byMwQOMMYfURUf2ntwUAqS0sykI8AveK9tDBaA9sXJiOeXXy1ygn9p5enKsUsLdJRjmECjxwZC7+qKKJ05zKDmpp69TAc/0Lz1fIbRRRPTzoYumyukp2pVeveMzdIrRVTBKwJjrxMCxin/XRCf3/xrT2gsjo9tZHGZQ/aE8WuhJwd++JFPMoGXXr6abcH3V21wByUe24QAWwKifbDDeOaTqJXOfGZGBEVkHz1BqAYV33F3oQGm8e3pgCBpBnADPRStDBiNTDRlcZqrk8zAZ/pMW/Dm4eDkdK0AXYIemVFW1CZE0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WMQpZm3HSu3S7zdP39USfEMSqo83saX/tKwg2Rhrdms=;
 b=WKRnCjA1qbQ+BdwNUDzL4Lufv1IZ3MDCoTDJA60GMCPS5rIVDauM3ck+dGS2T3ULSYhYmnhVqEwu04cor/Lu7aebh2K6QH6csPefIDoolDzqwPUweST1qm95MaFwAazhup1LsxtbLjnKm9Uk5i8FaRj2DFr8oO4kg1Ueku96pElSxYGRqIunAEX4i4V9cO66aFnKVYHziDdDnz++BhQxTO3OB4nrxq5ijMjY2T6b4ibb+eG/PSX8jNGJxCM3teWD2Sov0UH3T0JYCYryxp3in0AXjxESlHh4Lz6Up4iWOuGIoWouYhFIYCdWtmQhrsz3K1aohbKV/8g9WrkmsUtJUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WMQpZm3HSu3S7zdP39USfEMSqo83saX/tKwg2Rhrdms=;
 b=JSO7KkbaOnQXMEG2XX+LomiIJmKxNQkfl3xGF3VUU/MhVlNakXm+Jsk9YkUsaYXydt/051xMPICd4KkRmg02bvpDJGtS3oI5FdL7WjVTof8PT3YDqerbzF4a6KI4nNsH0O486cgChJnzmTyzo2Iv1a9RWG6XX2AjiI7HAUi37MA=
From: Christian Lindig <christian.lindig@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, David
 Scott <dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>
Subject: Re: [PATCH v2 4/5] tools/ocaml/libs/xc: OCaml 5.0 compatibility
Thread-Topic: [PATCH v2 4/5] tools/ocaml/libs/xc: OCaml 5.0 compatibility
Thread-Index: AQHY0mKHZPP9Gr0D7k+Nf4GjgykKFK3zc0sAgASidwA=
Date: Fri, 30 Sep 2022 14:59:41 +0000
Message-ID: <18C55ABC-CE37-4740-A516-86D4FCE83EC6@citrix.com>
References: <cover.1664276827.git.edvin.torok@citrix.com>
 <7b88cbda20e068bbce1c5dfb0a18af3f4e4b6865.1664276827.git.edvin.torok@citrix.com>
 <D5BC6A1E-05C8-4044-ADA6-EFA8944CAAD4@citrix.com>
In-Reply-To: <D5BC6A1E-05C8-4044-ADA6-EFA8944CAAD4@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB4172:EE_|DS7PR03MB5639:EE_
x-ms-office365-filtering-correlation-id: bcfd6267-74db-48b1-2884-08daa2f4672f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 8NKUDInmOY/FXmnnJUvN+N0C1mYpyOO7HxQ7zAIY5jNduhdBEJE0BfQO+6AHjya11eyD7YErCmo3WtiJW9KVS6ZCUu4ZoI+hx7ovEKjEPCAAlCl5zxAIfZ8GACgn3RQhY886S9yjtC37M4rG3l7X9oD36XU1HCU8zgq6BR+d/XgLFTSj+7QjUNvvygp+SbeDEmKu7M8JbgKgXh4dici1W3LA9Jar3mbv/RcJfvjZYdUNqc2kmPcp2KY4jByaIlSEW04PgETh1IKD3HPJve3K5GX9owKcmliOfbMdzk88YHvoFh+pEd+jFiWuSTJs8yJbgLtJwmET8DBNIOFtd6UQ0ipOlW+RSQggd2fhCkGgg8EHfZYGa0eXNbaAzBVD7m4xnwiNF4txnUxVZcxfkX9/BVPL6x9KqaiqMf2XmbnmcnBZWWJDHFwyjuoYjwEU41EhZhU5d9ejEc33dnqr2TFeM++1GyKbhZZ3+YCLLPzv78cHop6T+VX86zO6X8fOSYlvdqU6s1wMYJiDlItQz2DhdOUBe97Erz62ZSrF/My0eO9IcqvLtLFGACr9wHmqpppJoIKeFJLn/n3frvwLBEVFdUwxdkiRxiGkHxeTlVyfvX8puDOw904Ngf4hQzjUJaHVFGEMiSMKv9s0HbaX8JFklzo523jlbd/wgeoOyZ+uzTB10g8+zzm35rZqR5G7VY57+9DEfDgz0AhNcSW4R0V3RYdvAutHWhJY8pLjjZwLOM5ft+BWA1A0KcVBsp3RSZF4pBh8cNgEbkVbYhAAgnlGkkduSxQug+q+26SiOczPwsWA2R/cS4NlFeS6x2G0qSrLIkX1cpQi6QSzYVG3WWysuw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4172.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(451199015)(82960400001)(6636002)(122000001)(2906002)(76116006)(6486002)(91956017)(66446008)(64756008)(66476007)(66556008)(66946007)(4326008)(6862004)(8936002)(33656002)(478600001)(6506007)(107886003)(53546011)(41300700001)(37006003)(316002)(44832011)(36756003)(54906003)(6512007)(8676002)(966005)(86362001)(26005)(5660300002)(186003)(71200400001)(38100700002)(38070700005)(2616005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YXN0K1lMekJNa2lQR3hoUGduUkRIVUp5bnUvZ0puYW5kNjVpY3RjY0llSk9Y?=
 =?utf-8?B?ejhWbzUwMEhZZVJBVEh4UjBjZzB1YkZzS2tkNDkra0ZxNUVlKytzYXFMR0kx?=
 =?utf-8?B?cVlLUVduZTcvUUNMckp1S0VDVjdBVndmR0V5YkxTclNkWlczTFhrU1JvVWFF?=
 =?utf-8?B?TnY2MmVveno4d2dEK3Ezc280eWVLVS9nYTcrcU42ZFVpYzNNUHZFLzN4WjVx?=
 =?utf-8?B?YjJuZ1hMWnlvakxOSmtNc3VIS25NVGlobEVPdHI3S1JQd0V0YlpYUlVwcDY1?=
 =?utf-8?B?WEdHQ0JXTitIWllpcFN5Z2pmbm9wR0U0WGQ1ZlB6T3RmbmhTM3BUelFSakJJ?=
 =?utf-8?B?cUFoMWFDTEduYjRzcGUyQWJoT3ZWU2ppN1lzSGVNRW41UzJIV0xhd1NIYVBn?=
 =?utf-8?B?Z3BVbFViMGpFbDNSaVdhQXNvNTdNM2NDLy9zUUhxaUwxbmc1ZDdvbXlERnpm?=
 =?utf-8?B?dHBnVXZvbzVHMUFIS3h2ME1NdnZRckJOeG5TZ2ZGcHVIVGV5ZTRxK0NBdTdQ?=
 =?utf-8?B?anFqSHRlRDdPRWxEa2NFY2JqeWVOWmdYYlN2OVV3eG9TMTdZRmtlbEtsRW4r?=
 =?utf-8?B?SU95dUUrZFhPS3lqMjZNTWJqVGdRZndFYldSVXpvSHJhUTVFMnpGVEY1UzJS?=
 =?utf-8?B?YXVkNG8vZC80Nzk3MWc1ODU5S0JRRWgvOUtBK2lzR2VsaU1tYjd4cVFnTjJZ?=
 =?utf-8?B?ek5xZ3VOb0JFcG5xeHowcmM1TTN0VjJnYWxuZ05QdjVGM2Z6U3N1bEtHdzFC?=
 =?utf-8?B?WUxpZkl6d0hqRWRNTUpjWVRyaGI4a1lZVWVRYTdrRWRHZXhxSU9NR0hTTDF0?=
 =?utf-8?B?enBsNWlMVElJOUFFUHRYd2FUMmNnZVR2cmhFTUtzNDlvQTA2RWx5YlNRdkNv?=
 =?utf-8?B?QXpMYWZTS0ZmbW9YQzRxTmh4ZXV0VFVJbzhwb2RVWHgzVWsweVc5ZEJEb1ox?=
 =?utf-8?B?bVFxQURtN2NaK1ZxclFMaUM2dHF5RG82Y1d3aSs0M1ZVMmZCREtHRmR5MDA4?=
 =?utf-8?B?SVAyNXlpVFRwRVhrTnpUazEyeTdJS1JMNS9qeGk2NUE1NFEzei9UZU5Tc2Ix?=
 =?utf-8?B?VVFTYnFSWTdlMUk4MkFSVVNkMEZLbXhqTlpjMTRudGoxQUdRUEFhQUlPVGdl?=
 =?utf-8?B?bTU5RHA0VldqYXdBaGV2Szc2ZEttL1lQVUlHb2E0WllJNDZhN282ZE9DRlpH?=
 =?utf-8?B?UmJlZnV4cXhPanlkNytOMGdKRm9HZXhDOHh4SmppU2cyZFhuR2FJM0lGNXgy?=
 =?utf-8?B?QnVadTJXc2xkTkNTVTZXdUFORlBGRzNUNFFEcGExSURoVVNXY0VTQ0pMV2pV?=
 =?utf-8?B?TkxxakE3dFFmUGRSSHlPb1kxQkt1U01nV0w0ZkFMTXdJdi8vZ2tBZXhzTEhH?=
 =?utf-8?B?angyN2JBRlYvNnNuZ2JxaWZKeUtKQnFtcERpcmE4M2tEMmVsdUtjSHMvcTBT?=
 =?utf-8?B?dE9kVm8zYlN6YkhNcU5ONU94ckNlWndsRWZtajVZTy9xRjB2b1ZFU1hSK3ps?=
 =?utf-8?B?a2wxZDUzY0NvZTlGQlhaR1Q2MWpPTHVSb0lESDZGTnhvVy95OGFvM05vaFIw?=
 =?utf-8?B?WmtHbUFOaHg4emxaSlo0REtxbmV6S1E4aUtrZENyRnltTWxZRENtcFBiOWFD?=
 =?utf-8?B?OU91ajBYR0hlZW02WVlYNTQzVlNocnpNeDhCVGU1amgrcDBGTmVpRXJwZGVi?=
 =?utf-8?B?clY2WFF1K3ZYaEV2SjhuOFJDYzJGTml4MnhQd0xWVkZtNFl4N0svQ25WOE1s?=
 =?utf-8?B?MmI1MlRpYWc3TnJtZ00yTUNPaHk1N0M3NzlrVHNwVE8xZ2s0U1NLeSt4ZXpG?=
 =?utf-8?B?dWZIYXFBTnAxWnBHWHozK21jMXNtQ2xqTFFPbXljZ3d3aXVvajcwMEg1U2lM?=
 =?utf-8?B?ZDVxTG5neCthNjZxNHJndXpvRko1UWROc1Y4R3RqQktuRGlLMXhjYXoreDds?=
 =?utf-8?B?c3NJN21tOEZtaXlxd2hYTC8rZHVCQ2ZpbnJ1cUdnRUVsMVpjVlg1ZlIzWFc3?=
 =?utf-8?B?L2szWjJRZFYxeHhlTE9LR3dCM0huV0s1YXZpNVE1akxSeC9HblQ0K1dKb0d4?=
 =?utf-8?B?VlZneExZNkdjWDkzWjUxTkRhdlZZUEJxcXRvZnZBWm5TT1kzSVJZNVhsbURr?=
 =?utf-8?B?aTVlWktWZG9JUElVM1BrMWVReUFsOGJSQjNkcmxlaC9GSzhXQWpTb2t3c3lM?=
 =?utf-8?B?VWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <747B60737504434EAB9F81C77CEB1A96@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4172.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcfd6267-74db-48b1-2884-08daa2f4672f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2022 14:59:41.2897
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sMaCusP/W3ujsSw0oSV1g1lpEtcJ2BBUczd9paBLb/IxJQiFJ9A3uwyr2t5UkDqMZMwkMxA2GoXv0DJC0wCeMVJskfygvrPg+HOA8yBedtw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5639

DQoNCj4gT24gMjcgU2VwIDIwMjIsIGF0IDE3OjEzLCBFZHdpbiBUb3JvayA8ZWR2aW4udG9yb2tA
Y2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gU2VlIGJlbG93IGZvciBhIHBhdGNoIGZvciB0
aGF0LiBJJ3ZlIGluY2x1ZGVkIHRoaXMgcGF0Y2ggaW4gdGhlIGNvcnJlY3QgcGxhY2UgKGJlZm9y
ZSB0aGUgcGF0Y2ggdGhhdCBicmVha3MgaXQpIGluIHRoZSBnaXQgcmVwb3NpdG9yeSBhdDogDQo+
IGh0dHBzOi8vZ2l0aHViLmNvbS9lZHdpbnRvcm9rL3hlbi9jb21wYXJlL3ByaXZhdGUvZWR2aW50
L3B1YmxpYzANCj4gDQoNCg0KQWNrZWQtYnk6IENocmlzdGlhbiBMaW5kaWcgPGNocmlzdGlhbi5s
aW5kaWdAY2l0cml4LmNvbT4NCg0KSSBiZWxpZXZlIHRoZXNlIGNoYW5nZXMgYXJlIGZpbmUuIFdl
IGFyZSBub3cgYWxsb2NhdGluZyB0aGUgZXZlbnQgY2hhbm5lbCBkeW5hbWljYWxseSBhbmQgdGhp
cyByZXF1aXJlcyB1c2luZyBhIGZpbmFsaXNlciB0byBmcmVlIHRoYXQgbWVtb3J5LiANCg0KDQo+
IC1pZm5lcSAoJChNQUtFQ01ER09BTFMpLGNsZWFuKQ0KPiAraWZlcSAoLCQoZmluZHN0cmluZyBj
bGVhbiwkKE1BS0VDTURHT0FMUykpKQ0KPiAub2NhbWxkZXAubWFrZTogJChBTExfT0NBTUxfT0JK
X1NPVVJDRVMpIE1ha2VmaWxlICQoT0NBTUxfVE9QTEVWRUwpL01ha2VmaWxlLnJ1bGVzDQo+IAkk
KGNhbGwgcXVpZXQtY29tbWFuZCwgJChPQ0FNTERFUCkgJChBTExfT0NBTUxfT0JKX1NPVVJDRVMp
ICoubWxpICRvLE1MREVQLCkNCj4gZW5kaWYNCg0KSXMgdGhpcyB0aGUgcmlnaHQgbG9naWM/IE1v
dmluZyBmcm9tIGlmbmVxIHRvIGlmZXEgaGVyZS4NCg0KSSBhbSBub3Qgc28gZmFtaWxpYXIgd2l0
aCB0aGUgTWFrZmlsZSBydWxlcy4gVGhlIGdpc3Qgc2VlbXMgdG8gYmU6IHdlIGRlcGVuZCBvbiBh
dXRvLWdlbmVyYXRlZCBNYWtlIGRlcGVuZGVuY2llcyB0aGF0IHRoZSBNYWtlZmlsZSBpbiBnZW5l
cmFsIGRlcGVuZHMgb24uIEJ1dCBpbiBhIOKAnG1ha2UgY2xlYW7igJ0gKG9yIG90aGVyIOKAnCpj
bGVhbuKAnSBpdCBpcyB3YXN0ZWZ1bCB0byBnZW5lcmF0ZSB0aGVzZSBvbmx5IHRvIGxhdGVyIHJl
bW92ZSB0aGVtLiBIb3dldmVyLCB0aGVzZSBraW5kIG9mIHN1YnRsZXRpZXMgYXJlIG9idmlvdXMg
ZW5vdWdoIHdoaWxlIHdlIGFyZSB3b3JraW5nIG9uIHRoaXMgYnV0IG92ZXIgdGltZSBhY2N1bXVs
YXRlIHRvIE1ha2VmaWxlcyB0aGF0IGFyZSBoYXJkIHRvIGNoYW5nZS4gU28gSSB3b25kZXIgaWYg
dGhpcyBraW5kIG9mIG9wdGltaXNhdGlvbiwgd2hpbGUgY29ycmVjdCwgaXMgd29ydGggaXQsIGJ1
dCBmaW5lIGdvaW5nIGFsb25nIHdpdGggaXQuDQoNCuKAlCBD

