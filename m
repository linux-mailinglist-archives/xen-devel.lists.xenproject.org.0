Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FEE57A0F5
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 16:14:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370677.602557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDny2-0001UD-SN; Tue, 19 Jul 2022 14:12:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370677.602557; Tue, 19 Jul 2022 14:12:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDny2-0001RD-PZ; Tue, 19 Jul 2022 14:12:54 +0000
Received: by outflank-mailman (input) for mailman id 370677;
 Tue, 19 Jul 2022 14:12:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+LuP=XY=citrix.com=prvs=1929f1d84=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oDny1-0001R7-75
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 14:12:53 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dde3f1a2-076c-11ed-924f-1f966e50362f;
 Tue, 19 Jul 2022 16:12:50 +0200 (CEST)
Received: from mail-dm6nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jul 2022 10:12:42 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN9PR03MB5962.namprd03.prod.outlook.com (2603:10b6:408:133::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Tue, 19 Jul
 2022 14:12:40 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 14:12:40 +0000
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
X-Inumbo-ID: dde3f1a2-076c-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658239970;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=46eHTGcIXiTxNKzyN+/IF89NYdtrZ4+vu3IkW/DEro4=;
  b=KBQ7qIFOWuXtNeNXe9CUTOYl9hlIEb81/cmLAGDyoF4J6Rp9X//i6Zkc
   hMzPPoPD0WAjZnFUjH2CvjsBU6xw3+wmzMaybfd6hFiip7DHhYtNevGJz
   v2lEtTz9j5g0WZZ5HtBXOUEbkZd20/+z30C2ZVIQQyc1pH0kmNc+cUHyt
   0=;
X-IronPort-RemoteIP: 104.47.59.176
X-IronPort-MID: 75950192
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:TWQW36Jh7TkjX2C4FE+RVpQlxSXFcZb7ZxGr2PjKsXjdYENS1jcEm
 jYaCz+EM/mLNmr2eo92O4W3pEoOuMXcx4VnQFZlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraP65xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOd8iYNz6TSDK1rlV
 eja/ouOYjdJ5xYuajhOs/3a+Us11BjPkGhwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 44vG5ngows1Vz90Yj+Uuu6Tnn8iG9Y+DiDX4pZiYICwgwAqm8AH+v1T2Mzwy6tgo27hc9hZk
 L2hvHErIOsjFvWkdO81C3G0H8ziVEHvFXCuzXWX6KSuI0P6n3TE/ql3PGMvFoYi2sVHAmtXq
 /A1BxckcUXW7w626OrTpuhEoO0GdZOuEKZB/3ZqwHfeEOosRo3FT+PS/9hE0Twsh8dIW/HDe
 84ebjkpZxPFC/FNEg5PVNRiw6H11z+mLGMwRFG9/MLb50D6ygBr3aerG93SYtGQHu1en1qCp
 3KA9GP8av0fHIPCmGfdqyP27gPJtQPSW7ITBODjz9druWSP3k4yJS8IX2Lu9JFVjWb7AbqzM
 Xc89icwoKwa+UCoFJ/yRRqluGXCvxl0c8pdFag25R+AzoLQ4h2FHS4UQzhZctskucQqAzsw2
 TehlsnlD39zsbSTTnma7Lq8rj6oPyURa2gYakcsTwoI/NTl5pA6iTrOSMpuFOi+ididMTP32
 TyDqm46wbcOltIG0Y26+0zKh3SnoZ2hZg0v7xXaWkq/4w95bZLjbIutgXDZ8PJBIYCxXlSH+
 n8elKCjAPsmCJiMkGmBRbsLFbTwvfKdamSD3xhoAoUr8Cmr9zi7Z4dM7TpiJUBvdMEZZTvuZ
 0yVsgRUjHNOAEaXgWZMS9rZI6wXIWLITLwJiti8ggJyX6VM
IronPort-HdrOrdr: A9a23:RCXnIK0QC64I0XIewvHhzgqjBRFyeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4uxpOMG7MBDhHQYc2/hdAV7QZnidhILOFvAv0WKC+UyrJ8SazIJgPM
 hbAs9D4bHLbGSSyPyKmDVQcOxQj+VvkprY49s2pk0FJW4FV0gj1XYBNu/xKDwVeOAyP+tcKH
 Pq3Lsjm9PPQxQqR/X+IkNAc/nIptXNmp6jSwUBHQQb5A6Hii7twKLmEjCDty1uEg9n8PMHyy
 zoggb57qKsv7WQ0RnHzVLe6JxQhZ/I1sZDPsqRkcIYQw+cyjpAJb4RGIFqjgpF5d1H22xa1O
 UkZC1QePib3kmhPF1dZyGdnTUIngxeskMKgmXo/EcL6faJOA7STfAxy76xOyGplXbJ9rtHod
 129nPcuJxNARzamiPho9DOShFxj0Kx5WEviOgJkhVkIMIjgZJq3PsiFXluYeE9NTO/7JpiHP
 hlDcna6voTeVSGb2rBtm0qxNC3RHw8EhqPX0BH46WuonNrtWE8y1FdyN0Un38G+p54Q55Y5/
 7cOqAtkL1VVMcZYa90Ge9ES8qqDW7GRw7KLQupUBzaPbBCP2iIp4/84b0z6u3vcJsUzIEqkJ
 CES19cvX5aQTObNSRP5uw/zvngehTMYd228LAu23FQgMyOeJP7dSueVVspj8ys5/0CH8yzYY
 fABK5r
X-IronPort-AV: E=Sophos;i="5.92,284,1650945600"; 
   d="scan'208";a="75950192"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lTK0i/w5JXIz0NLO9Lq/IJNPgdDTx59MhYiPSXjOfGxGVHFXrHt8iitmHyVS8UVTvw7aX/beyOHn7W6c7Hsp5NSxXcLjGIXC1T20/jwrSYeLnZssnbCeQ2GMPQ9SbV+hTnIHdc8WdxgxAPH0a5INcJTT7eDMaNGdeFGXnUkmdwVUXln59blqW9Hc7SitQeD59bVyInr/xlGKXBW+Euv3oRiPeaDbOiNmDPNI1hgJDGSJgFxcDDDoTThMTu4wS281Z530J9EBM5LCSnSVvAKBsNWcSCT6fLdTJOqbD3zB31mSvd/REHpCKuaDJ3BbdcAARV0gF9vFFeHALmEyAGMk/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46eHTGcIXiTxNKzyN+/IF89NYdtrZ4+vu3IkW/DEro4=;
 b=TQsUsvCn8USGf6KViJ1f19QwzOW8UUMnJLVxq0TwPo33Kh3WTIiFMxpLp+XA6b/+y21ElpU29AzbsX39qB72RpBR3a1pTRcYzKrWxpzmjm7sIHlc1N7+fz6Fq3FrYv+5w/yL3eKizsBczH7Lw7ZcnPYdBMSIGTrVxAypIYfPLNVELQMiSThGhFZrH7QetVvVq21CHMfaCWrhrFGFg0Ld9xL7XcyrRTWycurvEdEDu28pdg9ZOalk9m3wSAyDpC9Hj/A0LBBgq4BeBqBS3Co3J7U4j/kB3Hf+MDMZUszGAQ19PpLTpB8ZxX1mcXMW/5n4Uay1Sa0XXfojGHrB/rtWbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46eHTGcIXiTxNKzyN+/IF89NYdtrZ4+vu3IkW/DEro4=;
 b=VlVwr+5Lpr4Whz8cfuSKXyH0ZghM/D1L3lKiMrPkAafi0zesVu7vj9d4btNw8tMrgAID2sQbeuHpxNofaE+xGFFPUmvsL3CJGg0P5E3BviXyWx/yCHB+Dv25ayckRU6vkcTtHVwXWGuaIllorpgVAVWb7q+yhEJlYAK4fi4pqo0=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>, "devel@edk2.groups.io"
	<devel@edk2.groups.io>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ard
 Biesheuvel <ardb+tianocore@kernel.org>, Jiewen Yao <jiewen.yao@intel.com>,
	Jordan Justen <jordan.l.justen@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Julien Grall <julien@xen.org>
Subject: Re: [PATCH 1/1] OvmfPkg/XenPvBlkDxe: Fix memory barrier macro
Thread-Topic: [PATCH 1/1] OvmfPkg/XenPvBlkDxe: Fix memory barrier macro
Thread-Index: AQHYm3bUnP9y0GYoU0uIINVtZTXPCK2FvEeA
Date: Tue, 19 Jul 2022 14:12:40 +0000
Message-ID: <73483ebf-d641-e4f2-6e23-b0336e62f359@citrix.com>
References: <20220719135230.32838-1-anthony.perard@citrix.com>
In-Reply-To: <20220719135230.32838-1-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 459c6c68-c9f3-45f9-e2d8-08da6990bd98
x-ms-traffictypediagnostic: BN9PR03MB5962:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 181hoYzkU6eUIr4dOOIYmiL8nAcgAd6w2o4NjPyk96AEludIthqpaG91j4bGWHEzrIHNakHdEFS0Gkg3Egm55iO24No99woTkTj1A1gsTXJej05GDmxl/6Ufh9P9aUscpgneJHwXbx5toVq6hjHzQjVxSrfU6alY8n4+JwnVeQri4/pFU2zE41A05ZjEUfjLGtcwqjn7/SBZze25FHCFCTy6VMw4B4MoIup7+sxpxvz1ERtzhJWW2XlUhqOUKgOJOfuYp/RZI5Ut3VA8/589g2A6RjT/0CR/POtpUaYqnUSbGXBqS00jLI5fTxIEwbZVymlsmwNcbCmK3GNSuVRmY6YdPud3BqhH1GWsn/hZmVBm6vHa85k6auIUASQ7HzvyU8RPiT9quF6zxNhgctkfuEM6SqcRxElKk3OvcB4LvNPqH5sN8jxxNjmbbM2lNE5bTU6mjueisNgd7ttgAoWjTbM/Yeeb/enbfU1uo5W24RKsfnNhJF36lANFoKtj9cXPuVloCc5yj3jVopCl+qo4GUBwEj6n5/vhcH/zcIfhS+6GiUo7pvKbiZSoglHBGZWpnBRl+VM8RWG3ScKZNgenECNuZHH1doVTWlho5Zjk21VSN+651QahT47jF0Kj4gDhYCdInr67GpnRHQKIvs/ANtWTxnRxSY3qkGKXZUtT3YhE+6t8O+e/PDAB4cdKKq3Uy59bH3xTDQs3jJpCV/689YD8FhcyFfsj86+8k96xoMFB7bo9G5Cbx8giq2hnnsPLMlV7j5VI5EK7WLMP36bb26IzUbQG7Phe7TbP1ScwOQFUz7yOdYRRmERTqDAZtinFPfUBh6pBBmBuWYdXaUHbRtSvu29cMj986c+vPc4zw8g=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(6029001)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(36756003)(4326008)(76116006)(5660300002)(8936002)(66476007)(66556008)(64756008)(8676002)(66946007)(38100700002)(122000001)(31696002)(2616005)(2906002)(86362001)(478600001)(19627235002)(38070700005)(31686004)(6486002)(71200400001)(41300700001)(82960400001)(83380400001)(110136005)(6506007)(66446008)(316002)(6512007)(26005)(53546011)(186003)(91956017)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SnpYblhobzdNWmZTK2F5eHBOKzlFSnFmK1FUUzlwZlB3aE1CZjFBQWpPY2sr?=
 =?utf-8?B?NnNTZ0l0V2E0L1BuN0w0UTFmZUhrdTgrM3R6aTVWZVZncGpRZkdlSng0am5R?=
 =?utf-8?B?TXFNQjl4d09OTFBlNkJabGZIek1uc0lRaTV3Q25yMjhyYzFQRHh6M1JScTB4?=
 =?utf-8?B?VUxjaEtnK1gzRkFiMS9qTzZzcE9yY1EzWmJNcDZYOXdyWjU3MVhsMlJrZnQx?=
 =?utf-8?B?SThONU9MYkVZbTN4Q2lYekdJa0JoMXNZY05pT2MwSGFmaVZ6N3QwVWVUKzBo?=
 =?utf-8?B?TWVYY1hjdXNSbERIbUhSZWtxV1dlRjd0Wm1WRTJ6U2dtL1NmRkNoR1B2UGdF?=
 =?utf-8?B?aTdyd3Izc0s4S01vVDh5NTJ4MUQwWmRjcUl2c0FYQjRoWGtZeGpGR1JiZ2lh?=
 =?utf-8?B?TEpsSTd4bytFcWFEUDBJT1A3TmlXSEJKTzg4WjgzcENQaUtIWnBrTGhWSjhz?=
 =?utf-8?B?MTdaUWJXYmVaby9kSnpSZW5tVHBzeTVSTVRCZjl4azJJaG55RnliTWxsRS9H?=
 =?utf-8?B?V1doTkxsd2RPNUgwOUt4YlpFaGRRaTI0MHhlNDlGQ0FqMDdjZ3J3ZXFUU3Vx?=
 =?utf-8?B?RmJHVXdxUnJUWmxvTjMyNlc2NXo4QlhEemRFTnJrOGtZbjR5RG9xQjB6R0JG?=
 =?utf-8?B?UnY4QlEwMDZpSndnK3JBVmlVRkx2ZEkwaGpJbHc0ZzdvMjZPQVFYTTJMNmp6?=
 =?utf-8?B?RjRrTXRNcTZmb1g1UFNTa1haUjFrTHhlb0ZpbkNXSkoxWFUzVlE1SkRzVmNr?=
 =?utf-8?B?Wld6ZGNkQmZJWVRJSmllQWZrb0pMQWRSRklnaDlGOC9XMzJLQ0RCQ0tiSzh0?=
 =?utf-8?B?OW51R3hHZGNoNTQ5aGhRL0wvcXlYRzZEbXUxNkdZZUovdTRHT3hwV1Y2a0Jo?=
 =?utf-8?B?cmRCYXRINU1FUmlvWFBmS01ma3Q2K3FLT0RCaXRCM1NVWXlzTk9Rb3lON3No?=
 =?utf-8?B?V3BxcmVjeXkyQVZjako2Um5oTk9nUjhFUUZhQTBubWhUVnFkQVI4UGF1c09B?=
 =?utf-8?B?bXVRa1pVQm42SklVQzlIQUdGL1A0dWhsU1hKN0tTZ0J0YnJsUzB4TFBUajl4?=
 =?utf-8?B?elJvdnNaUEk1MzNldUJJMzBTbitMQVhPUHRiVzlBb3ZyRXRwU3RrSEVvQVpQ?=
 =?utf-8?B?Y2lxbFozLzdwV3BCVWxHcDdQeTdwZGRSWUR1QlZoY3U0Z3Z5ckRLZHN1NDdT?=
 =?utf-8?B?M3lNdFNHa0xJZ01ab0o3bTVPM1BoZW5hUVA0U0o1SldoT2UzUi9ZcU9vc2JS?=
 =?utf-8?B?N0s2U28zNFRGNW5nb0xjN3l3TFBBUkdOb2NQcEhDU01WUjhleTVNa0xERjJp?=
 =?utf-8?B?bGQ3TFh0QlNPUk1ZRDg1WGF3bzhmcGFhSy8rMDRCRUc1Y2h4YmtiVVFlT25p?=
 =?utf-8?B?OXRYcy9YNFRMWlF0MWFVdzFiaHRublpLQnh5NDFFb0RCeElxL01nMXhkVEp3?=
 =?utf-8?B?a3dydTg3VUs1SjRBZzhyNWcyc2NjVzlTaGg0T3RSNCsraG50RU5oaG55d2NP?=
 =?utf-8?B?WFY1ZERpYXdkdlRidm9sTjZyaURjTnJsTW9JRUhZYWc1RTRkSG0yMi9yWWh3?=
 =?utf-8?B?czBrMndTZVBvcTA5YmQrbmV1czlFVk1UMWVxeGc0d2twNDJwbXZnbGc5eDBl?=
 =?utf-8?B?bTJlM1hpNUZaeUtldkl1UUFueXR5STJ1bEcxM0pwTkRoNFdFTXdjc2tMRTFJ?=
 =?utf-8?B?Y0ZoR1BnUEpDZTNDaWxvMzhqVXhmaUlkRDFybUZ3dFp5YmtGQ0h5VmViWGoz?=
 =?utf-8?B?UXc4RjRoSWIrT2VHNEpZbEx1a2hRV2lnVTBwYTBleEV4TUNKdEJPdVpPamV2?=
 =?utf-8?B?K1dmSXNsNXU3L3E2djgxY21uTzhOQlFIK1NqZVlwTHczRkc3Tk1CczBXV2ov?=
 =?utf-8?B?QmhYUE1IaXpSWEhObG1seHNVcFFvR0tSbHRVbnhTNFZYeHVqOFVTM2hQQ2h2?=
 =?utf-8?B?UnJ0MVN4bUZIU3M3QU8wYlhvZXhkMUgvZDhIeU9GL0JvV2lHZzgzTmRYSGdq?=
 =?utf-8?B?Smd1ZHV1WVBqbzVvRHptOGNhR2VzU1RUM2FkOVZURDFGU0NlRGV3NXBZS0o2?=
 =?utf-8?B?TmJKRUQzZWdCRHc0L1NDSm5wbElEMXA2eXpBMFQ2dWxFVCtpN1JiUGhBSG9D?=
 =?utf-8?Q?EdyQS7Mc8E4FJH6gP5hcW7Y/E?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4322EA8C8F1BA34D9996EB110178DAC0@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 459c6c68-c9f3-45f9-e2d8-08da6990bd98
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2022 14:12:40.3154
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dGthQG0ll0ZY3kYrE2IbyHP1EbNYsD3yGnS0580krOxoTSelUVzZliY8odoZBQ1oUDtUTzNFHR8cTN97H5KuWIhQazraDYwuF03iMk0Bovk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB5962

T24gMTkvMDcvMjAyMiAxNDo1MiwgQW50aG9ueSBQZXJhcmQgd3JvdGU6DQo+IGRpZmYgLS1naXQg
YS9Pdm1mUGtnL1hlblB2QmxrRHhlL1hlblB2QmxrRHhlLmggYi9Pdm1mUGtnL1hlblB2QmxrRHhl
L1hlblB2QmxrRHhlLmgNCj4gaW5kZXggMzUwYjdiZDMwOWMwLi42N2VlMTg5OWU5YTggMTAwNjQ0
DQo+IC0tLSBhL092bWZQa2cvWGVuUHZCbGtEeGUvWGVuUHZCbGtEeGUuaA0KPiArKysgYi9Pdm1m
UGtnL1hlblB2QmxrRHhlL1hlblB2QmxrRHhlLmgNCj4gQEAgLTExLDggKzExLDkgQEANCj4gICNk
ZWZpbmUgX19FRklfWEVOX1BWX0JMS19EWEVfSF9fDQo+ICANCj4gICNpbmNsdWRlIDxVZWZpLmg+
DQo+ICsjaW5jbHVkZSAiRnVsbE1lbW9yeUZlbmNlLmgiDQo+ICANCj4gLSNkZWZpbmUgeGVuX21i
KCkgICBNZW1vcnlGZW5jZSgpDQo+ICsjZGVmaW5lIHhlbl9tYigpICAgRnVsbE1lbW9yeUZlbmNl
KCkNCj4gICNkZWZpbmUgeGVuX3JtYigpICBNZW1vcnlGZW5jZSgpDQo+ICAjZGVmaW5lIHhlbl93
bWIoKSAgTWVtb3J5RmVuY2UoKQ0KDQpPaywgc28gdGhlIG9sZCBNZW1vcnlGZW5jZSgpIGlzIGRl
ZmluaXRlbHkgYm9ndXMgaGVyZS4NCg0KSG93ZXZlciwgaXQgZG9lc24ndCBuZWVkIHRvIGJlIGFu
IG1mZW5jZSBpbnN0cnVjdGlvbi7CoCBBbGwgdGhhdCBpcw0KbmVlZGVkIGlzIHNtcF9tYigpLCB3
aGljaCB0aGVzZSBkYXlzIGlzDQoNCmFzbSB2b2xhdGlsZSAoICJsb2NrIGFkZGwgJDAsIC00KCUl
cnNwKSIgOjo6ICJtZW1vcnkiICkNCg0KYmVjYXVzZSB0aGF0IGhhcyB0aGUgcmVxdWlyZWQgcmVh
ZC93cml0ZSBvcmRlcmluZyBwcm9wZXJ0aWVzIHdpdGhvdXQgdGhlDQpleHRyYSBzZXJpYWxpc2lu
ZyBwcm9wZXJ0eSB0aGF0IG1mZW5jZSBoYXMuDQoNCkZ1cnRoZXJtb3JlLCAuLi4NCg0KPiAgDQo+
IGRpZmYgLS1naXQgYS9Pdm1mUGtnL1hlblB2QmxrRHhlL1g4NkdjY0Z1bGxNZW1vcnlGZW5jZS5j
IGIvT3ZtZlBrZy9YZW5QdkJsa0R4ZS9YODZHY2NGdWxsTWVtb3J5RmVuY2UuYw0KPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLjkyZDEwN2RlZjQ3MA0KPiAtLS0g
L2Rldi9udWxsDQo+ICsrKyBiL092bWZQa2cvWGVuUHZCbGtEeGUvWDg2R2NjRnVsbE1lbW9yeUZl
bmNlLmMNCj4gQEAgLTAsMCArMSwyMCBAQA0KPiArLyoqIEBmaWxlDQo+ICsgIENvcHlyaWdodCAo
QykgMjAyMiwgQ2l0cml4IEx0ZC4NCj4gKw0KPiArICBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
QlNELTItQ2xhdXNlLVBhdGVudA0KPiArKiovDQo+ICsNCj4gKyNpbmNsdWRlICJGdWxsTWVtb3J5
RmVuY2UuaCINCj4gKw0KPiArLy8NCj4gKy8vIExpa2UgTWVtb3J5RmVuY2UoKSBidXQgcHJldmVu
dCBzdG9yZXMgZnJvbSBiZWVuIHJlb3JkZWQgd2l0aCBsb2FkcyBieQ0KPiArLy8gdGhlIENQVSBv
biBYNjQuDQo+ICsvLw0KPiArVk9JRA0KPiArRUZJQVBJDQo+ICtGdWxsTWVtb3J5RmVuY2UgKA0K
PiArICBWT0lEDQo+ICsgICkNCj4gK3sNCj4gKyAgX19hc21fXyBfX3ZvbGF0aWxlX18gKCJtZmVu
Y2UiOjo6Im1lbW9yeSIpOw0KPiArfQ0KDQouLi4gc3R1ZmYgbGlrZSB0aGlzIG5lZWRzIHRvIGNv
bWUgZnJvbSBhIHNpbmdsZSBjb3JlIGxvY2F0aW9uLCBhbmQgbm90DQpvcGVuY29kZWQgZm9yIGVh
Y2ggZHJpdmVyLg0KDQp+QW5kcmV3DQo=

