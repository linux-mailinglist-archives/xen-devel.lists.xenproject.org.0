Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 223A56979A1
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 11:16:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495825.766253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSEot-0001sV-KZ; Wed, 15 Feb 2023 10:15:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495825.766253; Wed, 15 Feb 2023 10:15:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSEot-0001q9-HP; Wed, 15 Feb 2023 10:15:23 +0000
Received: by outflank-mailman (input) for mailman id 495825;
 Wed, 15 Feb 2023 10:15:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dr2i=6L=citrix.com=prvs=403e0d18a=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1pSEos-0001pk-6k
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 10:15:22 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4fcb1fd-ad19-11ed-93b5-47a8fe42b414;
 Wed, 15 Feb 2023 11:15:18 +0100 (CET)
Received: from mail-mw2nam12lp2043.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Feb 2023 05:15:12 -0500
Received: from DM6PR03MB5372.namprd03.prod.outlook.com (2603:10b6:5:24f::15)
 by MW5PR03MB6958.namprd03.prod.outlook.com (2603:10b6:303:1a9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 10:15:10 +0000
Received: from DM6PR03MB5372.namprd03.prod.outlook.com
 ([fe80::acc3:67c:60ef:bf99]) by DM6PR03MB5372.namprd03.prod.outlook.com
 ([fe80::acc3:67c:60ef:bf99%7]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 10:15:10 +0000
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
X-Inumbo-ID: a4fcb1fd-ad19-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676456118;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FXTIAPOtl/XbORweWodUC/OPkWFve7kb1hadOq/CKq0=;
  b=O5m/EdZZvkJxXuenK7tl3QTjIotdZC6BPxwT9z/T4NCdfnvtqBztFdst
   I2uXzlFlFa3wNCCHs/2mswiSdx6jP22vRpMOnG4r7fSA3UftBmFfRS5rr
   qHfn3iEGOFJLc7G2gKbtI0zPuI9CInAidUlSgCSEYqeIxYqMf23fpk5Ut
   k=;
X-IronPort-RemoteIP: 104.47.66.43
X-IronPort-MID: 99538520
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:uGgvP6CosHJRkxVW/+Liw5YqxClBgxIJ4kV8jS/XYbTApDIq1zUCx
 2ZMW2zTMv+CYDf0fIgnPduz8RkH7cTVmINmQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtMpvlDs15K6p4GlB4wRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw3ut7X1hx8
 tYiJjFSVhev3eHswrCmVbw57igjBJGD0II3nFhFlGucKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTL++xruAA/zyQouFTpGMDSYcfMQcxak1yHr
 2bC12/4HgsbJJqUzj/tHneE176SxnOmAtp6+LuQxu5V0EOznTUqOAAMRUr4k/q6jAngVIcKQ
 6AT0m90xUQoz2SpRNTgWxyzoFafowURHdFXFoUS6hyJy6fSyxaUAC4DVDEpQMc9qMY8SDgu1
 1mIt9DkHzpitPuSU3313qiQhSO/P24SN2BqTT8JS04J7sfupKk3jwnTVZBzHaitlNr3FDrsh
 TeQo0ADa647iMcK0+C+4grBijf1/JzRFFZpvUPQQ36v6R5/aMi9fYu05FPH7PFGaoGEUl2Gu
 3tCkM+bhAwTMayweOW2aL1lNNmUCzytaVUwXXYH80EdygmQ
IronPort-HdrOrdr: A9a23:Ohibx666YQzrUnCiUQPXwMvXdLJyesId70hD6qkXc20wTiX4rb
 HKoBx4vSWftN91YhwdcL+7Sc69qB/nmqKdgrNhX4tKPjOHhILAFugLhrcKpQePJ8SUzJ8/6U
 4PSclDIey1KWJa5PyX3DWF
X-IronPort-AV: E=Sophos;i="5.97,299,1669093200"; 
   d="scan'208";a="99538520"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T28iidTZYGtxgLxafa6hNg/IPvkbsmH6Kh5Ba0KZKM/1Kq2C8YLFgt4mgNRvPU446uveZ7XoCS5rWwfdqEfCdpnhna7kVUTSIQa0+ofzx1KzhHgMlNqObYsNyXXwHIfYw88twEqamrHYUwCYAj1JM4EbVGhn7CbdFGp5lb2Bdj4UC4Om1YGH2jhjkROxhU7zSQQPzjyyMMfiQ8KPxIXIZD788yni4gjPNc0rhko73z7EUXtqf3b4sOJ0sPjvHXwHI4OZVqMGJzgwG4Kxx6f28EBZytr8pwYKOCekiQv5jZ7svc6wTemC8StTKMNPRB0BE9V2mYRDu5QTpdBPJtw5NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FXTIAPOtl/XbORweWodUC/OPkWFve7kb1hadOq/CKq0=;
 b=M6GXZNLQYnznM344PYVf5NzKaphl1v3apSy8yD4HbSpXUcVAwBlQN17yyqtNmv080x/WrJ5H/IdKBD0ay5LDREHBG0dNO0dnpZjVRjb1KEkFqk1bLpJzcUhm1THsbAUIj0Ugk75AtslpkGB5dDPHmIYxFiAnKcngTx5atNWHIdC3hsOoUMUe6s3atPqgYtMDFc5x4sIYNHc7Uy2R0EXSkaE/OWP0e1mYKJydahEuoKVXNw4eTJED6royG5FzpD5x0/7dy6Zrovk46dw3PpLvdTg9+1qSEzlc38JoUauY/wq3o6epizIc9evFlVPV0JIdjvZVqJ9S+gg4vTpDRO8epA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXTIAPOtl/XbORweWodUC/OPkWFve7kb1hadOq/CKq0=;
 b=CCDh6SiCzForREv7dETXpF3UFP526uNo8B4Q5OhMngb+CFzvJm/bv0kZx8EjQwWlbeq9HXfvQdQvVjq3slr6CR1eQYBm5aKqtgY875T259IsFtXGt5TCXh/smhkFOWwhoLe/zpvHA7s30ik3kiGyHh44V/HlOVnxjadUBAdkHr8=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] build: Make FILE symbol paths consistent
Thread-Topic: [PATCH v2] build: Make FILE symbol paths consistent
Thread-Index: AQHZP8wQAlEMPw7YZkelXrHFvRoSWK7Px5eAgAADTY8=
Date: Wed, 15 Feb 2023 10:15:10 +0000
Message-ID:
 <DM6PR03MB5372F4FED19F476F5568C157F0A39@DM6PR03MB5372.namprd03.prod.outlook.com>
References: <20230213165539.3257260-1-ross.lagerwall@citrix.com>
 <220e39a2-9fc8-251e-9b9a-997469ab201b@suse.com>
In-Reply-To: <220e39a2-9fc8-251e-9b9a-997469ab201b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB5372:EE_|MW5PR03MB6958:EE_
x-ms-office365-filtering-correlation-id: 76f24660-750f-4f94-6ad5-08db0f3d8515
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 hHL3la2yaEWco40MSF6iOF8oOLFgq8Ryalkx47PqmKmSBzDChkuet63gosGya+bUB4nn1F7JmJS6u4+mjUX77/Jt/CxucAIi430jOmR9A4osS/fLlrQfRsFh7NQ9KgNO9jH1gDCn+/MZXXO9nTGdp1GrZ6YbZNWCH9N0+c2SoWPP3bPVvaXcDX+GZQPwyB2NYnbXSLK4qPHD1DytSfCOdfbvvxl/rw/gQ+qW4sM2C6cHwcHlH4372sEWocgP4gyTHWK4yoad5K8upfJWusmlTWc+KCre6JjhdbgGmE6Cj5NJlpU5WAZH7eZnMA/TrK5xAVmpuwMSIKrnOaleBMTguT8k3MLIWl7Bp61vQ5xG9G+6ns00h6kGB9hXK3Hww1ypzuwLno98GjY0sSh+uekrEsa39U/URcZXyZPn/W69l7aFCucES3QXN7bqVcyOg2gRG3peSG+Cs0up3vrJLNP5BkOUTbSi8ccGwtCBmtspGaeGdGkF6MQj2zMIBlZ8ykuMmoHKOufmW7jxl18GPkV09DBwFg0wXUWTpkgbzOgEzrfe6PBSlZxC9aO6grYGYVwVjmfJZxiHIiO3KlR7h6lJenFGRNmi8EP/+NTpVvSfYKnnHwJzcSD6PIVYNlhCqF+ihZX463cvZFVFphZ4UOxs71KsNNpa57yG58ukvHZlP0v+aaPjqviThpXPpxvjOQkIRHvTyVYxOJUgZxGgWTFioQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5372.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(366004)(396003)(136003)(376002)(451199018)(8936002)(52536014)(44832011)(41300700001)(5660300002)(2906002)(4326008)(478600001)(7696005)(66556008)(8676002)(6916009)(91956017)(64756008)(66446008)(66476007)(66946007)(316002)(76116006)(54906003)(82960400001)(122000001)(38100700002)(38070700005)(55016003)(53546011)(71200400001)(9686003)(33656002)(6506007)(186003)(26005)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?mJFwzOnDwQnfKJPCk2e5DmCSAu52iSHvwAxfeu7yUnFEidBP6jOX16eOXP?=
 =?iso-8859-1?Q?uMs6lSLEbHfa2FXqnS+fVVvGnTYy50oxIvitB6Mw/jT9FFArmZMSJnqclX?=
 =?iso-8859-1?Q?xCmAQ/rktYs6dtiKpB9osTwmD4gmNSRvBGyZj9hB3WwBwnrCIPjJIqBfRc?=
 =?iso-8859-1?Q?4XRMfN4I6Ao//vOjF2yrZACrPKi1+BG3XlXxBtpaa+tYRopgvGysOz/3y8?=
 =?iso-8859-1?Q?zpEWVARi17mMzAzTH0hPi8AP+Lfq7o0kz2ryWzu2dphXlKtmPotcfLe16x?=
 =?iso-8859-1?Q?YJd6/lKrVc1pqQThZC6upJdUjaPbzeNP+bCx1rkZyXcvBEBr7PpVvgXb0A?=
 =?iso-8859-1?Q?rtqFB0tiLGCHoCDOMAteQxzMxROB1AnZoZ8hIkKsgroeuJJppttqIl2DBO?=
 =?iso-8859-1?Q?LDljBvl9PMErQacsZqWlxjRjZd3tL/Rj2ZK3rT6464Zu8WkWOU2uORo+ji?=
 =?iso-8859-1?Q?+kvFpuPCzU2iNJuvWfyd/Hlt88Uj6ELYUJ5SZaPh4nepafrlHvZqjuBzAs?=
 =?iso-8859-1?Q?DdeB46CdB+WyYmeaBnwRXrT+cY/LhuGztk2NqP76UsCxD2REc7VNcRsM9J?=
 =?iso-8859-1?Q?Dg9oRRbHlcolxnWcuv0HLF6JX5V7IsuF3366pYUgz/xflzBR0nLX8HSd26?=
 =?iso-8859-1?Q?0LqnSDayHXyi9X7QyYkxMMFiVqtVGTTMSwMBnxPyvKr4Pk6OWxhxky4bdo?=
 =?iso-8859-1?Q?3VF4lgYNtyuvxVX/dmwS4xbo8S0kxyurupS1zm8Qff3RcYSFayie2zC7xt?=
 =?iso-8859-1?Q?r6uwMgU3lmAdaEvx0sLpVRUb5SUHksimB+btqBpXnsn+nhf7C/2jjThLj4?=
 =?iso-8859-1?Q?WQmRzektoAWvhQq5gphJzPsTT8nuqiq8sa1QAyqF8jNUT/ysihDefjtcr5?=
 =?iso-8859-1?Q?K95hKdgArfkNNyILX8Pu2omM79f25oLaJ+LVJwKYPyv217MOeHkbrF0eCr?=
 =?iso-8859-1?Q?Hqod1qPu9Zk3Bptvexqr934abUHlHaNDny/4ZuXcKEV1KsuFYosIqC0pqB?=
 =?iso-8859-1?Q?Rx/rBfyX8OZoujSbDhB02Us9e6UTakeMfiJCokPaRBk/3SzZ7JGlZiotnz?=
 =?iso-8859-1?Q?oSSCZ/WZbbW4HvKJz3afl/i6mljhFcVHT/ee+Dn5cFbGyIIPCcvcBx79Jc?=
 =?iso-8859-1?Q?MU1Hjq1kKiqL1hhYkMnqDENd90/h/uUFnyojD+tYrJuWnT7GMm/N2Mx5e3?=
 =?iso-8859-1?Q?fPAayh/ykPm80bqeT5xLJeCRFtoTVJV/xGgxzSEyzEZpldzZmrRyOVQhTx?=
 =?iso-8859-1?Q?8Ft4q1+AldxYhtyWUTaVtZs0KlD8gl449EO8kxF4FSNImMwb24QU2msqWa?=
 =?iso-8859-1?Q?0bG0fJ/R0jwkBrzPSvVHvy5lBb5bjPm02QE2NDs/XzYc/oUg9qydT5UXUv?=
 =?iso-8859-1?Q?XleUeXf6dqjhjtOXNjBIpICmrHnYtiGXxsbVeTMIUDTeldcj00EMntDYOs?=
 =?iso-8859-1?Q?GL8UbKKcJkAP5CfmzmPTNsyO6eAb6tvK0eUobSaZ6kEoM1ykOikb9M6Hcq?=
 =?iso-8859-1?Q?f+xY/0nr1HlNOOw9b5s3G1ns8BE3I0DNdCstB3oRcyrB3TwvlEO6B61dss?=
 =?iso-8859-1?Q?ooBK1x2AzZgZ0M/0q3Q4yJnlrQ3oFRLAQiaSpGFAcdAVns0qJE8vCXEEn8?=
 =?iso-8859-1?Q?6KmnDsORigkFtnD+vtEATVnnUoCeqt6KKh?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CZPS+e7XbpEpl2HoKjmKJ8budKBQMDsjteiALa6OHKulBis3mekTn4EfsV9+S1i3V+TNLzmyndNxppT3I3eNaKs7g08dzLnC8Nbsno5kYfJjU6Db48pP+6TlFalPAyoFGxjVH0TYP59AU+W56VUKsEwKvTSG0zmYZs2Tl3QkBr/9fykOhnwuq2m38qhlobfMCNCp/r4/GA6pRhGlx87mZpmIwRLiRNXnftB2spcibFkilettkZRM1fJ7jGZ2NrqEPTAeGIoAeQ2yqiLVsG4BQPEuLPkIWKxi6BXQq6NlWehxi7TdyEa2u9ZAfeRR7bHr6qqrygyLCiXhIGhDOhHP0kaT89PBv4w/mTXAFzUhzhYJo37xlWNQw2kxaQZpAXYs8+FAK6co8T1Jwei9vi9/L8O7uC0RtRuKG7EmqerAcXO1Mit7iK1+mawL7GDzmK0oqWAsFIKoxxVPBtAbo+W1Z7ALDf6X2G3PIL5kdcbCilGW46NeegDP+OaD0VOExWca8+JYvQtipO7a6g9JtK0JHbv5cjXlK3NfCtG7U0m0slyCKy5VCzCfg0jvcpFFFmY5c6ik3vlHv4fFO0dDEHisqKNQoSKUciAGMuIQLxKMN3XdSzx8DjxKlzMlPrIaHo3JKHkakl4NTUvccnXoldJyz6b9cWlms2z2a6x3xdkUXDOp+ihTZgCj5asvEHSCxmxf4Pc0lT2y5z/M3smJxCdA9bXxn/nCbnWwyZA8eg1Ka8TkbE4mFBDNHJmIt4xG7XPXXb/XLa/aKxn11dKbrkMlODFWkDNLKoui+a/WRIukWr0hS1Iui3Hsi37wFqu0QIRQPgPREGFjwBBM/AD2pt3HQ09+qAThkAbPH5dMurT9vWc=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5372.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76f24660-750f-4f94-6ad5-08db0f3d8515
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2023 10:15:10.3095
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JjwUoL/+jXr1jWwUrKQmXPBt6jSUfLeSCQ9AU8X5X7ss3Nh1779eKHc6r9xhuc69vCZ0dWVUzqJOsPT5SFAbCHDL7xYJ8mbMvWykK7JoXc4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6958

> From: Jan Beulich <jbeulich@suse.com>=0A=
> Sent: Wednesday, February 15, 2023 9:55 AM=0A=
> To: Ross Lagerwall <ross.lagerwall@citrix.com>=0A=
> Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>; George Dunlap <George.Dunl=
ap@citrix.com>; Julien Grall <julien@xen.org>; Stefano Stabellini <sstabell=
ini@kernel.org>; Wei Liu <wl@xen.org>; Anthony Perard <anthony.perard@citri=
x.com>; xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>=0A=
> Subject: Re: [PATCH v2] build: Make FILE symbol paths consistent =0A=
> =A0=0A=
> On 13.02.2023 17:55, Ross Lagerwall wrote:=0A=
> > The FILE symbols in out-of-tree builds may be either a relative path to=
=0A=
> > the object dir or an absolute path depending on how the build is=0A=
> > invoked. Fix the paths for C files so that they are consistent with=0A=
> > in-tree builds - the path is relative to the "xen" directory (e.g.=0A=
> > common/irq.c).=0A=
> > =0A=
> > This fixes livepatch builds when the original Xen build was out-of-tree=
=0A=
> > since livepatch-build always does in-tree builds. Note that this doesn'=
t=0A=
> > fix the behaviour for Clang < 6 which always embeds full paths.=0A=
> =0A=
> Is "fix" here actually correct? I.e. is there anything to fix in that=0A=
> case? It looks to me as if "always absolute paths" is as good as=0A=
> "always relative paths". In which case s/fix/alter/?=0A=
> =0A=
=0A=
If embedding absolute paths, the livepatch-build process will fail to=0A=
match symbols between the base xen-syms and the newly built, patched=0A=
objects unless they are built with the source directory at the exact=0A=
same path. So yes, I would consider this as not "fixed" for Clang < 6.=0A=
=0A=
Thanks,=0A=
Ross=

