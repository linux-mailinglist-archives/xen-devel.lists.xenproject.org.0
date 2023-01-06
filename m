Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACB565F961
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 03:03:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472276.732446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDc4i-0005OQ-Ub; Fri, 06 Jan 2023 02:03:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472276.732446; Fri, 06 Jan 2023 02:03:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDc4i-0005LU-RN; Fri, 06 Jan 2023 02:03:16 +0000
Received: by outflank-mailman (input) for mailman id 472276;
 Fri, 06 Jan 2023 02:03:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sfve=5D=citrix.com=prvs=363380921=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pDc4g-0005LO-Tu
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 02:03:15 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44e3f0eb-8d66-11ed-b8d0-410ff93cb8f0;
 Fri, 06 Jan 2023 03:03:11 +0100 (CET)
Received: from mail-dm6nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 21:03:09 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5162.namprd03.prod.outlook.com (2603:10b6:5:24a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 02:03:07 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 02:03:07 +0000
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
X-Inumbo-ID: 44e3f0eb-8d66-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672970591;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ViXsOb5Flt6Rc1xOWmrEZV/r88DR+Cz+8dlxDG5k1LQ=;
  b=A60tlV3taHW7xyih+zLoV5d62aIywIiUH8fgtmLKnc1ChzRzjpMaW1vH
   FrYQUxz0Ac5KOtl06d5/CDRihUuS5dKMhGgjAvo8L2qezRp+TdDrS5LRp
   loMHRT4eeWA9mtXh3IPiIzvtjO2aL8hzLUq1iPwWBaddegu/z6i6i8rK3
   k=;
X-IronPort-RemoteIP: 104.47.58.102
X-IronPort-MID: 91823714
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/bRAp6qqAkcLlqOrsYvR30hrLBheBmIpZBIvgKrLsJaIsI4StFCzt
 garIBnTa/nba2f0e9h3b9vi8k4Dv5HQyYVjTgo++yw2FihH85uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5weHzyRNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAC4UaRuljOOT+aKAafVGlOIDKtjlF5xK7xmMzRmBZRonabbqZvySoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeiraYKPEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXpr64w2wLKmgT/DjURaWCln9eh1neccMl+M
 FQ4+wc1qbIboRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8hSy2ETgYKykFfyBsZRcE5vHzrYd1iQjAJuuPC4awh9zxXD31n
 TaDqXFmg61J1JZRkaKm4VrAnjSg4IDTSRI47RnWWWTj6R5lYImiZMqj7l2zAet8Ebt1h2Kp5
 BAs8/VyJshXZX1RvERhmNkwIYw=
IronPort-HdrOrdr: A9a23:8CjS0apxrdXtxfT3aHuefk8aV5oaeYIsimQD101hICG9E/bo9f
 xG+c5xvyMc5wx9ZJheo6HlBEDtex/hHOdOkO4s1NSZLWrbUQmTTb2KhLGKqwEIfReQygc378
 ddmsZFZuEZ8jBB/KPHCQODYrAdKHDuytHQuQ7W9QYUcT1X
X-IronPort-AV: E=Sophos;i="5.96,303,1665460800"; 
   d="scan'208";a="91823714"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jA73pZut7Y+iTb1LnGgibzfH8YEh+g9uaFPV4cpbbfSkhbTKlEqifJfPt7OQm9WkPXkz1tByncsU3BvlDK7WtnWTepxOw4y2sfbyWwrqDQxBAaNOxmLg8nbejVxqTSCajjdQliRt+4hThLNkMqwnxpDddIHzLr4Sbn9glwhk+oOyC4kMrl/yyLABmSw+Bf48cRqFSLOdwZ+sPuJencjYoCzDRkOhtPN8XzDesKYMcwBv+saeHKE3wuSNqiYZPvphcJdHwu/9hKhXSYg0h5RfVCpAWf8sDTSLfXyHilTAXxzI2GuVRmfPvP8s2mjSVe7NjvLVW3YhAbz88JhuEcW0Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ViXsOb5Flt6Rc1xOWmrEZV/r88DR+Cz+8dlxDG5k1LQ=;
 b=OAhUO2Nnxts/0Jpnsm3DxWLAdIvnHRHlmoun9CjuLTXoWXxPHE4axLyshJDTwS3L7CsZ64zrhKbQGSOc9gac4qm+ZCQec8hMbEGADscQMSNi3Phv5Zla5YuKUW3dW4zKKEjnrbfpcywNtY5vEpN/UwKbjPX/DQMIDowLoM24K9JPEQF1sdp5ddLmWOmYvpaez4WKeO6xJbFUrOn3AwJJDXQYi2As+X5cAgSLVxDIJQ+78+LutqFekRRsDinxWP2QRw3j1sUX5/GvyLYdksOA/dzteEG4+rds5X7p9qoALSRTuzXfTTGUi/Ap3rlMTeJ2b3bDqKJcd7pdoojA4PYuUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ViXsOb5Flt6Rc1xOWmrEZV/r88DR+Cz+8dlxDG5k1LQ=;
 b=PbJZySaOSUgqzAR2Gq88Twgeqm+Wm6v7Ct+tvkYb6/tJb/aMaxolgW5humWZj9ny90ksphf7RXpSiPSzvNgP7adSk0JocOmJgI95QjBRKihdxxnKgVV1OppD2SGpCcSGEiYIAH6ahPMKxNBE94k8ZGMLRcol/nmVeHsqytngaLg=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, "Tim
 (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH 08/11] x86/shadow: reduce effort of hash calculation
Thread-Topic: [PATCH 08/11] x86/shadow: reduce effort of hash calculation
Thread-Index: AQHZIR+fQDluUga6GUWdpW8jT2W5ga6Qo8kA
Date: Fri, 6 Jan 2023 02:03:07 +0000
Message-ID: <20c268c0-979b-5ac9-da16-7cb7322552a6@citrix.com>
References: <074dc3bb-6057-4f61-d516-d0fe3551165c@suse.com>
 <acf0f5f6-f4da-cd88-1515-2546153322b4@suse.com>
In-Reply-To: <acf0f5f6-f4da-cd88-1515-2546153322b4@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DM6PR03MB5162:EE_
x-ms-office365-filtering-correlation-id: 986fcdd0-93fe-441b-2a55-08daef8a275d
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 UO60F1oygaASK8cIWlOWwo2CZUW1CIWOFJHLq65K7AMuKEwnpsQEaT+BSgFAKXWMB7dOVE6FtEqxoCzBCGa1xCiqSZGmzU1MouOi2w8EvFkJtBM9sguQhXDzLRtlp1xbn7brNLgceGQJfFlTISlZ2tw21ToTwoaea0haD/dUnuX9O+C9Lq/1MR3UYzrNY5e9iKcDVUQGj8TXtExsEfFG075rMu9z0nfOMpGzKfiUNlxdgibgK4Yr2j448in5TwFD/cBp/UguiJUPNyaSu+ery6nMIsrEgGfa6rq6BcDn5r0UxBSF9Yss3425fMlei8k+seDYCWZtAd4WlOhy4SWpp2fhkNlDKIf79PX/cMIYKtd3BpIYCSFX0W3uzGxg0nVqWr1bXBiz2Bh1dqK29gG2TRLisBzau9oVkfgFhdCuSmjQW1T5FQAPO0eMHZrq8Ha6MQzfBDWkxcqCrcoqYVX36e7b0ZXEUndNsvCL25rn0wT0U4xeNoqBENXIW90iDBOkbM9h61houq9OiXAlUu7ugo4CNnVW1qsYfucFTFtB3B+WxTsRc0VfMoq4O1RsYyBbv1sY/Pa0tWZnqn36bQ2Shaidrfovl+esNUVZ4JbgluizbxQ5WxEyH8sNDA1kGixYyNE/WcIYu/ouweILwT82eBnhNqBEH0sl7/taSSdYezvXB8GQTRx7MPikEqDvwVmpMoCQkVFORwUOPN7JYziw2YGwzRviOacGrIrOn2g45JmBL+bE8ZnkUyAa4zE5alBRIII1OtWKlVNmkO1eQv4Opg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199015)(5660300002)(4326008)(8936002)(31686004)(8676002)(2906002)(41300700001)(71200400001)(66476007)(64756008)(66446008)(91956017)(66946007)(66556008)(316002)(54906003)(110136005)(76116006)(6486002)(478600001)(6512007)(6506007)(2616005)(186003)(83380400001)(107886003)(26005)(53546011)(122000001)(82960400001)(38100700002)(31696002)(86362001)(36756003)(38070700005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d3pGZnI3NjJ6SGxqenpwQk1pcXVEbnBGQlA1aGVzL1RTTnNNcGF3bDkvazAr?=
 =?utf-8?B?Z2t5ZWk5RkVGOEduOXc2clhTK2x0cWtwakt5QkY3YklyQXNzamRaSVhQaWxK?=
 =?utf-8?B?eGZBbTE2NnV4NHN5RVhwM2trVDFEcUdoUnJTQ2JjMnEvWkVvb1k4bmUvN1Ji?=
 =?utf-8?B?YXlNb0NvMkVBcHFBY21KSjRRTFB1TjhxT1lyLzRJek85dkZmZHpyMzZ1MWxr?=
 =?utf-8?B?bzhDSVBxQnJFUUlzckxtTGNoeUcyS3NuVzlkOTNOS0ZBSzk3TnorY3pSWGtu?=
 =?utf-8?B?V1FtRUlOUWtpTnE4ZEVnOGZYanBmRnFnVng3b3BCeGwxK0RjcVI5WU5jemFY?=
 =?utf-8?B?dmdHTVhzMEsrSUdwc2liSW1NMDdjZkFwdWdVTzFLZGdxRkdGWGR3Y1lYWHVs?=
 =?utf-8?B?K2RHTWxUdDRqQkVKNS9tN0pPMlVzeFVnUzMvSjdnRG93UEdjQW9hVmdQdWEy?=
 =?utf-8?B?a3lNQ2tYTC9UbFZ3VGFwRTAwaTN0dHJJS3gvYUl4cHZ1SEpZNHBqbVBIOHI0?=
 =?utf-8?B?cmJkUFJvQzk2MzErWDQzMnpPMFpraHBYM1dZOEdlNUl3dXRhQVdJWWVUYW03?=
 =?utf-8?B?cHdhSTloOHVucU5JN1RxNnJ6TEw1RHJMSnlpYTlEY2xIRktjNWZYRW8yc2Fw?=
 =?utf-8?B?bzEvZ1RRd3huQkUwVGFPemgwazgwYmZXNFJiWmhhcUw4Z2JFTXk0REpRdlVE?=
 =?utf-8?B?YVl6YUZrNTlXYStEbVQ5UHZsTmVTb0ZtVDU2NWRpb2t1M0JFQ0xSU3dnN0lJ?=
 =?utf-8?B?citGbEloOXBUK2R3dHZLeTRaKzVWeFNwMEVveFVpSm52Y1FYdVJWdlgvNGd2?=
 =?utf-8?B?RE5IUEd0RDFTVGtza1o4UGlwZmxPTlJmZy9yY2N6L2dNa08vdHJybEFlMlFt?=
 =?utf-8?B?Qm93ckhGZnFBbGZVbWg3bDRJekw5ZmNOanVWSFlsVk9oTzVuQUtrcTlKS0V3?=
 =?utf-8?B?aEhJdlFVbjBLZ3ZkdmsxN0o3Z1F0Ly9jcHpOT2h0S3ZwNDhlOFloZXJ4ZFh4?=
 =?utf-8?B?Nk1vRjFqdnBXOG52enJYVWlwSGJQZ1I5cXJJTzhPb2svYlhkOGFldWcyNjVP?=
 =?utf-8?B?RzBxdjFHdHhpR0pudEYzZEFLWTE3eUo0S3lJSXo0VUZQMmRxVjJtTHR5SjNQ?=
 =?utf-8?B?NzZYZmpHbXpqWkZ4bDV4dm54enJuQk1SRjBIYnNzWkdXNUJlNVp1bnFOdmRV?=
 =?utf-8?B?OThBU0xzRktMeUhPVVQrWmI0ZkJtMitTdW1SaGplMlBmUU14Y1JvUHlqTzNR?=
 =?utf-8?B?VjhMeGlwKzZxOUtuNDljMDlDVUJlWUZQTEsrNkIvT0Zua2Z4eU5oNnZ6LzNJ?=
 =?utf-8?B?NytFSDBOaTcyWU5kNmxuUWY1aEhENWQrRXcrRFlDa0xmd3d2SUpBK2FtRlpp?=
 =?utf-8?B?REMwZWlicXJqSzUyVEZkVFU2U0hyRTBIY1duZTQyNCtvQWlkdHJ0TnlVN0pH?=
 =?utf-8?B?ZUFuUGFPSnJBZzc3WG53SFRKTlNzOFBFM1ZJc0VFKzdJK3AvUk9PS0VGcmNT?=
 =?utf-8?B?QVpBYVBGVEpkSkdyU3VXckxuNVZmVXZyS1JZaUx1N2ZXelBhSm12dUxFazNv?=
 =?utf-8?B?V3o4M2pmUEJGQlR2RytmMlV2RTdWMUpKVlpxRnFibk4wTDRHK1ZBdCsxUVc5?=
 =?utf-8?B?MWJFNnk5M0ROYk5rUEFVSlFjZmlvTDl2MnZ3WisybnF6d3ZkeHVQb0hVRGN0?=
 =?utf-8?B?alBneVYvQ2JIdXU3eGlMYlNLemVMUy9SMk9jTG5UdU9CSmtlUEVqWXp2NmV6?=
 =?utf-8?B?RTdCZGZQUUhWc2F2amh1NVYzNXpiMVYzT1ZnYWdpN3RUMUt1TFQ1MWNXWWFp?=
 =?utf-8?B?eGR0czdWeUxyMk1FREJkN25LZGZkWTJNek9YVG5yM3ptSE5iVjFkaG5jNDlx?=
 =?utf-8?B?Rmc1T1JTNWl3M3hkU0FSOUpUbFZ5TWlDek9uZHRvRWJGS3JqVE1aWFZFbll5?=
 =?utf-8?B?QU5MejdOaEJhSUovTVZYaTVjZm5yU3ZPaEF2dStXaG5yOXloVmRnMmtjdUdp?=
 =?utf-8?B?UUttTXliU1cxQllXNm1Zb3FJNklBR1g1ZllKbjRPTXlha3BtdTV3czB3bVJx?=
 =?utf-8?B?aVQ4ZFNVNk92ZXU3azVJMU9Oc2lOT25oVWpWMFZ2WGtad01uellLZUVsVi9S?=
 =?utf-8?Q?VTuy5xi5PbT8KiF4WVuXHk7hL?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <05F2A68EEA9AAE40863E4275C0D8C0AB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uPliLEFzi9zAh3hyMJKsfd2OAcurMonT71C7nDk5U6tyneRv7pOoM8c50mEqwsQpiVctLwcjZCOfNFQgpqOsc0ldfQCaWmnBV7M6NNSotTcuTHzDpc1a8HvXnScy3BThYLsur/IjAtA2wekIE+nWknu3rCQc+ZPUBmEPOIwCN9lkbuGr0LcyibP79mtqRqGI6lldlL579kPYxiWviJDXlZXOdjsfQODl1a8TOYQKNxkpd2x1s3nuBFEMxMWgF+3aQyFp8PY9liDncxikd01HcvNXy/pkQEXyzg8PJdklyxZ3KQkF1oKHTedLQytEVZNmDYRFlaAeXrevwF3h5sk9oAQJzRfs2pgwM0GA8oCG48W1v1JxPev6djSGiqlzViB4jfoDElrzSXy5QsATk4cwlrFoKBofsON8v1YyDgSbEPZWbc2O0D73wVrTBfxPu3NjH/sGuwdHUrO9oxUn0rmVqB7ml7TwvRLUKO/pV66B/UdrulXAKUY58dDa52eCyZfuYKkRgkKDMLJTW70n1vBW8ienMUNx87tB9vnekAXv9uBbGlBS8qQs8xmgZiaPrB9nVKIhlIVFTgB4bJeuinTn6ks/h7GQAGqBQID/Y8LWvkd3pecs/d/JCrRpxg0PKcvY95zEp48ZWQsCa0946m1IBJKjxs+YRF5bfDttawypQ/YQNw2K9cnE8m7WCDP+0wRsZymtqK2bTiHsiqWLBHe9a+iTgDbsJZ93cIaeBZZSZgH/wZCX92d+Nb6gzuos0P7wRxaBiVPmTZdYzOkG8dXpjd4kXcOgYlZs5ORTylG7PICEvl7BHzHZko+A2ALehAJ47dBpdjTgvxwthkZ+8kKiuw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 986fcdd0-93fe-441b-2a55-08daef8a275d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2023 02:03:07.1132
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 92bAOolrs6jF9bwbErrfI2bwccOSB9RiWSNCf/QxmfVmXxQ69/ZFSlNBMSF5Dhldy5apQEUkxt7Nnz4wV2wWJgf7QllBpV2cAYx/FiveGTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5162

T24gMDUvMDEvMjAyMyA0OjA1IHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gVGhlICJuIiBpbnB1
dCBpcyBhIEdGTiB2YWx1ZSBhbmQgaGVuY2UgYm91bmRlZCBieSB0aGUgcGh5c2ljYWwgYWRkcmVz
cw0KPiBiaXRzIGluIHVzZSBvbiBhIHN5c3RlbS4NCg0KVGhlIG9uZSBjYXNlIHdoZXJlIHRoaXMg
aXNuJ3Qgb2J2aW91c2x5IHRydWUgaXMgaW4gc2hfYXVkaXQoKS7CoCBJdCBjb21lcw0KZnJvbSBh
IHJlYWwgTUZOIGluIHRoZSBzeXN0ZW0sIG5vdCBhIEdGTiwgd2hpY2ggd2lsbCBoYXZlIHRoZSBz
YW1lDQpwcm9wZXJ0eSBXUlQgUEFERFJfQklUUy4NCg0KPiAgVGhlIGhhc2ggcXVhbGl0eSB3b24n
dCBpbXByb3ZlIGJ5IGFsc28NCj4gaW5jbHVkaW5nIHRoZSB1cHBlciBhbHdheXMtemVybyBiaXRz
IGluIHRoZSBjYWxjdWxhdGlvbi4gVG8ga2VlcCB0aGluZ3MNCj4gYXMgY29tcGlsZS10aW1lLWNv
bnN0YW50IGFzIHRoZXkgd2VyZSBiZWZvcmUsIHVzZSBQQUREUl9CSVRTIChub3QNCj4gcGFkZHJf
Yml0cykgZm9yIGxvb3AgYm91bmRpbmcuIFRoaXMgcmVkdWNlcyBsb29wIGl0ZXJhdGlvbnMgZnJv
bSA4IHRvIDUuDQoNCldoaWxlIHRoaXMgaXMgYWxsIHRydWUsIHlvdSdsbCBnZXQgYSBtdWNoIGJl
dHRlciBpbXByb3ZlbWVudCBieSBub3QNCmZvcmNpbmcgJ24nIG9udG8gdGhlIHN0YWNrIGp1c3Qg
dG8gYWNjZXNzIGl0IGJ5dGV3aXNlLsKgIFJpZ2h0IG5vdywgdGhlDQpsb29wIGxvb2tzIGxpa2U6
DQoNCjxzaGFkb3dfaGFzaF9pbnNlcnQ+Og0KwqDCoMKgIDQ4IDgzIGVjIDEwwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgc3ViwqDCoMKgICQweDEwLCVyc3ANCsKgwqDCoCA0OSA4OSBj
OcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1vdsKgwqDCoCAlcmN4LCVy
OQ0KwqDCoMKgIDQxIDg5IGQwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
bW92wqDCoMKgICVlZHgsJXI4ZA0KwqDCoMKgIDQ4IDhkIDQ0IDI0IDA4wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgbGVhwqDCoMKgIDB4OCglcnNwKSwlcmF4DQrCoMKgwqAgNDggOGQgNGMgMjQg
MTDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsZWHCoMKgwqAgMHgxMCglcnNwKSwlcmN4DQrC
oMKgwqAgNDggODkgNzQgMjQgMDjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtb3bCoMKgwqAg
JXJzaSwweDgoJXJzcCkNCsKgwqDCoCAwZiAxZiA4MCAwMCAwMCAwMCAwMMKgwqDCoMKgwqDCoMKg
IG5vcGzCoMKgIDB4MCglcmF4KQ0KLy0+IDBmIGI2IDEwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgbW92emJsICglcmF4KSwlZWR4DQp8wqDCoCA0OCA4MyBjMCAwMcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFkZMKgwqDCoCAkMHgxLCVyYXgNCnzCoMKgIDQ1
IDY5IGMwIDNmIDAwIDAxIDAwwqDCoMKgwqDCoMKgwqAgaW11bMKgwqAgJDB4MTAwM2YsJXI4ZCwl
cjhkDQp8wqDCoCA0MSAwMSBkMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGFkZMKgwqDCoCAlZWR4LCVyOGQNCnzCoMKgIDQ4IDM5IGMxwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgY21wwqDCoMKgICVyYXgsJXJjeA0KXC0tIDc1IGVhwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgam5lwqDCoMKgIGZmZmY4MmQwNDAy
ZWZkYTANCjxzaGFkb3dfaGFzaF9pbnNlcnQrMHgyMD4NCg0KDQp3aGljaCBkb2Vzbid0IGV2ZW4g
aGF2ZSBhIGNvbXBpbGUtdGltZSBjb25zdGFudCBsb29wIGJvdW5kLsKgIEl0J3MNCnJ1bnRpbWUg
Y2FsY3VsYXRlZCBieSB0aGUgc2Vjb25kIGxlYSBjb25zdHJ1Y3RpbmcgdGhlIHVwcGVyIHBvaW50
ZXIgYm91bmQuDQoNCkdpdmVuIHRoaXMgZnVydGhlciBkZWx0YToNCg0KZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9tbS9zaGFkb3cvY29tbW9uLmMNCmIveGVuL2FyY2gveDg2L21tL3NoYWRvdy9j
b21tb24uYw0KaW5kZXggNGE4YmNlYzEwZmU4Li45MDJjNzQ5ZjI3MjQgMTAwNjQ0DQotLS0gYS94
ZW4vYXJjaC94ODYvbW0vc2hhZG93L2NvbW1vbi5jDQorKysgYi94ZW4vYXJjaC94ODYvbW0vc2hh
ZG93L2NvbW1vbi5jDQpAQCAtMTM5NywxMyArMTM5NywxMiBAQCBzdGF0aWMgdW5zaWduZWQgaW50
IHNoYWRvd19nZXRfYWxsb2NhdGlvbihzdHJ1Y3QNCmRvbWFpbiAqZCkNCsKgdHlwZWRlZiB1MzIg
a2V5X3Q7DQrCoHN0YXRpYyBpbmxpbmUga2V5X3Qgc2hfaGFzaCh1bnNpZ25lZCBsb25nIG4sIHVu
c2lnbmVkIGludCB0KQ0KwqB7DQotwqDCoMKgIHVuc2lnbmVkIGNoYXIgKnAgPSAodW5zaWduZWQg
Y2hhciAqKSZuOw0KwqDCoMKgwqAga2V5X3QgayA9IHQ7DQrCoMKgwqDCoCBpbnQgaTsNCsKgDQrC
oMKgwqDCoCBCVUlMRF9CVUdfT04oUEFERFJfQklUUyA+IEJJVFNfUEVSX0xPTkcgKyBQQUdFX1NI
SUZUKTsNCi3CoMKgwqAgZm9yICggaSA9IDA7IGkgPCAoUEFERFJfQklUUyAtIFBBR0VfU0hJRlQg
KyA3KSAvIDg7IGkrKyApDQotwqDCoMKgwqDCoMKgwqAgayA9IHBbaV0gKyAoayA8PCA2KSArIChr
IDw8IDE2KSAtIGs7DQorwqDCoMKgIGZvciAoIGkgPSAwOyBpIDwgKFBBRERSX0JJVFMgLSBQQUdF
X1NISUZUICsgNykgLyA4OyBpKyssIG4gPj49IDggKQ0KK8KgwqDCoMKgwqDCoMKgIGsgPSAodWlu
dDhfdCluICsgKGsgPDwgNikgKyAoayA8PCAxNikgLSBrOw0KwqANCsKgwqDCoMKgIHJldHVybiBr
ICUgU0hBRE9XX0hBU0hfQlVDS0VUUzsNCsKgfQ0KDQp0aGUgY29kZSBnZW4gYmVjb21lczoNCg0K
PHNoYWRvd19oYXNoX2luc2VydD46DQrCoMKgwqAgNDEgODkgZDDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBtb3bCoMKgwqAgJWVkeCwlcjhkDQrCoMKgwqAgNDkgODkgYznC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtb3bCoMKgwqAgJXJjeCwlcjkN
CsKgwqDCoCBiOCAwNSAwMCAwMCAwMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1vdsKgwqDC
oCAkMHg1LCVlYXgNCi8tPiA0NSA2OSBjMCAzZiAwMCAwMSAwMMKgwqDCoMKgwqDCoMKgIGltdWzC
oMKgICQweDEwMDNmLCVyOGQsJXI4ZA0KfMKgwqAgNDAgMGYgYjYgZDbCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBtb3Z6YmwgJXNpbCwlZWR4DQp8wqDCoCA0OCBjMSBlZSAwOMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNocsKgwqDCoCAkMHg4LCVyc2kNCnzCoMKgIDQx
IDAxIGQwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYWRkwqDCoMKgICVl
ZHgsJXI4ZA0KfMKgwqAgODMgZTggMDHCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBzdWLCoMKgwqAgJDB4MSwlZWF4DQpcLS0gNzUgZTnCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBqbmXCoMKgwqAgZmZmZjgyZDA0MDJlZmQ4Yg0KPHNoYWRv
d19oYXNoX2luc2VydCsweGI+DQoNCndpdGggYW4gYWN0dWFsIGNvbnN0YW50IGxvb3AgYm91bmQs
IGFuZCBub3QgYSBtZW1vcnkgb3BlcmFuZCBpbiBzaWdodC7CoA0KVGhpcyBmb3JtIChldmVuIGF0
IDggaXRlcmF0aW9ucykgd2lsbCBlYXNpbHkgZXhlY3V0ZSBmYXN0ZXIgdGhhbiB0aGUNCnN0YWNr
LXNwaWxsZWQgZm9ybS4NCg0KfkFuZHJldw0K

