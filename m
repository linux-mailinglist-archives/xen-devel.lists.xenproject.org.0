Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA4A59A67A
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 21:33:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390424.627829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oP7jm-0002yV-Cc; Fri, 19 Aug 2022 19:32:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390424.627829; Fri, 19 Aug 2022 19:32:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oP7jm-0002vj-9H; Fri, 19 Aug 2022 19:32:58 +0000
Received: by outflank-mailman (input) for mailman id 390424;
 Fri, 19 Aug 2022 19:32:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+VY5=YX=citrix.com=prvs=223478740=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1oP7jk-0002vd-Py
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 19:32:57 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b72c8b08-1ff5-11ed-bd2e-47488cf2e6aa;
 Fri, 19 Aug 2022 21:32:53 +0200 (CEST)
Received: from mail-co1nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Aug 2022 15:32:50 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by DM4PR03MB6205.namprd03.prod.outlook.com (2603:10b6:5:398::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Fri, 19 Aug
 2022 19:32:47 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::3598:8b03:ecc7:4828]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::3598:8b03:ecc7:4828%3]) with mapi id 15.20.5546.018; Fri, 19 Aug 2022
 19:32:47 +0000
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
X-Inumbo-ID: b72c8b08-1ff5-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660937573;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=QkO4ZN42WAS1HVRHbCRklJJB9tg/tmp99MHc7jUNzNA=;
  b=W6f2hXbYsIaeV+BEsEFK1CjAxbPbxYfQCvEgh2MPtqMeo8VNoNQKiLDo
   xV4KqVUTrgxx/tfs2zcP6xxdeQdBYNY9K7UtUxazT5zSRP1jW2ZKeuxsg
   j58J+QJ2DMA1P4A/zfNHBiP4qgq+5NlLL3xwFYISUkBI62hhTz7scQ0ds
   Q=;
X-IronPort-RemoteIP: 104.47.56.169
X-IronPort-MID: 78941819
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:sNr/Lq2CMN2zWT6yPPbD5VFwkn2cJEfYwER7XKvMYbSIYQITYwd3j
 TtIBzjCf73ffDO2KOnCW/20o0wPsMLVzIRgGQRq+Hg2QysUpMOYD4zGIh6pbnzDfpyTE0425
 ZxCMYacIspsFyfQ/Rv2ara+oCR126zSSLHwYAKo1lidYCc9IMt2oU4zy4bV+7JVvOVVIz9hm
 Pv5qZfSYVX1gWQvY24e5/nepUs37Kv7tm9D4VVlPKAX7Q6CmyEZAqxEKPDqJRMUYGX18s1W5
 Qrn5Ovklo8M1051UrtJqp6iLgtQBOa60TGm0hJ+Q7KljgVJuhs826M6MOt0QUpMgnCCkssZJ
 O9l7PRcci90ePyX8Aghe0MASXsmbfQXoOavzUWX6qR/8WWXKxMA/N02ZK0GFdVw0vp6B2hI6
 csZJFglBvxUr7vrqF4TYrAEavULdKEHDqtG0p1T5Wix4cIdaYLCW833Cepwh1/csCzs8cH2P
 KL1YRI3BPjJjoYm1l0/UPrSl8/w7pXznqExRPt4asPb7kCKpDGd3oQBP/L3U8SVV/V4xn/fv
 3PF5GnQHAkbDe62nG/tHnKE3ocjnAvdcadLTfiT0acvh1eegGsOFBcRSF235+GjjVKzUM5eL
 EpS/Tcyqa819wqgSdyVsx+Q+SbY+EJDHYcOVbRkuWlhyYKNi+qdLkcJSSROZZoKqckyTCQC3
 V6VhdL5QzdotdV5TFrCpubI9GPraED5K0cHazNVFAUu+eL444oRnhGXU9RKNJCq24id9TbYh
 mriQDIFr74UiMsKy7m250vvkz+qvoLOTAM++kPQRG3NxhN0YsupapKl7XDf7O1cN8CJQ1+Zp
 n8GlsOCqucUAvmweDelRewMGPSi4K+DOTiF2Fp3RcB/pnKq5mKpep1W7HdmPkB1P80YeDjvJ
 kjOpQdW45wVN3yvBUNqX7+M5w0R5fCIPbzYujr8N7KivrAZmNe7wRxT
IronPort-HdrOrdr: A9a23:7GXiEagw2lIRg8/pflMj7D8ywnBQX2B13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQZVpQRvnhP1ICPoqTM+ftWjdySOVxeRZgbcKrAeQfBEWmtQ96U
 4CSdk0NDSTNykdsS+S2mDRfLgdKbK8gcKVbJLlvhNQpHZRGsRdBmlCajqzIwlTfk1rFJA5HJ
 2T6o5svDy7Y0kaacy9Gz0sQ/XDj8ejruOqXTc2QzocrCWehzKh77D3VzKC2A0Fbj9JybA+tU
 DYjg3C4Lm5uf3T8G6R64aT1eUYpDLS8KoDOCW+sLlUFtwqsHfqWG1VYczNgNnympDs1L9lqq
 iIn/5qBbUJ15qYRBDOnfKq4Xir7N9m0Q6f9XaIxXTkusD3XzQ8Fo5Igp9YaALQ7w46sMh7y7
 8j5RPvi3LGZSmw4RgVyuK4Ii2CrHDE1UYKgKoWlThSQIEeYLheocgW+15UCo4JGGb/5Jo8GO
 djAcnA7LIOGGnqJkzxry1q2pihT34zFhCJTgwLvdGUySFfmDR8w1EDzMISk38c/NY2SoVC5e
 7DLqN0/Ys+OPM+fOZ4HqMMUMG3AmvCTVbFN3+TO03uEOUdN3fEu/fMkccIDSGRCe81JbcJ6e
 r8uQljxBEPkmrVeLyz9YwO9AzRS2OgWjmowt1C5vFCy83BeIY=
X-IronPort-AV: E=Sophos;i="5.93,248,1654574400"; 
   d="asc'?scan'208";a="78941819"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K0A/jhet8DFygi1E3d78cMoPKoGBkOx6Ff15VJfZRG3fJLEnq8EZ49MQScT9Scvh5iRNWlMUHAp3zleIjO1m0J9zM+MXfz9/lRcU3Yvpt7fAijHxDXplwLrZlUtEjshhsXKOXjtpUvHYlrKQJ0SsaRiBjIN4bPCeRErq517AjbG1OzCTBr4+5xWMTirJeg8jUKN3zIcbOPWw0ZPw/3v4mtayS9R4mSYIcWNiGDqWJ2DSLRzDKqBMLq0997FiwGqQexCRpEPN73uNwe4XeJSIPqwbyLxofF36/yjm1UNJaeMT8ae4IuYNKKV+o3Gk4SdvIRKlELhlWp+MF/b/n6g5fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8QbGd7u9lmRdS9/+A23Iq1T6TJcBdWrK0JwW2r+tGQw=;
 b=FPWchd2mvc/JXWAGEks8QXGa98KL43JXy8Q5xjg8cTbbO9L6EmX0ztFUuviknTePhJximIVqORfEC5y8ZMoBTriuciWiDDTd1YJVUL4b01hrg0f2Glg/VvV58TI+Tj/eymOtDNI229zCI6h2y7eFW1ZsbQ3NgV6bzbahWS+OO4KrUzYZJ2EczJ/+HnE9Cg/q7dFsQYVmy8WCKiDQ5/4eKXsSTwKrM61SKwqunKifqidgFqcRC61KP8hFGMd0F1Zd4Jd2vI7HkjWwukDq15U0HsUUS7pg5QYE6kuIWXS8RqMnB4IAbnOYrCEXebTN6HYVpq7q00QRJYkZcr+TZ/L97g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8QbGd7u9lmRdS9/+A23Iq1T6TJcBdWrK0JwW2r+tGQw=;
 b=WI3vTRsH1ZnVnOd7dQR8DXgxa72MNm87zyrra63RIiDg38ZxwqLsEgn7klaJweLKVF4Ff6WpkpQwoxYmvVDl17MyOeQZ2uE3UfVyJ8vtuQlHP2Xi8V4p3QYZcJjkXRVaD++SXwnb34mW6/hlMTz0+DwtTuYWW1F3ckJ/42BaeeU=
From: George Dunlap <George.Dunlap@citrix.com>
To: "committers@xenproject.org" <committers@xenproject.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Revert-and-reapply due to unwanted tag
Thread-Topic: Revert-and-reapply due to unwanted tag
Thread-Index: AQHYtAJ1/K8NODo0rUCxwE9WM12NDw==
Date: Fri, 19 Aug 2022 19:32:46 +0000
Message-ID: <0DA486FD-90FD-4CD3-BF6C-88472C8DD297@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82a61ff0-82a1-4702-df0f-08da82199876
x-ms-traffictypediagnostic: DM4PR03MB6205:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 DuyFrPTA/BFZVHxRO3lMVQDPzXvmR6bsUjCvF0YwMqCVraAAs4StLh7VJJYuj+zLN7iXllcWauZna3UT0niF0+5HyEjNQ3U8n/ddiUZ5lCk2TNCDykIHpZoLu51P+jtqCWD6ZualFUjv1fQRT9v5WlkA5qC6HMpiJ3+qjFTBbPsjbk9mQJKuck2yiG0rDXHYr5tlbHncXsg7bYGNPkg86O2kQC4iKs38iEL+jOyVLXhpg2XA5ghLAvcf/pYt0/SGHrh6xwMSR6v/2ZsmwRjpF78H8rZgDWBgVAWiIorsAAJiL6RHY0ucv/bZqHo7YqR+A65Q8kbdQ8Iug7GDjNjNO96QQOTOBXwSLGHGT2m1xU4h7DSTZly5w8VHraKXMQu1gKv6qhXdk8Uu+ah/8zuoAZnCXhx5e2JAocKWpYBRXp0QfC7zDvfx3F6Q814Q1nXlpbiN5e1Tkk4IBlPBw6Phvohgu+njynK+/b8F6RVx1EHv1vu+ATD0+NRoFQ5SGhmwh2W/FdFnhrqgL5m+EveTCaQFbrVncV8C6AswwyWpsYVKcMWZ/9M9SHPr2ErbeaI4TuLUFU4zElJM+quxm6TSzoM3Yh0adkoHS7Sn98/+xmnnYCz5yov9C/XLEmCQ7m8+L2HDU+EMLEmSBV1xk59sTmiqNJYMSvnBoZ6SAbpNYmZdBi/wp+n1xAdc2r7rNQG4DHps/GYdR4BELm8jTPbRSWwEPu/S0gOkfQEB3qNtWtTkn1GwuCh3O12BCkymVu875ixM9Sm4LKsu7ng4ixY+9nDkMdl7cwq+pclr9QQ8V5eABI2HOW42ZVHVaHYdTJwZ1/hyJwScpuaO6PTcxD0gaA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(396003)(366004)(376002)(136003)(186003)(2616005)(6512007)(99936003)(26005)(122000001)(38100700002)(4744005)(5660300002)(8936002)(6506007)(66556008)(4326008)(66946007)(76116006)(66476007)(66446008)(64756008)(8676002)(2906002)(478600001)(86362001)(6486002)(71200400001)(41300700001)(82960400001)(91956017)(316002)(36756003)(33656002)(38070700005)(6916009)(26123001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NU91NUxpdndEMU1nbi9ha0F6TlRyNnQwbkpibU9HSGIrQk9kWFpEMG5UMjN3?=
 =?utf-8?B?cENIaHJ3NFIzU0x3WmN5emtEajhqZ2dhY0ZwbFBDdVF2SGtzVUVhcjRYNnpH?=
 =?utf-8?B?SGtMejJWeUE4QjFTZm1FWDBkNlpsVkJaZkg3aTIzNTVDK3g3QWJ4MVh0VGk3?=
 =?utf-8?B?RnVCSkpmYnZ0RDZPemNyWHR0YkhuRXk3c2w0ZlliV3BFV1pvS2N1SGRZa2ZL?=
 =?utf-8?B?WVo4OUFYSGtBVVJrVEJIZzYyNEw2a3paRWt1TllNcnVkWGw0WEl2SEhrV3ph?=
 =?utf-8?B?RjRxckhNci90cTcvdnFCYzZOTlE0anZwaXpRSW5adzgwNGJJNHY4aHk2R0VI?=
 =?utf-8?B?UTlscjNBOGh3Z2ZrQ3VuZTdvandTb0dYRjNnWVpCaDJnUHNYb1gveUt3QUhH?=
 =?utf-8?B?NVU0SzVFeDRnUnZKTm1VckFzNzBjdWhhUUpTSGlnbVJrZmM1amdpU25nZnFI?=
 =?utf-8?B?RDdqeUpKaFFPOXQvNmNqaUhzOTJmeWEwczVsQ2ZTbzBYRVpxb1BLNzZwelVW?=
 =?utf-8?B?ZGQvczdiQzEybXNXSGlzRjBuZXpxdFd4SG9GQ1FQeDg1SGtWMWVheDR5VmRy?=
 =?utf-8?B?MThqdTRpRnQyMFNPZzZCZHZRR1J1UUFjUWNRZHBwNzg2OEQvOXpmM3NhQkZC?=
 =?utf-8?B?T1hxajhQZEdWUU44M3luMFFZK3ByeWpFOFpmc2xSUitTbXZEalJuNzFYdGFC?=
 =?utf-8?B?RVlYQXVOdHpUdnNYN3BJOVBCVFliTHFVa1d6SVRKVTVyczBvWEVYa2EwZDFD?=
 =?utf-8?B?WlI0ek5NWFN2OWZRT0tBZ2hic1BwLzFocUZ5SVhYZjRmN2R3bGRUc00zOXlW?=
 =?utf-8?B?eklmSlpxNGNySTJjcXh6bjB2elE3TWtCbndzNmlscXRmcklCS1pxSmx3RVNl?=
 =?utf-8?B?QUpoMXl2ME9IMFR4SHR3Smc1YW1hb2l1Ujc5SUxLcDErbGFyZHhnY2ZaNDd4?=
 =?utf-8?B?MmtVM1lVRVlhak5GV1dlUGNXZUhmcFNLWm55YVN2SVJQa3dxZW80NXJmemhY?=
 =?utf-8?B?QTloNzh0bVh5ZjNtNXhtR1Jxc0Z4c0JGV1ViMUEwSm05eVRxL1RCdmpzcVdE?=
 =?utf-8?B?aGh6TjVtd3hSUVgwWGZZWXUrQUdGZW1BZUpyQXhjekM2WHBPTGFkZXU4V0NK?=
 =?utf-8?B?L3FpaWcxSnhYcWNobXdnU1IzMmlnRlhDaURCWXcvRndHMVE1S3RCcDJnRE1V?=
 =?utf-8?B?VEhqTElmTXdKeUNBd1NpejNGV2ZsaHBsWEwycnI1ejBnOWZyUWppa2JJYy92?=
 =?utf-8?B?UHI5Q1dPTWVRN0NqQVFubFZjSUd0UHY1WUZRUEZwYmtyY3NKYmFLVkQ1Tlh0?=
 =?utf-8?B?SllzRks0dmJ5VGxvRUcvaUZseHludkRoSStMQktSRUp2TFE5VVJCVkx2dGFG?=
 =?utf-8?B?VWRDZHBMa2ptdFVObDRXbzBzeWZsVkNQOEtWVk1icWlYbDRkM3dMWVRIbWIw?=
 =?utf-8?B?TEQ1S294aWRxWnp1QTFJeHJaekkyeko0L3pqOFFqWHM4eTB2K1BZMkJYREc3?=
 =?utf-8?B?TkZqL2tYODBEYjZLTUo4ckE1RHJQbjBJdzdhd3BuanRYNVVJaG9OVGQzUFRN?=
 =?utf-8?B?OW9tRmVJWlVydVI5SS9xL0dzdkl3K0VSdDlmS1g4WERCQXo4T0hYQ1FnWTdv?=
 =?utf-8?B?RzJ0VEFmU1N2L2Y3dFRQZWhwWnFuQWpzMjlNeWdyMHlBMXRMa2JtNlhnZEpp?=
 =?utf-8?B?cGNpc3F6RU91eHU5L3lIK0V5eW9obXBqMm40bENsdDJCSHA3UVJnR3l6bEFq?=
 =?utf-8?B?dXNPc01hV2hMd0Z5OTdXT3gyUjR2L04vL2VsU3pYR1pVWXZWOTJlSndpQmJi?=
 =?utf-8?B?c25jU0VTYlVVemlIT2t1ZlgrWkxMbFZGYTJmTlAxb1orMHFPU2VjK2VGelhy?=
 =?utf-8?B?Y3cvcVF0ZTJySXVBZFZFTTVFZlFhOG9UM3hqM0k0OUlEcExic1I4YW00TWtu?=
 =?utf-8?B?Y1k3Tk5tWi9Oc0Q5YVFJL1U5UTlvVVBmRjRrNmFqZ1JaUXQxUllTdFpnNjJD?=
 =?utf-8?B?VFJLVkZDWFRxRkFDUkFoMHJqT2hVczBaK20zKzZjK3JPWFdYdHdNbFd4NWhl?=
 =?utf-8?B?Mlc1QkdZeEdrek1nQ080bnNDQnlqMEUxQlB0amU5N3RteUNpUy90WnFhQVUx?=
 =?utf-8?B?RS9ldE9wMm9hZzRFblJPWjdpenVldHRnSnhZcm9mYmVRaGFjeWQ2bGpHZVZX?=
 =?utf-8?B?eWc9PQ==?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_5DE67095-8A7B-4287-9974-F1B1626AE26C";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a61ff0-82a1-4702-df0f-08da82199876
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2022 19:32:46.9442
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4CPEfEDGxhpISGo68CZMXNCrHBPI/vSoDmoWOp1k9aciwHRtfmhLu/zuJkmiMD5Ftmd5Y71gfsGypOMsi4kou5moTsnGBSUcJ1vMvNo92oY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6205

--Apple-Mail=_5DE67095-8A7B-4287-9974-F1B1626AE26C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hello all,

It=E2=80=99s come to my attention that the commits below are tagged as =
=E2=80=9CSuggested-by=E2=80=9D someone, and that person doesn=E2=80=99t =
believe the tag to be accurate.  Having talked to most of the other =
committers, we decided to revert the commits and re-apply them with the =
offending tag removed; this will make it clear to anyone doing a =E2=80=9C=
git blame=E2=80=9D who not to blame.

This does open the question about unwanted / disputed tags in general; =
we can have a discussion about an official policy on it at some point.

Thanks,
 -George


646589ac148a2ff6bb222a6081b4d7b13ee468c0 amd/msr: implement =
VIRT_SPEC_CTRL for HVM guests using legacy SSBD
a2eeaa6906101fbf322766f37f8f061dd36fe58d amd/msr: allow passthrough of =
VIRT_SPEC_CTRL for HVM guests
ebaaa72ee080c8774b1df5783220d4811159c327 amd/msr: implement =
VIRT_SPEC_CTRL for HVM guests on top of SPEC_CTRL

--Apple-Mail=_5DE67095-8A7B-4287-9974-F1B1626AE26C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmL/5VgACgkQshXHp8eE
G+1MgQf+KtVEa16+FQYUMKALC5Y9E3SvhE9mQV6XcJ7FKStG+w2VnD7ZFJM4kWhh
1rcfBSgBctSKayWpARyojNZ6ksVkHCg5IAD/ETRFRc1YjvIGEeO8fonIlyvmCZ18
4f6x1EVta7j3Ze/hxgZyLqitPt12flGlDC3WGw/mETo0L9Jz54AkVO6pi3TiXoRA
dikZymRWb6ad4aQ9niAOXMlz1uXCgxQvBmjKM65Tfhxm4sahIWiF5HTw9dgrOVux
Uea4nk+y4q15ORp89YCaDVWiShpqN1+bFa9dxKdVIYx6pnmV+TzVgWoY03cWuyjp
2LRWC7V/POP+q/ZdQm5HbmlJKJeUTA==
=F1t/
-----END PGP SIGNATURE-----

--Apple-Mail=_5DE67095-8A7B-4287-9974-F1B1626AE26C--

