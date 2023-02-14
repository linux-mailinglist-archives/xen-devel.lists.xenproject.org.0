Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F40696279
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 12:28:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495146.765420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRtTm-0003Ax-47; Tue, 14 Feb 2023 11:28:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495146.765420; Tue, 14 Feb 2023 11:28:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRtTm-00038T-1K; Tue, 14 Feb 2023 11:28:10 +0000
Received: by outflank-mailman (input) for mailman id 495146;
 Tue, 14 Feb 2023 11:28:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qjes=6K=citrix.com=prvs=402b5c463=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1pRtTk-00038N-R0
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 11:28:08 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5f41e37-ac5a-11ed-933c-83870f6b2ba8;
 Tue, 14 Feb 2023 12:28:07 +0100 (CET)
Received: from mail-bn7nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Feb 2023 06:28:03 -0500
Received: from DM6PR03MB5372.namprd03.prod.outlook.com (2603:10b6:5:24f::15)
 by DS7PR03MB5527.namprd03.prod.outlook.com (2603:10b6:5:2cd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 11:28:01 +0000
Received: from DM6PR03MB5372.namprd03.prod.outlook.com
 ([fe80::acc3:67c:60ef:bf99]) by DM6PR03MB5372.namprd03.prod.outlook.com
 ([fe80::acc3:67c:60ef:bf99%7]) with mapi id 15.20.6086.026; Tue, 14 Feb 2023
 11:28:01 +0000
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
X-Inumbo-ID: a5f41e37-ac5a-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676374087;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ShFv9QsQJY1x51FVPYPXi4rVP16k7PU+/005ZkL4UlE=;
  b=S4WplOhAqvh6chscBQ6h0tY83GjQt3KpGbMjMSOjYh70WPX48xiJdfsW
   1wxm4u4MwhMFy0x5q6k3aS4DM9EJd4KtAh6iVlocmeDbLjCsv6Q7bkT7w
   x9h9OFxYsADePRp5TYfr/0nx4SOvB/ukzxRaH4hyyBo2Pj9obFVUHdzV2
   8=;
X-IronPort-RemoteIP: 104.47.70.109
X-IronPort-MID: 96352269
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:E0cg56gyEWwyqMgvDgshUdLWX161vREKZh0ujC45NGQN5FlHY01je
 htvXz2GPv2ONmTyKNwnaom+pkNV7ZWHnNRkGQFlqyhgRSkb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWt0N8klgZmP6sT5gaCzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQWMygTSzvfutj175iDWPc2oZ4/Jo7CadZ3VnFIlVk1DN4AaLWaG+Dgw4Ad2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilMpluG1YbI5efTTLSlRtlyfv
 XmA+232DwsFPdib4TGE7mitlqnEmiaTtIc6RePjq6Qw3gz7Kmo7Cj5JdQqh4uGFug2CZc9bI
 BVX5hAwov1nnKCsZpynN/Gim1aBpQIGUsFNFcUz7QifzayS6AGcbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8hSm7ISgTLGkNTSYBRBkC5Z/op4Rbph7IQ9xuFIa8i9TnHje2z
 z3ihC0mgLUXhMUI/6y+9ELAhXSgq/D0ohUd4wzWWiev6Fx/bYv8P4iwswGDvLBHMZqTSUSHs
 D4cgc+C4esSDJaL0iuQXOEKG7Lv7PGAWNHBvWNS81Aa32zF0xaekUp4uVmS+G8B3h44RALU
IronPort-HdrOrdr: A9a23:mBfvoKGaoZzozXmKpLqE0seALOsnbusQ8zAXPiFKOH9om6mj/P
 xG88526faZslkssRIb+exoWpPvfZq0z/cci+Qs1NyZPTUO1lHYS71K3M/PxCDhBj271sM179
 YHT0GmMqyUMbGtt7ef3OASKadD/OW6
X-IronPort-AV: E=Sophos;i="5.97,296,1669093200"; 
   d="scan'208";a="96352269"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jN++LbqUfjTuKXBF1DtTlh0r+vfXnpWFyQhu5F8DKWXPQ1hR317gk9guoCeutsEj+m21nwfystmZuud4ROW5reirQZ+v+xJoxIIiHgLE57+xSElVMIHPKYVBB8tQrUcVPCD8iO7jWEd8758VnhP0wl2bA9WeKEsVEOlQ5Mu/GpYkmgfh3HSvRfGKDvpoyLBPJbtKiOCYS+gQRZyrj/FIu+KfwdbHfyL3RyAY/+CUXY7KN8O1yDamU0OQeqng0PHCyJynsFNCl5xRw5cNuNuq4arPpsKMKp8fu4z7ENWaEe1oaxNF+k56Uv/yBEmJgAQ6UTcD+213+y1GKTVAVboj3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShFv9QsQJY1x51FVPYPXi4rVP16k7PU+/005ZkL4UlE=;
 b=GvGSDy4L/5KbkOinerZ+1gPI+ZZzUl/n5bnwQqqztLGaDbdoduO09cB1aDwBqoxQ+UzknJ9+gs7b/0hkVde+45njI3aWpaUX/n4Vw4tQnqvz/2Hs8LS5+iqfe3rKeiHVyJC6uGO0H0FQv5LSgJgLWpgp3FEVNSWBbWatXAkz+RbypNuLu/BJUIHWFUm6vH2XtMftPIyVCGD+ilsCpa0WXybUROotmrMbkvHVo284nhvCZd7yThqB1vgbHeNUtY9Nm+FeluMMzYtNM/ntMSZzTXctf/a6Y28G/xWgJ97eQ4iV6pZxtCfAFSvKrNT7AsoW4yvtCMyUbFZ06GI/6Wm1YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ShFv9QsQJY1x51FVPYPXi4rVP16k7PU+/005ZkL4UlE=;
 b=okB1n87rvQgeHXOih/ATTv0VPmdld2o0bDZIRhGkrNb9QlU9NBMC9n+0JcPr0DoTxOMISQ+a7VEAwQ2AUdzMk0T+k6+Vti1jHx0kb/IJ+MvF2W8FionAYFNGNi0obLBnOE4onqrJvn+jcfoPMZnAf7VeaDF2MQ9KCA9hXUNGeT4=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Mihails Strasuns <mstrasun@amazon.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Raphael Ning <raphning@amazon.com>, Bjoern Doebel <doebel@amazon.de>,
	Martin Pohlack <mpohlack@amazon.de>
Subject: Re: [PATCH v1 2/4] livepatch-build: Allow a patch to introduce new
 subdirs
Thread-Topic: [PATCH v1 2/4] livepatch-build: Allow a patch to introduce new
 subdirs
Thread-Index: AQHZK+7hAAtdeJjC5UKkOXFz/lMuKq7OdpQl
Date: Tue, 14 Feb 2023 11:28:01 +0000
Message-ID:
 <DM6PR03MB5372CC7D52B9E47A8A4A304DF0A29@DM6PR03MB5372.namprd03.prod.outlook.com>
References: <cover.1673623880.git.mstrasun@amazon.com>
 <472bfbf92aba6d3409b2a101798f04a50c97f6e9.1673623880.git.mstrasun@amazon.com>
In-Reply-To:
 <472bfbf92aba6d3409b2a101798f04a50c97f6e9.1673623880.git.mstrasun@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB5372:EE_|DS7PR03MB5527:EE_
x-ms-office365-filtering-correlation-id: bbd4127f-921e-42e0-2115-08db0e7e87d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 PmX6fy9sGxDIs8a8ByQpHq+KVQOImxXYAbNCwcOT/t7/V3do74VdqljsyPo424tfg3pBG5wt7E9ue4+wQJZI0gMphG1q/i7oLuvAy7SCe4JOa25nE5PKzlDZhAQCBU9esOtQ3+i1uixc9zFNbzNT+EVXldsHn+XmPMoXTV76LSJX3Zlt2tXpeFrWUkct8kMGGbfKb0C+6ASkJ+ArsNHAxTk0pKjtOyBETtlueXWaTkUNYMHcoRDjv/zIr1D/aPwCzWCkwMrYxr+w0yCmeQzH2MhkMnLPd0raBbQXPqg5nEOlbIFKIGziA6kvJvVxX5jfY7fDI2n5gDpZy6VdwKeQC96dBk7XgbAyymvgshJfU/W9cE51FZd8sV0ia4ZcGenD8mZjx7HHp52UMNEXQxLdGyMaKsEUacLSkDGtT7eu/cj/LKl7R0RDVJODHUuwa37/EPQHbr0I1s0rN4RxhddjoeaJuvCIe/1MrJLhe85uV03O1GRrHzAXjohxskeMbL0GEd9YpUUpQebf4a6C/27Fqm8Xp3ucLZVLKLucesCRenmR6CKzIEEQECjfsET0V5pYmVMXbDdqn3T1BS7Zx/L3E57yNie1d3bVke5Q2kwe4DRgSn/p47SpfZpcWfIF7WjJLXGqCJe87WQmwDtbECpp6VadeesN6EUnlrXRf4MmxCSmvoIpoynMoQLTQXTRot49mk8+B+Is3dHe+otl3ssHzw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5372.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(451199018)(82960400001)(91956017)(66946007)(38100700002)(76116006)(66476007)(33656002)(5660300002)(478600001)(41300700001)(38070700005)(7696005)(55016003)(71200400001)(8936002)(4326008)(8676002)(66556008)(64756008)(52536014)(2906002)(110136005)(54906003)(66446008)(316002)(26005)(9686003)(86362001)(186003)(53546011)(122000001)(6506007)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?zbJD5V2P1yfEW/XG5qQHJOpKz5ZTbKV8wo8ltpbPWnWFft/JRuFrMS+KaQ?=
 =?iso-8859-1?Q?94werIo28q6SrPrZseP9szJK8HLhzuKTP8mvcoBg88+VYIDGIHcyFJlkSd?=
 =?iso-8859-1?Q?nSkfrXzzOt0nE1UkhGhTBd1XG+SgT2ALl30X5QNlMs0nNRnv3BA5mczCC7?=
 =?iso-8859-1?Q?3F+CTj0uUxMFpCy4tT1PF2RuLsL9pEjknxT0y2L5a1mHUTTgG9Lkln2I2Z?=
 =?iso-8859-1?Q?tPhBAzRMSDjN4sNWYlpEV+pjbaP9xl0Flnp2NREtPWj1NfnL+urzYokm21?=
 =?iso-8859-1?Q?H/DlY6Ucd/lXBCF7VO9oiCmt2M+jnDHtnN6Sz/N3wm97PB23wECPe7kTK9?=
 =?iso-8859-1?Q?vAajvDeZSymt5bt33NAsCJExurGM2vrTsq5cl87upo3huJHb7GU/4cTzOl?=
 =?iso-8859-1?Q?BgQ0sMBWOT7Z9F7b6vTm9SHBnqoYiZ5Z5S0l4RrTcFuEyS+ee8LuUblGHh?=
 =?iso-8859-1?Q?gR/A0HmC28ZbgVkyFfYUdyD9QArfgluZBj1FqORvqqLBTe4I8smuE2+B7o?=
 =?iso-8859-1?Q?HrFkQDSxcMIONTtWXYNzOJquH9Z1Q3m0s4tff+vXomP5QAXE5IuP5bZ54A?=
 =?iso-8859-1?Q?snVo8s1wo6ABhV53cKSHU92gD22iVpnQ2Ug5q0BIUcVppu18YyzTN63YfF?=
 =?iso-8859-1?Q?g3ujisNXE/Rwe0+5VhzHoahc67kwcOeBWK/sz23SfLskXQrwBFrrlbPHPw?=
 =?iso-8859-1?Q?zrzoU21jII2hvw5Y+gFoTwv/yplqABGGXoCeHFZsS6oYh2e4HF01MzzQDR?=
 =?iso-8859-1?Q?KmozlSQ39S+7mUBiAyuVwmPL3caWBFrsj+MbTK2mZ8RYzLvGeIjCFOBFFQ?=
 =?iso-8859-1?Q?2jq9ubZ3bxrpyZp9xewdOXMsrLrYFlvB6FpIYJOAbV9iKJlb9lqdgIxUG2?=
 =?iso-8859-1?Q?SZjUJsuquOBDggJ78BXrwhq48Ur/u6FZVjvbT3VzuttsmFmgPR+YDUnGwz?=
 =?iso-8859-1?Q?ttNz6Crop3T9CCvfBH+PxeRA/11UWZEotsoh0MXHjzTg2lw0QPxKp5XFND?=
 =?iso-8859-1?Q?Rnl22X5CBAaida+xiRxvEU4/jfFjHSXqtFRDwS946McmfTMsSol2Wam3jF?=
 =?iso-8859-1?Q?kaSdNNyk4K+2MDUG2XR4di8NZ8vU8eXWnMsHZwlmQTUGqQGB3yaqiqOPAH?=
 =?iso-8859-1?Q?6CjtaJb+68oP7eUY1Iw+1LIT4r58TkUHUo47w2gVqvFQNKIahmbiOHk0gJ?=
 =?iso-8859-1?Q?rnQ9EQZ8aNXykYg4jzx1yWUG6g7U7JQdf4xaugPlpnUkGCQZWOxtPWNTLD?=
 =?iso-8859-1?Q?yQYg5EhD+HyjkLwp7Hgb1jh5pMhKsE7Z8YpMe2vwSDm6iI4sjrmzJ4UKay?=
 =?iso-8859-1?Q?gjKBquFz581VK6EQEqwFHUrgD75A+3tn8twto/JAx4sE9MQaSkzJZwf4Tz?=
 =?iso-8859-1?Q?7Ri2kUeSevnXmyzQ62uBCE7uYbeCZJFu1N6psJemlui60rUZ3XN6ICjLzE?=
 =?iso-8859-1?Q?LHuThhy5nz3JtUdAzjBrSSQ2plzN/ParJCU7wf+ckMOCm7Bb+U8BukqfQf?=
 =?iso-8859-1?Q?Gas8LS61rdnfFuBmun6UYCg7T7YXSHosFIzaucbvjZyUmexf7t6QR1+cYS?=
 =?iso-8859-1?Q?mzN3i7qlCOzdRUPKraqWHSoMi4cQ0tZplHbUuf2Yms9fxW1y6jhDCel9bk?=
 =?iso-8859-1?Q?FmQGRiO5NjJaDR5lAtOAO13qHAjvkloS1P?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GQQsYbpybGqbCVTKbnf0/QD7YCrR+qFjO7ghwVC1oNVc8k8HRRjMoqFNa+Jm5bIG70LrkMHEMydVGsSNkydoYgTlr258IZrALPwKLhXDV5cLyBACr169ilkHvOHW469iQmJuyWbAlMAdp7NT/Y6Qaq+hwZsB3j0a9QdOh2/dffCAo5IvDufyLS6pqdnWNnZmiX/27TIlUHeA2OQ0OYqmdMx/I1qNdQBjOO2EUf6jw1vfoDdj2bko3HbD9KTVnaIs0a1RDnGVINYMAgz2QpJrz+h3o08REFeeq/GD232VkzPPfBqftP8AuSkEj6NCZ9qo4gs8cGeWitwp5K2gSUCwbnXiLMsK2W3Akpi3phiqoJK6X6ZVQbXE4QJwZTH0j5wiqmeXQI+CleeWCsgYgfNWZgyWZCV3gUcsdpPHSN7BnstGoVW0czxlVq7ZB7Ucea28j29oz/PG9jXxmT8qS9i69/fsF4nDS2VOt2nH9WS8nttQKKDl0cPJIztEcMvcyo4WVhXb2Qa0cHkpwEKpKfV8eJmR3jPRMW4EIyY+jTKncSuKBQWYTQcltm+a0YDQZbZ2pEeivYSVL9lCT0P3jFHWkCssU9ZgziInmRPsN8ffomTibbsMVl/GIwrpNLPOf+FREAic25KulTvHrsRkU3scNi/lI0+2CHn04HeLO9OnuQ/ZRkCBWmME/SLrCg1F9hKa+exdNrTRVp0q29OZbMoKs3ZBdS2PyafO0TkK5mTaoXYUtcqH97VmmQzEQgEYl/cSV6WB/FcAZnBvU2qyMpIy2iPfHNuQhxTxpG2VMUI+o+VqMkdXIYlam+MWwEbM+Bm2ZaaZuTnCkVO71DxRXmL2iw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5372.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbd4127f-921e-42e0-2115-08db0e7e87d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2023 11:28:01.0435
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +GBgGnpAj9QMoIPqkzjV91+qs4M/G6rG5/vcf4EhPCZDmWLPIVePMCTbEaMXoXTTue+O4uQRvOFStGFrvybOH29OyE8zWLAdhMcgnyXccHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5527

> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> on behalf of Mih=
ails Strasuns <mstrasun@amazon.com>=0A=
> Sent: Thursday, January 19, 2023 10:13 AM=0A=
> To: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>=0A=
> Cc: mstrasun@amazon.com <mstrasun@amazon.com>; Raphael Ning <raphning@ama=
zon.com>; Bjoern Doebel <doebel@amazon.de>; Martin Pohlack <mpohlack@amazon=
.de>=0A=
> Subject: [PATCH v1 2/4] livepatch-build: Allow a patch to introduce new s=
ubdirs =0A=
> =A0=0A=
> From: Raphael Ning <raphning@amazon.com>=0A=
> =0A=
> Fix a bug in create_patch() where cp, strip, etc. will fail if the new=0A=
> object file introduced by the patch is located in a new subdirectory:=0A=
> =0A=
> =A0DEBUG: cp: cannot create regular file `output/xen/common/lu/lu.o': No =
such file or directory=0A=
> =A0DEBUG: strip: 'output/xen/common/lu/lu.o': No such file=0A=
> =0A=
> In this example, xen/common/lu/ does not exist in the original=0A=
> (unpatched) Xen source tree. It needs to be created in output/ as well.=
=0A=
> =0A=
> Signed-off-by: Raphael Ning <raphning@amazon.com>=0A=
> Reviewed-by: Bjoern Doebel <doebel@amazon.de>=0A=
> Reviewed-by: Martin Pohlack <mpohlack@amazon.de>=0A=
> ---=0A=
> =A0livepatch-build | 1 +=0A=
> =A01 file changed, 1 insertion(+)=0A=
> =0A=
> diff --git a/livepatch-build b/livepatch-build=0A=
> index f7d6471..444daa9 100755=0A=
> --- a/livepatch-build=0A=
> +++ b/livepatch-build=0A=
> @@ -232,6 +232,7 @@ function create_patch()=0A=
> =A0=0A=
> =A0=A0=A0=A0 NEW_FILES=3D$(comm -23 <(cd patched/xen && find . -type f -n=
ame '*.o' | sort) <(cd original/xen && find . -type f -name '*.o' | sort))=
=0A=
> =A0=A0=A0=A0 for i in $NEW_FILES; do=0A=
> +=A0=A0=A0=A0=A0=A0=A0 mkdir -p "output/$(dirname "$i")"=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 cp "patched/$i" "output/$i"=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 [[ $STRIP -eq 1 ]] && strip --strip-unneeded "ou=
tput/$i"=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 CHANGED=3D1=0A=
=0A=
Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>=

