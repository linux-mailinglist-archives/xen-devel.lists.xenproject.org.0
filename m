Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A32D66BE7D
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 14:00:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478616.741891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHP6C-0007vz-5P; Mon, 16 Jan 2023 13:00:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478616.741891; Mon, 16 Jan 2023 13:00:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHP6C-0007tL-2M; Mon, 16 Jan 2023 13:00:28 +0000
Received: by outflank-mailman (input) for mailman id 478616;
 Mon, 16 Jan 2023 13:00:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NbzH=5N=citrix.com=prvs=37389537a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pHP6A-0007tF-H9
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 13:00:26 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcc8cf9a-959d-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 14:00:24 +0100 (CET)
Received: from mail-dm6nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jan 2023 08:00:21 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6676.namprd03.prod.outlook.com (2603:10b6:a03:389::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Mon, 16 Jan
 2023 13:00:19 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.019; Mon, 16 Jan 2023
 13:00:19 +0000
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
X-Inumbo-ID: bcc8cf9a-959d-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673874024;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=z0N7OstpLjBMBTdgOCP8BX9f/j9u+I+kof1U/TrllB4=;
  b=VZ//vhB8zp/1OlTRDeNZJdvkfxWrIAlNvJzoePg1nQOhpn9t0IfzQZxl
   QCIoj2keYAPxnRlWGpV6QHYdczxjm54H/+05FdCmJqJh2kEHvPC6YZWhy
   5QMdl8hcyQNloFREjKZzgw9Cx6ocV7nd3ppipTRhvFLggemPuPFgBlGSs
   8=;
X-IronPort-RemoteIP: 104.47.57.171
X-IronPort-MID: 92858993
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:QWxhGaNdGblckevvrR2dlsFynXyQoLVcMsEvi/4bfWQNrUp31WMPz
 TBJCG/XPveLMWH1eYpwaInn/U1Xu8KAm9dnSwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tB5wJmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0t93Dllx+
 cAmEj4MdRGRmcyT/O2SUuY506zPLOGzVG8ekldJ6GiASNoDH9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PVxujeKpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eex3OmCNNDT9VU8NZpvFaJxVcBKScrdkflsPrjjEKsX85mf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmSzoLE7gDfAXILJhZCZcInsokqRDUs/
 l6Pg97tQzdotdW9WX+bs7uZsz62ESwUNnMZIz8JSxMf5Nvuq511iQjAJuuPC4awh9zxXD31n
 TaDqXFng61J1JFSkaKm4VrAnjSg4IDTSRI47RnWWWTj6R5lYImiZMqj7l2zAet8Ebt1h2Kp5
 BAs8/VyJshSZX1RvERhmNkwIYw=
IronPort-HdrOrdr: A9a23:z2VzpKyto7W5DrTb73x3KrPwO71zdoMgy1knxilNoHtuEvBw9v
 rOoB1/73SftN9/YgBDpTn+AtjkfZqxz/NICOoqU4tKPjOW21dARbsKhbcKqAeOJ8SRzIJgPK
 5bAsxDNOE=
X-IronPort-AV: E=Sophos;i="5.97,221,1669093200"; 
   d="scan'208";a="92858993"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HdE9a+72Iz0FbI2rTGdcGZgc2Jjek/toJ78h2tt/8GIZzYoVnRei5pxeryE0xfJ8ocuItl7TLYIm8SG4oCdOC2jUME339cfpaVbr7dNapDXLaufLQ7O7rFV3zIJHCcpUOepd8uTPP1zQ7AM5HvUI2ZGCVdP1EBrYzJhPGq2g6rym1qaPc5Axqo5Syx6zpJ44aSzaGchPmpMgOTug/VhHIkKqj6lYC+/WL/WptGpXp1Z7BMAfjfTLLkp2tdOipTxFpA10XwIfvGXgPw8uP74P6mNVMQ6h2To/iasW6TJsaJDOJAYmIpkUTsIk+FJx/aeIgkeeY6UnNEpXVgmGRe088Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0N7OstpLjBMBTdgOCP8BX9f/j9u+I+kof1U/TrllB4=;
 b=c00ChRDzg+5WB4S1XgnQwHmzN+lc1S3ML8VtkEtmonk/0+lkbrgOCr1Lhxdi/64fudZEvR69MWZy3zHvmUrMOpsobxWADCUkZB2ug5uF9AA+LgQjRZkLjn+7ASSh1Jf5husySSQv3vrrLp9ucbBA+OhW/KsfDG2nli+7DE2hwvdp64v+/IULoy4ITbTs9fndlHoWNBCoUIoDgoL43sHvoBX3wHcSizWukHy0bLRr+6OdgL25A5PteCPP15OkGwdAOFnavWiopenOoWL547p6PGmbl+PRKWt3ZbV9ALOlMHDeBCsSrw6SZHXhNDcSnCZLRjwB6RzFz8vqXnh74fhXHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0N7OstpLjBMBTdgOCP8BX9f/j9u+I+kof1U/TrllB4=;
 b=EVnzuvunYATRsSXXFScKwl794mMDhowdm4k41OrccLTuvUtkEECrlgyI9oj3jpeDKvBMb4r7H1L/PQaAZjaHO8uDS8hs3DeLm/cDJKF5WgC8WRf3zZzIv+uPQW2B37BYWCYFhKXX3PPZM6CP1MO7kWcE61TcgV6Kp1YkKSysuZw=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Kevin Tian
	<kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 5/8] x86/hvm: Context switch MSR_PKRS
Thread-Topic: [PATCH v2 5/8] x86/hvm: Context switch MSR_PKRS
Thread-Index: AQHZJRefeExwWeppzE65VXS63DgRAq6axG6AgAA9twCABgijAA==
Date: Mon, 16 Jan 2023 13:00:18 +0000
Message-ID: <adf6f951-a0e5-c167-9739-d8b0a2b4af38@citrix.com>
References: <20230110171845.20542-1-andrew.cooper3@citrix.com>
 <20230110171845.20542-6-andrew.cooper3@citrix.com>
 <af2b74b2-8f37-223c-b830-c2bb3bc6d467@suse.com>
 <3ac6a4d6-44db-d248-4440-6e71aa14ad93@citrix.com>
In-Reply-To: <3ac6a4d6-44db-d248-4440-6e71aa14ad93@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6676:EE_
x-ms-office365-filtering-correlation-id: 46341846-5157-4ad6-aecc-08daf7c19eb7
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 2+jd2xmX+4BVjwbjEuJuH+F30zrW5l/tddirGi0RbpDIdbN2vn8TtpcSqsYfxd1g9r8M92f69Xdk6jXmZVfGEkFXtoQVqZOS1gZAhKS4/ajRyCTOPm6xFHyAZ5JRpkfX9O4IyDGNRKzdGxnYi/pr1JiaKcaomJG2c3VngPFaLKkcuMPGSPZCqUKCohifEtBWtIuUOBAFC1ot2NQ3SMdtRfAyFHC7VjhRghbF7terDMJcuczR3bRavjIphElsNZwxPg5fz+4lGurxtZx3pyjUioLhAXcXfL7dQewIzaIe6MRSKoBYiul1rHsjzoyUmHgaReI06yMf5sx3STw5Et1wQDXTy1s5q4lMDnXw7TWqAWleQ2blr/KjIcvjR9Y8poup6j057B/3c9n5Y25VmO7aDcnXHcmXmpzHZ/Qv/rM/l1PrPNZezHHUwOo0cztJUfhv92PYToCPpBFi8xgTsD1bPZ2bUXdxs62L9PHkxqH24heiSHkhV3NLZSXCtW47cKp83+d/OFaL+4YZ4wm7wfDvWgOyTvhqtoYWWR//AkkuQdGwuy9IOUObD1mHSpTxpNA4vSbECWCkR707OD+h2dBgvOWFUF/sI7IyQcInSGOeEycC1TClGOrawc3yJvWTekr19wZb7goiPa2T6XdaK/nyGp3dV+Ccw+1/BK4XEgXCJa53kKBpRht/iKKENTuou2Y6n6CTqk6Wn8D01g19a2kmIRGD7PrZHnO5PnEteBCbLK1OVNZwSdV2uTe14mKpUoeraoyMPchUr3gECeRSOCovgg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(366004)(346002)(376002)(396003)(451199015)(6512007)(186003)(53546011)(71200400001)(2906002)(26005)(66446008)(6486002)(478600001)(31686004)(6506007)(76116006)(8676002)(91956017)(2616005)(54906003)(6916009)(4326008)(316002)(83380400001)(41300700001)(66476007)(8936002)(36756003)(86362001)(66556008)(5660300002)(82960400001)(64756008)(66946007)(122000001)(31696002)(38070700005)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aEcyTW5YWEtFRCtybXBEampvR1JsTllJSStSaDhaZ21nVExvb2NwS0k5NmNC?=
 =?utf-8?B?T29SREpwZng1ck4wUHp4bjNmckRiREM1dWUrd1hvcGtMK21ZZjR4QU4ySUp0?=
 =?utf-8?B?VDY3MTUvUkhQZCt3SlJmNnJTUzZPd1J1K09KM29jM1l5SGNqRHpKelBCbkND?=
 =?utf-8?B?UTlBUnhYUXF5Wk15d1J3ME9SWWFvcklYRVZjbWY1T3QyUUVxZ3JodU9tU2I5?=
 =?utf-8?B?VGtHblBCMG9aQk90anFlRU9uNDNrOWN4VUZpSzRVeFJXZndYVDJBYnhQczhr?=
 =?utf-8?B?U2pRc2JUcGlRS0pKMUZwYS83VFVkTzVML21EVUR1cVJDQmdiTWEvNUw0WnQy?=
 =?utf-8?B?SSsybG1Sc1VMaVoyTHYva3VTWmZyUi9Gb290b0JTVVRnMVNWNkJ0RjZiVUN4?=
 =?utf-8?B?MWhqZkhGWkNiMWVWd2xETUhZMVF3eEVTWENEZDdSQ3lvbkpxd0pIWVY5cnRI?=
 =?utf-8?B?VFhqY3FqL1lOWTRudzJjQlNxTWUyZG5vYVZmTXZQVXhhZlRndy9kRkN1OGgz?=
 =?utf-8?B?MkRORVFlWGdPOGVSTS9laHp5UFdrY1VsTTkyK3hCekp3NkF2cDdScEZrVStp?=
 =?utf-8?B?aGpFa09uQmtFYjAyZEZBazFUQlBFcEdpN0lPeDBPODhheGFvdXJhUUFBNmFM?=
 =?utf-8?B?V3FBdVhZK2xKb1ZKZzArdStBeGpSYlkvQ1B6bmlkNlVzb2N0eGx1NVd4YTdn?=
 =?utf-8?B?dndVUnZNakZOVVloVlRzdkJqZ3J4eUVHckpxeks4dmhualpmTVExQzZsV0lD?=
 =?utf-8?B?eFNobHRMUzIwQ1NhL2hrTU9XUVF2c0VLOGdkZlhrVi81VERYRnFpYjJoZnNa?=
 =?utf-8?B?dXpSTEJKNmU3ZktFZmJ5TDFjbnlWL0h6dDB6ay9Va2FFV3dabVFFejFRSEpP?=
 =?utf-8?B?TUJ4MWRneFcvOEdqekp0dm1lL1ptSWd0K2YwZVFsR1NrZTVKY1hmVmp4VjM4?=
 =?utf-8?B?TXlCN3RmZTMvREs2TE1PaXVjNXlkdzNqcHNIbGtaQ0laQzlIZ25oWW9RcUht?=
 =?utf-8?B?RVBBSG9zei9NTXBrVERuK2xuZzViWWxBYkRCSHlYbys5NDloZm1KWnU3QnFv?=
 =?utf-8?B?K1lKakNOWDUvNlFnZUt6M3Jrby9Gc0REdG9Fd0hWZmlYRmdVRjBMNTJibkdM?=
 =?utf-8?B?Y3hFazYyR2dWckVHN3NsOTYyT002c1RwR3I4V3EwaTgzS05QM0ViSGw5MFFH?=
 =?utf-8?B?N1F6U0ovWlZRZ3RmUHh2WGpnT0E5VGxzNS9wQitxcHRLc0htcXc1SjFYZk5i?=
 =?utf-8?B?ck1raXp4dVcwTUU0WGZtbEc1cVJjM1diOE0rTUdudVFLWisxQTVCUEJ1cHRK?=
 =?utf-8?B?SVVPcDFhVEdFTDM2VHZGSDMzcUxxSEZlQkhtL2Q1UVU2d3BmQzRVWmtKSGdr?=
 =?utf-8?B?UUtZWlFlcEROMmFhRnpzWkx1MENEb3dJaVVUandva3U3WmQwYjNqOFBZZWlH?=
 =?utf-8?B?YXQ5bFpBRWNXeFRIVVlnLzdCSkJyeDRoY3lwYmZmVjNUT3RjRks0Zmg1eC9m?=
 =?utf-8?B?YU0wM25MQ0Uzdmd4YVJnQ3QrSEVKMHhjazhnT2ZIU1RDMGcwWjNad2VhdTlP?=
 =?utf-8?B?MCtOZlJZRFRhU01vOXdHZU9nSjRkZWhIYUs4ZmxRTXBTL0NMZ1FISHloczBQ?=
 =?utf-8?B?TkZTYUREL0FKd0tDL29kSUlZWXJYaHZjUHorZitYa1VzNzVzakdjdEJRUGR6?=
 =?utf-8?B?TkU0RDBzTU1Lb3EyczdiZlhWcVNaMk9GK280TWF0c3JOOUV0Q2pTZTFSWDdQ?=
 =?utf-8?B?RFdyNUZsVG55dHpuTnpQRlV3UG1PdXl4VDNqSE9GR2laVGJHSnZJWHhZUVVH?=
 =?utf-8?B?MkF4VVd3LzdjdG5ueFJnU3NhR203SkNXWDVFVWkxQjFxR1RQdDdNdmIyQWtn?=
 =?utf-8?B?ek5jS0lCbW13S0I5Uk5CYmcxWFgrd2pyN3A0Mm0xeDhHb3ZGRU9ZdUkyTDdL?=
 =?utf-8?B?QXJDVmM1SWgzb01kek1mUHlLbUdiZ2R6b0tEakVBOXg1a1NiVDVHaTZOY2hR?=
 =?utf-8?B?c1Q0RmJBMnh0bmVZUy9PR3lKUTdtL1EwTTNHLzNsRkIwd2ViM2xZbVJXVjV2?=
 =?utf-8?B?SkNIU2pYWDFJUmZqRkpMZTl2Ly9xRG9oem0rOUpFT2tKSHBiYlZnTDFSMzYy?=
 =?utf-8?Q?zGcGyDHNicBGaXA9nGVk3qiqc?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <092BBC0778ECA84E8E51BFAE988927E3@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cB6pg9IXRQQ+4OLMLAKF+djsCurg0DjkfVR3a25icRta8DqqafGWBwELooELwEGRc2hV7+2ZaewQ1GwexGoWFHrqgq+U/0KfOcKtX/tq4u6WApkKlJ7Tj4o/81RNElLZMqRL6EiWDb597TVhwcPODh5wIm74JOY/ay6RqXCjJ32GeskFrg2nEXcuSlJ5NpBC1RkqN5tx+Cx1NZMA80yUCQAhAOZAo9aJZV/JUDFJTzJNe5PLw6d+ZsdXZ596v1I8QuMg3OJFI36tmhTK77bL/fMa9vCG5DaX2/4jSWiRNMR4hQI1hRxA7k/UfQMA3wgHkxG60OPJt7MDk0QDepDOT96QgO1wogWobddFu6x1iLIbT6Bs71rvN6iTkQgtgW+qDUH3fs7fKEBse/qoQO72ULKFyAFiPD+p3hR9u4fn8EumADKpreJuEoYMIYi1vsRQhFI7rRF6+JepiINS03QU3w8BupfngdFCj+FtFC6ZAmrj/AVHKSieMcEJ1DRrPOqETbDk7V4BE/itBgizCLiaF+e1lZrrTzGumBedKD5xp3rZh36Jq+PZROHNgWaW0KTGKze1c7Lhg123e7EgiUW7qjmQOO9JMq4SHv+slUf/neTgpwKNpEuEQS+GO9/eD7oMCXojGEOj2yXMuleE5QBOIu4SIZeSvob8DS+cXXCtLP+5Bd8nn93toZeEVTi7Zr1oawPBj5JTsV7N8ZtYbSYtI5VnpfDw/mrD09D2x1gULi6zMtfi1Ol2OnqEKEjnpqILHKtGHhFTlyU5rWEPRvY/gQ4mKKkfVezIGxrWuhwIEOhyhe16bn+ZsRQ74kHd5BxJuk9YJKnmHRKdefMWQjsrK64C00RsXfXW4Xw6uylIZa4=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46341846-5157-4ad6-aecc-08daf7c19eb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2023 13:00:18.9464
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y9rrL8gbwkv/cNBrX7fiDA0tIiIfe58YM8EU8FVcnmFJWjRzl/Dzim1U6z0fvmCQ7YbJhadV5iZqwuge+STOT1l1pCAS8s2AgszbISMQy44=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6676

T24gMTIvMDEvMjAyMyA0OjUxIHBtLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPiBPbiAxMi8wMS8y
MDIzIDE6MTAgcG0sIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMTAuMDEuMjAyMyAxODoxOCwg
QW5kcmV3IENvb3BlciB3cm90ZToNCj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvc2V0dXAuYw0KPj4+
ICsrKyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jDQo+Pj4gQEAgLTU0LDYgKzU0LDcgQEANCj4+PiAg
I2luY2x1ZGUgPGFzbS9zcGVjX2N0cmwuaD4NCj4+PiAgI2luY2x1ZGUgPGFzbS9ndWVzdC5oPg0K
Pj4+ICAjaW5jbHVkZSA8YXNtL21pY3JvY29kZS5oPg0KPj4+ICsjaW5jbHVkZSA8YXNtL3Byb3Qt
a2V5Lmg+DQo+Pj4gICNpbmNsdWRlIDxhc20vcHYvZG9tYWluLmg+DQo+Pj4gIA0KPj4+ICAvKiBv
cHRfbm9zbXA6IElmIHRydWUsIHNlY29uZGFyeSBwcm9jZXNzb3JzIGFyZSBpZ25vcmVkLiAqLw0K
Pj4+IEBAIC0xODA0LDYgKzE4MDUsOSBAQCB2b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hl
bih1bnNpZ25lZCBsb25nIG1iaV9wKQ0KPj4+ICAgICAgaWYgKCBvcHRfaW52cGNpZCAmJiBjcHVf
aGFzX2ludnBjaWQgKQ0KPj4+ICAgICAgICAgIHVzZV9pbnZwY2lkID0gdHJ1ZTsNCj4+PiAgDQo+
Pj4gKyAgICBpZiAoIGNwdV9oYXNfcGtzICkNCj4+PiArICAgICAgICB3cnBrcnNfYW5kX2NhY2hl
KDApOyAvKiBNdXN0IGJlIGJlZm9yZSBzZXR0aW5nIENSNC5QS1MgKi8NCj4+IFNhbWUgcXVlc3Rp
b24gaGVyZSBhcyBmb3IgUEtSVSB3cnQgdGhlIEJTUCBkdXJpbmcgUzMgcmVzdW1lLg0KPiBJIGhh
ZCByZWFzb25lZCBub3QsIGJ1dCBpdCB0dXJucyBvdXQgdGhhdCBJJ20gd3JvbmcuDQo+DQo+IEl0
J3MgaW1wb3J0YW50IHRvIHJlc2V0IHRoZSBjYWNoZSBiYWNrIHRvIDAgaGVyZS7CoCAoSGFuZGxp
bmcgUEtSVSBpcw0KPiBkaWZmZXJlbnQgLSBJJ2xsIGZvbGxvdyB1cCBvbiB0aGUgb3RoZXIgZW1h
aWwuLikNCg0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9hY3BpL3Bvd2VyLmMgYi94ZW4vYXJj
aC94ODYvYWNwaS9wb3dlci5jDQppbmRleCBkMjMzMzUzOTFjNjcuLmRlOTMxN2U4YzU3MyAxMDA2
NDQNCi0tLSBhL3hlbi9hcmNoL3g4Ni9hY3BpL3Bvd2VyLmMNCisrKyBiL3hlbi9hcmNoL3g4Ni9h
Y3BpL3Bvd2VyLmMNCkBAIC0yOTksNiArMjk5LDEzIEBAIHN0YXRpYyBpbnQgZW50ZXJfc3RhdGUo
dTMyIHN0YXRlKQ0KwqANCsKgwqDCoMKgIHVwZGF0ZV9tY3Vfb3B0X2N0cmwoKTsNCsKgDQorwqDC
oMKgIC8qDQorwqDCoMKgwqAgKiBTaG91bGQgYmUgYmVmb3JlIHJlc3RvcmluZyBDUjQsIGJ1dCB0
aGF0IGlzIGVhcmxpZXIgaW4gYXNtLsKgIFdlDQpyZWx5IG9uDQorwqDCoMKgwqAgKiBNU1JfUEtS
UyBhY3R1YWxseSBiZWluZyAwIG91dCBvZiBTMyByZXN1bWUuDQorwqDCoMKgwqAgKi8NCivCoMKg
wqAgaWYgKCBjcHVfaGFzX3BrcyApDQorwqDCoMKgwqDCoMKgwqAgd3Jwa3JzX2FuZF9jYWNoZSgw
KTsNCisNCsKgwqDCoMKgIC8qIChyZSlpbml0aWFsaXNlIFNZU0NBTEwvU1lTRU5URVIgc3RhdGUs
IGFtb25nc3Qgb3RoZXIgdGhpbmdzLiAqLw0KwqDCoMKgwqAgcGVyY3B1X3RyYXBzX2luaXQoKTsN
CsKgDQoNCkkndmUgZm9sZGVkIHRoaXMgaHVuaywgdG8gc29ydCBvdXQgdGhlIFMzIHJlc3VtZSBw
YXRoLg0KDQpBcyBpdHMgdGhlIGZpbmFsIGh1bmsgYmVmb3JlIHRoZSBlbnRpcmUgc2VyaWVzIGNh
biBiZSBjb21taXR0ZWQsIEkNCnNoYW4ndCBib3RoZXIgc2VuZGluZyBhIHYzIGp1c3QgZm9yIHRo
aXMuDQoNCn5BbmRyZXcNCg==

