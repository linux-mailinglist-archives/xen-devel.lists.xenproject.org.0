Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7D465C8DE
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jan 2023 22:24:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470755.730364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCokO-0007Xc-Tr; Tue, 03 Jan 2023 21:23:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470755.730364; Tue, 03 Jan 2023 21:23:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCokO-0007VS-R1; Tue, 03 Jan 2023 21:23:00 +0000
Received: by outflank-mailman (input) for mailman id 470755;
 Tue, 03 Jan 2023 21:22:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oadl=5A=citrix.com=prvs=36087fe06=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pCokN-0007VM-5U
 for xen-devel@lists.xenproject.org; Tue, 03 Jan 2023 21:22:59 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9515cb1-8bac-11ed-b8d0-410ff93cb8f0;
 Tue, 03 Jan 2023 22:22:56 +0100 (CET)
Received: from mail-sn1nam02lp2043.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Jan 2023 16:22:39 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5554.namprd03.prod.outlook.com (2603:10b6:208:290::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 21:22:34 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 21:22:34 +0000
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
X-Inumbo-ID: c9515cb1-8bac-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672780976;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=gCKpOgleSfHJ92c+Y9v38Ry7yOOQgS66T1rdtC84y1E=;
  b=XV+AuZl6u0KAwZchSgrJJ1ou7YJuoso4YULHPSHHpHJ4fafF2vxowT0j
   yv08cEvkt+mt9RJ21c27LzQmeVz2RrW3N/P+vLx75k7GF2kOJWzE2u6yi
   Qd7CrBr/aykNqZsdkeaAvE+jA05C5NBtV5KZ4EPwR1phs8EVsGb0N74VM
   Q=;
X-IronPort-RemoteIP: 104.47.57.43
X-IronPort-MID: 90524720
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:gg7TuKodUJq75S7f+drAhPfYJOleBmLSZBIvgKrLsJaIsI4StFCzt
 garIBnSa/3cYDehe9pxa4Ww9x4BuJOAm9VgSQdt/i1jHi0b85uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5weHzyJNUfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABYicw2KhOnn/ICEWvNrp+kENPjTBpxK7xmMzRmBZRonabbqZv2QoOR+hXI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeerbIG9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOzgq6Q23wfLroAVIB9JSGO4g8SptlGFXtZ9I
 Fw6wwEQ94FnoSRHSfG4BXVUukWsvAMYWtdWO/037keK0KW8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq11J2ZsDezMig9NnIZaGkPSg5ty8L4vIg5gxbLT9BiOK24lNv4HXf32
 T/ihDc6r6Uei4gMzarTwLzcqzelp5yMVQhs4AzSBjih9lkhONXjYJG041/G6/oGNJyeUlSKo
 HkDnY6Z8fwKCpaO0ieKRY3hAY2U2hpMCxWE6XYHInXr327wk5J/Vei8OA1DGXo=
IronPort-HdrOrdr: A9a23:3BDY4qC62fm0N8vlHemT55DYdb4zR+YMi2TDGXoBMCC9E/bo7/
 xG+c5w6faaskd1ZJhNo6HjBEDEewK+yXcX2+gs1NWZLW3bUQKTRekI0WKh+V3d8kbFh4lgPM
 lbAs5D4R7LYWSST/yW3OB1KbkdKRC8npyVuQ==
X-IronPort-AV: E=Sophos;i="5.96,297,1665460800"; 
   d="scan'208";a="90524720"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uu3S+0Pt8nu/TYtlbsPc5gfNPoQnYZJoD5rhtJxZarKOYtwHpNAxLk/KHng00ZwQBDRrBOqdfEP4iiJQEaC5D1dFxSAYHIHHHdvkZIH+bRFFtr+fawAxdKODVG1lFiJ0lmkRwtPhMiXpSZaMEHN75wuQdDWT5BY0MJvR81AQb8q9j8wLwiOFuytpzVJNT4UO+D/B9UjPRSC/69HVTJ/gP66/qc7Q4UYat8oSPnKURr796/lZOs3gptkNl4JGMO5oK9n8dOLmtJ0Y/ssG302wj+HPQXnHtYz8zh4wXH3PAjJiN/pQXt1jmQR/9sMOUZpl486YwHPvZ/lKFkG36qsYPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCKpOgleSfHJ92c+Y9v38Ry7yOOQgS66T1rdtC84y1E=;
 b=dqTvYpEya0vaCpfIInDkOKoDSM9nyu70QTe+ZnT2NmqLgZZ7YJJaO8iYu4uXzVqFspduKQ5J8DHdrQu4+dJP8+szf1DW2K0DWxNAZzJU3Z8LWDVQooXK0K87i7TZJDenNHPAb2xiPRf/wRSTmlcWksA5UH8yxOwznSlXHrOWhB9QUsjnemg//LQ41nyxFMREc/egdUivrkcRKDxUEhjauTojbJ4gY4RN6ljxi389AyjpMI5CUOc25MoAiVU82QmEzhRsmFthjNr7EAZsCLHXKyUrtoh1ZAIZDY4vOwUmgG8DkSkZBv6F2wLZAsBlDhWsB+tRhOVBiRIK7eJ6VE+k5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCKpOgleSfHJ92c+Y9v38Ry7yOOQgS66T1rdtC84y1E=;
 b=pCVfVTaI20YXPELy/b+hMIYOXSd6aPPwp8BKmlp785tdJdxLxl5T+lagyUi7PSsZA8GJqrU0qlBt2a/LX4j6mQNgGmMgVn7tzRhUTPeiSS+Qhs90xLlOe8Sdc/XRnouneDq+z2eGeJmA8Yooep1OB3pZZORaFfb2MUD8TNLtu0w=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 4/4] xen/version: Introduce non-truncating XENVER_* subops
Thread-Topic: [PATCH 4/4] xen/version: Introduce non-truncating XENVER_*
 subops
Thread-Index: AQHZH69eYU4qCMuPJUaHOPPUV+yM+a6NKeKAgAAJu4A=
Date: Tue, 3 Jan 2023 21:22:34 +0000
Message-ID: <88f0365f-2ab7-ed8d-fc99-0b1f2a4837aa@citrix.com>
References: <20230103200943.5801-1-andrew.cooper3@citrix.com>
 <20230103200943.5801-5-andrew.cooper3@citrix.com>
 <a1300a9e-26a2-4307-d1c3-102729f16a09@xen.org>
In-Reply-To: <a1300a9e-26a2-4307-d1c3-102729f16a09@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BLAPR03MB5554:EE_
x-ms-office365-filtering-correlation-id: a167821b-bc1e-4bdf-230f-08daedd0a176
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 DavcmWwVXoelIIHWQEhdbh9DGYJn9QiOOGyUAEmUPPZYRV2quXpygC2vVRTcU1XS+Wf87xA1QhPOC5CsFaFHV6ijVfA2BmkkP40uV0JyCN/zJzLCwxgqZR0pT0qqL4U0zYWDgQSoKII6khy9NdheleaOxPxhdRyQblN+h6DC2lN4JFe02V4CjdRDB1TVG87KWiuOEvPP/rSoMV9gWnmWSzPqay0cwHIpWH2JPjiaGk/+uDOveN69b2oSSgupqAyjkrf25O6b08NEq+Owz3ZZi1EGR6VEYPQMooAB4OmJqkGRTWCy8PbhpwErBefiFp/YDHPVNaaJFByOl3W/VfjsNic4TfmrVA/0aRUgOGCNpgQ4HEc4CT3gke4WVZNe+rnRFxw7VlGSKv6OzKf5TCUbF+my+egeod78R/rMi4w0YQenKstucma2vF0xrsT/Fl22/g9JW1Oc44/hA7/1bTZ/MqW4ldvoShlCh1t470SNo6xse1Jy4hLdkHfZ+NX+rYAASgCVkdCXk81/E9DXLF3kLw02rijXzipwRrjg9EWTchrxIDO4+WaL8adbz0YJcdxSHpkzupsAkYTM2YVl48bhSWTjKgidqPANCBWV6+gzUadyyBxsMuZQTSfyQHO8P/CMzHvd9atvdXZAV1dtkEHNCUDFdDZqdBCK6KWlSvww1USF+N7Dht4knuYKoACIYAS+RZRtO2Wm88ozMo9xZ3S1lEQbSz67xzmaUqIBzpVwCklHid6j9+XdBtBsv8tOt4TO0CCM0ryFg7V1kZqycib7yj/iKBzd0eHJUxDrWYkI/gk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(396003)(136003)(346002)(39860400002)(451199015)(4744005)(2906002)(5660300002)(8936002)(8676002)(4326008)(41300700001)(66476007)(54906003)(66946007)(110136005)(64756008)(66446008)(91956017)(76116006)(71200400001)(316002)(6486002)(478600001)(31686004)(66556008)(53546011)(6512007)(186003)(26005)(6506007)(2616005)(122000001)(38100700002)(82960400001)(31696002)(38070700005)(86362001)(36756003)(22166008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eHBEeTJiMTlYNlo4emZWQTBrbk0zeDI5d2lkQnJ2RkFMOXhMZ2N5cHp1c0dw?=
 =?utf-8?B?N3RlT1BNOEh1SFdsQ1hpRVpTczVranhCWFQyYklVUm5oV3VCVzFTaHg0Mk5n?=
 =?utf-8?B?SGlqajBhQktBbEV3bjc4SUhqUDhCVWJGZDJSREZLeXVsSWtqMVRFblZSRk5h?=
 =?utf-8?B?dkc5Vk10RndNcTd5TEpjUWxKdUlTQ1FMWW8xR21jMktwUEpVcHZqWHNtSE5P?=
 =?utf-8?B?RGw1bkZIMncrOWlCdFpud2dYTnlzM2s0aFBaNVJNR01WdHBlOEtKbjEwVlN2?=
 =?utf-8?B?eVpkeUh1Mi9XNFkxZ0FaSW9kRzVlSWR3MzVFdVRNckRDSTF6NUFsS0FqeWZk?=
 =?utf-8?B?NkxmQ3RaNG5LVFdGeHplRjhXeXBsS0tJMkZoL0NQTlZsRE9kUWdjSUtVMWJz?=
 =?utf-8?B?eEJOUXczbncxejFlUW9tUWsxYjc5U2QvcWN3cEFEeW5pRHUwRW10Tmx5WUla?=
 =?utf-8?B?UGR4dE5CN3ZLbDg2V05OeENGeUE1b2JqN1I5ckRmVExnMEQvSnpnZ0FGbjVn?=
 =?utf-8?B?dk8wU28zQjZsUE13ODVyOEFWZENIMkNxWWVQOFNWU3Mzb2pzWTU1Vk0wV0Fw?=
 =?utf-8?B?SEYrd1E5NFhVdURBVjZVbjduazBKNzdtT2tpdjZldGdZMTVQUmVhUzhUNERL?=
 =?utf-8?B?SFF5bWhmdU9vV2VSUjhzZXJmL3JCTStOR0RjLzRRYlUvVlBWWnFWcThMS2JZ?=
 =?utf-8?B?V2dnWDhwVy9UaG1xem1ERG4velRHYnNJd1pSQWRubG1XMG8rUWx1a1FiRVF3?=
 =?utf-8?B?aGJDbVl0ZEVVcEpmOUoreEkxMThsUHhXL3dtdmd1QzZVajd4M080VkZ5RDF3?=
 =?utf-8?B?U0FpWnNrQnpHOXpGT3dJZUZ1YWplakhpWHhDZ3VCanFra0dGVXlreVRJcGxW?=
 =?utf-8?B?WWJwdkJZK0xwQzBRL0xWVTFUc1dzWndIeEFCVjdMNGxKa0hpbzFRNy8zbi9N?=
 =?utf-8?B?WUJBN240QVBXSnRKc2duV1FFMlgzNWdmSVpSeXJnVndyZFlEcWlCZ1BhNWVy?=
 =?utf-8?B?YWJYNGlJMkxpUFJxQ012ZjZXQk5KL3dBeTBhSUtFcHRHM0kxOW83VzJvaVFN?=
 =?utf-8?B?Y1lWYjJaKzl0SXMzaUdic1JEM24yWnllbTJvTEpLV0hBT3BIRENkcUxaeXdE?=
 =?utf-8?B?TU16aGNhbGIxTGp4VjhYeHBQVGN2eU1NaEQ0VHkreS8xd3ZJOEszNitIbkVz?=
 =?utf-8?B?ZG96SkRiWHVXKzc3TFBVc3YvL0gvakdoVVpiV3RSbWkzOCs3eXhsbW9JZUpI?=
 =?utf-8?B?VGtJZFIzSDhJZ3JXUS9OSkhxdFo5Z3R4T29sczdOU3dWUUVGVjF2UVh2dkJa?=
 =?utf-8?B?bW4zN2t6alBxVFZiUEg2U0dpTGlDSWNNTTRLNXl2cDFCWitTYzh1QjA0STJY?=
 =?utf-8?B?Rzhqam9DSkFYUm9WZUU2NnRlL2d3RWdLQjk5SGhKandkRTZVR3QzdXJEQ0E0?=
 =?utf-8?B?clJaOUdmQ1RKNnVaZmY5RHYzRFh5NFU1dU83bTV6UGVGcFREN2MzUzBiU1Fi?=
 =?utf-8?B?emxhVU93YVl4MzJOZndxV2pocDJyV0VZTjl1WXJ3ZGExOXgrMnJZRmZmSFV1?=
 =?utf-8?B?WTdodzlleFFQMU1HZTlRcFdwSWkrZHBoQXBTMktSZVc5Q0RBSUxKeURFUnU3?=
 =?utf-8?B?MWZ0Z1JDem0vTlVrUEZicEJsZ0EvYW9PeEN0Q3lzSVlCVGdHelVnTzJ5Z250?=
 =?utf-8?B?czNNd1gzU2d0c253MEZ5L3lTRFRyTVoyUkZ3cno4L0tzUHdOWElyZTRCRWxa?=
 =?utf-8?B?ck5oNk0yMThOR1k0Y0NrV09BTmRjL3JYa0FXZG8wZHdlQjdybXBXUnVweEdu?=
 =?utf-8?B?Y3EvWlI2aGZLWWtRNGxEOWtsZEN2ZDM4NEtJUVYwNHNzNEhyL1FUR2pJWnBR?=
 =?utf-8?B?QzAzTXNqeEhKbjNjQjlhZHJHcThBbGxyRTZnZTJKdmFza01Qb1BwSWhyczd4?=
 =?utf-8?B?Q3NqUCtlM3hiTWlqQ0JGUi95YnpmU1FTdEV4clZiN0Ftb2I2cDlIRUh6UUpJ?=
 =?utf-8?B?UzRFMlF0R2QwaEJHRnMrdElnVWpodUs3UnpPVUUrQWNJZnVWU0QrcnBvSko3?=
 =?utf-8?B?dHpVdUZLNDVvSWdmeGZ5Qnh1WFJzdVJUeVN2M1RLVHgzZnFxQVNFUkpLV0FF?=
 =?utf-8?Q?vPYNa48CkpGahZPybKWBaTtZX?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <29864C5C5355714C9F9A915CB1444921@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	87lgWfx8BNUBFqWfupj5fg38AOZ/IlRXxDWfKyffbGyDwOzNAwasQFxGT1Zc3Exy4NLJkX9GkXfN0YZkfs5d/CSAOhk6Fp5NaYOsycW0IN04GWuYHCNvpwtgxRTl1EwotlZy/8TDAyx3PWAgdbJHWOUqvtOjQb2bIXUxBZFV4RSJJ4TOMJfJoqQORCBHHQ04jjDNeP4bzXVxnN+EZXzUGDMmz+krPvE0xDRr6YbakOsG8D1e2CRRMGB+Bqu+HzSpPoHNixu0D7lsYm6YFYMqbqW2mpQGocvvMK4+4KgRictXamE8/4M91nzhsmBp6ysR4/55mTtxM4sR1kvbuyBoVgAQE51/SYplkY/9rNgkgrN8ZaijZvf0xcavhSIqMGuxMU5qL83MoSaLF2jemBIoghwcCbvxwyV3VCR4HdESv4Cj6aZkttCoWpc8ca1IDFGHkFpdxKvp3vJNDyCrz2e6f31igk1/QpFSFH6Zx9FEd5ih06udhIe8dbZXb2MFglXUTdDsb2jWGilRYZj5nbkmz/sS5ekqTTKjlNQXA+uVqHj6w5t9mFl59T8mGN6NtTao5V7FXanJcb0h80sbAia1pqYpIqRuG8BrCd6XHSXfsgm/I+YRhF77wIwTgdzkUBD0twPTH7t6hhO4aG7ShZ2tzvmdYoqPh4Bo23C44bMzfakJyoYNcLM2gBM3+bzFWcrgDw3ahG6JVPs3fzWa9LAMb13i0SAcMZZn9hSiQ0y9wM+QxWXizbbaD+PAcoCbQUSF/9E6juYNCuCVJMPQ4Vxy0de+Qyu91mfv9887wV/encUe1xO/j1VNfTED8zh2k2+MayLEOI8Xs/uye/r2jc4vj9DP/8WTVTeLXZa3LapuN57K1+ljg89IP05PkUAU1FCK
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a167821b-bc1e-4bdf-230f-08daedd0a176
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2023 21:22:34.3888
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 42yc3fjxyxDVO6uAxX4zDv0y9Vh+mIlghFAJ03MLw/RVAa/Ca/KvesVSPciC+H8iTcZE7LV5WSW0djWnIZjTnBZD+PXFeN9XgjIZprskuJc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5554

T24gMDMvMDEvMjAyMyA4OjQ3IHBtLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+IEhpIEFuZHJldywN
Cj4NCj4gT24gMDMvMDEvMjAyMyAyMDowOSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IGRpZmYg
LS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvdmVyc2lvbi5oIGIveGVuL2luY2x1ZGUvcHVibGlj
L3ZlcnNpb24uaA0KPj4gaW5kZXggYzgzMjUyMTlmNjQ4Li5jZjJkMmVmMzhiNTQgMTAwNjQ0DQo+
PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvdmVyc2lvbi5oDQo+PiArKysgYi94ZW4vaW5jbHVk
ZS9wdWJsaWMvdmVyc2lvbi5oDQo+PiBAQCAtMTksMTIgKzE5LDIwIEBADQo+PiDCoCAvKiBhcmcg
PT0gTlVMTDsgcmV0dXJucyBtYWpvcjptaW5vciAoMTY6MTYpLiAqLw0KPj4gwqAgI2RlZmluZSBY
RU5WRVJfdmVyc2lvbsKgwqDCoMKgwqAgMA0KPj4gwqAgLS8qIGFyZyA9PSB4ZW5fZXh0cmF2ZXJz
aW9uX3QuICovDQo+PiArLyoNCj4+ICsgKiBhcmcgPT0geGVuX2V4dHJhdmVyc2lvbl90Lg0KPj4g
KyAqDQo+PiArICogVGhpcyBBUEkvQUJJIGlzIGJyb2tlbi7CoCBVc2UgWEVOVkVSX2V4dHJhdmVy
c2lvbjIgaW5zdGVhZC4NCj4NCj4gSSByZWFkIHRoaXMgYXMgbmV3ZXIgdG9vbHMgc2hvdWxkIG5l
dmVyIHRyeSB0byBjYWxsDQo+IFhFTlZFUl9leHRyYXZlcnNpb24uIEJ1dCBJIGRvbid0IHRoaW5r
IHRoaXMgaXMgd2hhdCB5b3UgaW50ZW5kIHRvIHNheSwNCj4gY29ycmVjdD8gSWYgc28sIEkgd291
bGQgc2F5IHRoYXQgYW4gT1Mgc2hvdWxkIGZpcnN0IHRyeQ0KPiBYRU5WRVJfZXh0cmF2ZXJzaW9u
MiBhbmQgdGhlbiBmYWxsYmFjayB0byBYRU5WRVJfZXh0cmF2ZXJzaW9uIGlmIGl0DQo+IHJldHVy
bnMgLUVOT1NZUy4NCj4NCj4gU2FtZSBnb2VzIGZvciB0aGUgbmV3IGh5cGVyY2FsbHMuDQoNClJp
Z2h0LCBidXQgdGhhdCdzIHN1ZmZpY2llbnRseSBiYXNpYyB0aGF0IGl0IGdvZXMgd2l0aG91dCBz
YXlpbmcuDQoNClRoaXMgaXMgbm90IGEgIm15IGZpcnN0IGludHJvZHVjdGlvbiB0byB3cml0aW5n
IGNvZGUiIHR1dG9yaWFsLg0KDQp+QW5kcmV3DQo=

