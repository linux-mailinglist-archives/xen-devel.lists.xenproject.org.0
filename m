Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B855E68F685
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 19:03:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491945.761315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPom4-0003LH-7e; Wed, 08 Feb 2023 18:02:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491945.761315; Wed, 08 Feb 2023 18:02:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPom4-0003JQ-4j; Wed, 08 Feb 2023 18:02:28 +0000
Received: by outflank-mailman (input) for mailman id 491945;
 Wed, 08 Feb 2023 18:02:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8nB3=6E=citrix.com=prvs=396cc5531=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1pPom1-0003JK-V7
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 18:02:26 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbc20ff0-a7da-11ed-933c-83870f6b2ba8;
 Wed, 08 Feb 2023 19:02:23 +0100 (CET)
Received: from mail-sn1nam02lp2046.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Feb 2023 13:02:10 -0500
Received: from DM6PR03MB5372.namprd03.prod.outlook.com (2603:10b6:5:24f::15)
 by SJ0PR03MB5727.namprd03.prod.outlook.com (2603:10b6:a03:2af::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 18:02:03 +0000
Received: from DM6PR03MB5372.namprd03.prod.outlook.com
 ([fe80::acc3:67c:60ef:bf99]) by DM6PR03MB5372.namprd03.prod.outlook.com
 ([fe80::acc3:67c:60ef:bf99%6]) with mapi id 15.20.6086.017; Wed, 8 Feb 2023
 18:02:03 +0000
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
X-Inumbo-ID: bbc20ff0-a7da-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675879343;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TCRMx2hlHmIpleezg0Gi3bHGWkCCytuSV9ZdPQuj/p8=;
  b=R/tt86JeC5dH14aqGBE1bRKNPJIV5qFWNTH/mUF3MIpDha4v0nFE1Ugc
   ikmClj3EuVQ6pBEUIWh5UtzpCWwkuxJAV3Guhv3D6TXKhwbEQqCI+Pxff
   jMmLqsPaE3mvleQ52hZypN0AA501WbPzf34icvj4hncbhs0J+4DT8q4dP
   Y=;
X-IronPort-RemoteIP: 104.47.57.46
X-IronPort-MID: 95079045
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Ok5WyKOaC3z+4jjvrR2MlsFynXyQoLVcMsEvi/4bfWQNrUp0hmcCy
 mRJXGCGOfmKZDehKoolad/jp0IFu5fWyYM3QAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tC5gxmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uNMEVpB1
 6QqFC4mMxK4jN3o6aibe8A506zPLOGzVG8ekldJ6GmDSM0AGNXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PVxvza7IA9ZidABNPLPfceRA8FckUuCu
 WvC+0zyAw0ANczZwj2Amp6prr6SxXyqAN5PfFG+3uNXvg2im2oLMzoTVgK3rKjio0rvYt0Kf
 iT4/QJr98De7neDS8LhRRSjvXistxsVSd1WVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWQSm+1/7KdvzS0fyMSKAc/iTQsSAIE55z4ptg1hxeXFNJ7Svbp0JvyBC36x
 C2MoG4mnbIPgMUX1qK9u1fanzaroZuPRQkwjunKYl+YAspCTNbNT+SVBZLztJ6s8K7xooG9g
 UU5
IronPort-HdrOrdr: A9a23:Ip0RDqHLB3jZ7Gj+pLqE0seALOsnbusQ8zAXPhZKOHtom6uj5q
 OTdZUgtSMc5wx7ZJhNo7q90cq7IE80l6Qb3WBLB8bHYOCOggLBEGgF1+bfKlbbdREWmNQw6U
 /OGZIObuEZoTJB/KTHCKjTKadE/OW6
X-IronPort-AV: E=Sophos;i="5.97,281,1669093200"; 
   d="scan'208";a="95079045"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EViNpe86MhNEYIf+Q/bcq9112OJm373mHnGgFRvkEnvSSyMPc6ZFH7CXs4TBs/nT0jp/s3BP50meYyoXCnq6IkThgsSlxaNQJr/HQxE31egh3zWsqdgjrMbiy5hmHfJyRzX5/MBRLP0EdlA9hYPzG2c8yZCP8mPT5WHoy321oj37HndUvxnFBLl9aa3bf0A/vdZ2Ljeld4dIFOZXHTzpSbrfvm8BFTV66cC1LHCtFhnlhzVFm354zc+0OSI2exLqDRx1VazSxBUqG8FXV32aGVe4wchE3Vfp8ueoQ4J4m5Z93w2wnOZPxw7b+Uvt3zyirFXREE+bkdqUK3F3Ke7SlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TCRMx2hlHmIpleezg0Gi3bHGWkCCytuSV9ZdPQuj/p8=;
 b=CVaTov0cos0tYgJweVq9YnVez5S/wGDPEX1qd/IgENRTO/HBWicfNkN29jKSZsSYmfsjJBsH+CajemPcGLTxo2fd5DVRzKGRfWKwN98dWms7DYbOUFIuWdVHIAw6EhatNhNW+EBZMefoUVBky3++5A5ueckKiD+hy9X/b7MiHCPwB2O7sDP3QmhlkFU1Yq4Izu37G2BAe3EWKzf2vehNYOVy8YncoZkJZgkM6jj4qxTMbW5Hrc4iYD+bfuxXIbqJS0v4CAQYgHxzGVfY+ury0Fry9ZpoYofX4I+XM8DfeRsczlf+SC46F1xuwJz03Yqhn/caRE6QmfPyGtRmGj8IQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TCRMx2hlHmIpleezg0Gi3bHGWkCCytuSV9ZdPQuj/p8=;
 b=lGyvcvuo0dwM9dcToLXgeXto9BbaF+8vm8Jyx+GCV9YJtRnb2FWBwNKazW4/7UwQ71rCLORvUBTzl52q0CsE3qsemj22epa0DZ94XhRvmpXuzOyQ4zzJ/9KhzuE7kqntD8liPoFcDSbdyyV3tWTozDvNegtyO8WHawYOocj08wA=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Mihails Strasuns <mstrasun@amazon.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Michael Kurth <mku@amazon.com>
Subject: Re: [PATCH v1 1/4] common.h: Flush stdout before writing to stderr
Thread-Topic: [PATCH v1 1/4] common.h: Flush stdout before writing to stderr
Thread-Index: AQHZK+7uzgs/uPURN0KVH9/bFkDof67Fdcqe
Date: Wed, 8 Feb 2023 18:02:03 +0000
Message-ID:
 <DM6PR03MB53725E53213497ED29DABD66F0D89@DM6PR03MB5372.namprd03.prod.outlook.com>
References: <cover.1673623880.git.mstrasun@amazon.com>
 <2e89973f61bbd6e6ebb423ec6fe7a025d5404235.1673623880.git.mstrasun@amazon.com>
In-Reply-To:
 <2e89973f61bbd6e6ebb423ec6fe7a025d5404235.1673623880.git.mstrasun@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB5372:EE_|SJ0PR03MB5727:EE_
x-ms-office365-filtering-correlation-id: ddffba5c-aad7-4ab4-8c2e-08db09fe9575
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 X5DYZH+DZixcWqcCz8OQbbxGBORYiZT+n3mmGdEo6z4Tjezg/HUpO1Y2POtBkxWNYYpcRv8uPTHadRNBwtpHYO/tU9KsyFPqs4Ac5/mjibVlQcY8MJsNeah0OrzbCLU9PJfFqAl7L+R6KWh+j/53RHSg03MfMy9RkO1jtM5grUkHzTbbkGS2OPA3Yv1a/JN87L/6Wrc2YR6HwucMY6pPXcYURuraAKDS8DlKs6kNYo34BSCAFPNelG9L/+EHt2C5vTg8fkYIzZlYkwUFQ7y9SE2PkV2/TxiEyONzlCrNfzhDDHw3nkWTedzIwU1b7VPvJZ0uFe5J86PjzPcBE1dwtEfLEM4PUmcq0jo+wkhLx3jEoDiia6QM3i7OLZrqEBoTukkaUpzFpnDGRK6qJ/bELYiX+RS/+vbQ6j1iYMX4EVlh5L38grXEYJCzg6GZY+f6o+mli5m7/fqkozfH9MhUPEucj01EdXvL7sNNpqGij8DWYeeka8Z5Uxst2DOcYV0RMlPtQ3XM1l+q2Z9SjA2ko+GgyW7ZtfLE216RIVeQa+Q1T1NzdoDwp6jN/0WUtIKzY+Niyzs3giDhbNCG7dXTvTOPucDl4MbulP12aG53dIGVVNKfP5T/MB755SPoIsCu2QsRr157GFSrmH52MWxVMABJEZa1svCB5oEXkKMiGI6UUD2Un151jaQhZx1ObonY3At818ejZDFxKIcYevHpNg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5372.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(451199018)(53546011)(6506007)(52536014)(9686003)(26005)(186003)(316002)(8936002)(33656002)(38070700005)(2906002)(55016003)(71200400001)(83380400001)(7696005)(110136005)(5660300002)(44832011)(478600001)(86362001)(66476007)(66446008)(66556008)(64756008)(66946007)(91956017)(76116006)(41300700001)(4326008)(8676002)(82960400001)(38100700002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ty55VzAT7Br65oc2Y1Qd4aj8p9bL2jxN0hkRMInxdxykTlbvNYTj3Ttfe7?=
 =?iso-8859-1?Q?k6Q7CZ5Ri7FS0qUVSTL8j/YaOcuQRXxBjdiuynPqv0/rRUTEg2ELNECJDB?=
 =?iso-8859-1?Q?SD8WQaLcWZMS5MncN963jSVxrUX6ebKRu4oApRBVYcysc2WrYiI70HOsog?=
 =?iso-8859-1?Q?hMd5kfjUcZM4233QEOJrqnt6xJ+mD2dPjK0VJVfC7uwoOeUG9WgtoAgsKw?=
 =?iso-8859-1?Q?ZOhGBtBthEIndwUYRwaGjorlO4h9w7WH3Efsol5ToAFwBY76upnZSGugug?=
 =?iso-8859-1?Q?P12sPeYO2fnfrRKHkGnv460/QK6ElBFPYJZkDWO4LnXsixPZupIK6lfJ51?=
 =?iso-8859-1?Q?J/R3vd+4IEHR7xhLv8T3pb8VwrmpVHSRqjNU5SfHN6FwoICr2J4+9xSbKd?=
 =?iso-8859-1?Q?bYcmvpZ1EOvDDc/uuIy2fmTAspMo5ZkM+hrv9o4iD9tKZWTjBM9zYIuHug?=
 =?iso-8859-1?Q?C5iAwdzP6h6GZeqKknpD+Lave5nLUiMFh8Owpk+YzIWCi7x/SAmZW/UaKk?=
 =?iso-8859-1?Q?uwznP0Sr5J+U84wmNtmTOlRuvPX/WmyzZNxppikss328RbUNGcc58XlHP+?=
 =?iso-8859-1?Q?7kbr/BxTwizqkZKR04DKXhJ1jIEyubdqx/JbgfiqOv+bzMgUGRJY7S+aV7?=
 =?iso-8859-1?Q?LyqI1QsvyfQxL6Hi66526uS7tCCvE/T1E8tK2gLdnnt6hAaN1KVN/bgTMZ?=
 =?iso-8859-1?Q?ATfNYtBsKrMrtm8GpdYf+j+TB9m4u6nZBaWtYDzVAr9bq/ik+d9YqBeg5x?=
 =?iso-8859-1?Q?ylK1Y4gQP6Hp5zbaaT3FxCAnhtOeGi4lDMgFeRAEnB5og8S06zaUWIs6Pb?=
 =?iso-8859-1?Q?U/zJjo5bN/lvmu4K5rCxWCyrxreE89OUjhrVDGcymb6oASyb947mhMEcb8?=
 =?iso-8859-1?Q?RvH4yzSgNOzMlP0ucyEGU5rSOXFdjs5B8mq0gwGivQbtyqQX2EtnOGAnav?=
 =?iso-8859-1?Q?UXx9oLtVctv8KJj17kTFwGaDPKmp4Ho3gTvqi8sgPwUYmxSRmGb3RYZFYq?=
 =?iso-8859-1?Q?pmc47klKPagceUXNTuVzpcnoJuMUYi8AxUZtwDzOw3ak1aCntxsKwuLJI6?=
 =?iso-8859-1?Q?VJJ11WWoqfGk7NqIq1Ub0fcsHCgabXGZBSSNriAazIvhyBVdq6SrIbT3cP?=
 =?iso-8859-1?Q?rQd/ubMRVPBYlGh5B/lotmNwdf6TYMi7CcedLPxemXapVy/TNgPTxBriHy?=
 =?iso-8859-1?Q?LCli1TYh/JbPu1PYrivcz0jyuT74cyPxz135lBYlXTyOAjS1EkO2i+hq+X?=
 =?iso-8859-1?Q?tc3QK8OG/yYvLkKwjR0As3OM6djLQdGF0L1kTHAXWzLN1pBKTLAUBpsI1A?=
 =?iso-8859-1?Q?4QaV8bCgMkKIHsXRAtvto3Jhz9CGd9vtKsB/WvyelJiXCz9uRNfHewhSQQ?=
 =?iso-8859-1?Q?Cqvnnmi0aMFjDaX8o/lDMOgEuqUig76u4oVTmduqoKnWvjSct87vz5QLKt?=
 =?iso-8859-1?Q?9eYg9KV9C4zf6eCtqK0ksFONdqlDuNSDD67sBCQkRqIHTP3T/DhMhCak1Y?=
 =?iso-8859-1?Q?navt7gnlGO95Vnay+SGyzMHAzie0IkZiVoy3XDrdWrIPmL85wvrg38/yuj?=
 =?iso-8859-1?Q?skoogFWgmMm0w5jTjtcWCsinDUSuNqomcv3gusnPgEEFFzHZ4DzLrCqywV?=
 =?iso-8859-1?Q?N/IYLog0QcBayWkiK2IEnHhUJTPmaBW1sk?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	B7M9pyHJeM95OMV9PF0rqw4aLtixBNiRAZiItlB5zbd/Af0FAuUTt6b8rmIw9SUy9U77vwwUN+mwHqm5ytN9h0cAN+Fs/64odjP9gSRPk+tATTXUs+2fMiLmmzjhJqsVATKBvtO9v1FhTkujigrcKspPFiTTC8INCf4LRAiBgZTfra/kXviUAG63D0svR44gn7hEhH5o2YSyidZOMutvmMM03buYMjAzzzFsYdT40R6hwkc6zg0gX/JMkLIXx+jKH3eG9W1cre1zueif3HJPhmit+jTwvEpPTlTGhihLedVuZrOOxyBtF1rKvMPK/Fu4Dv7euYMHFPHVztK9+Jp7EDpEMRXzxXSOUp4+oIla7cwXEFI12gmvzMqeHzuGHgfBaOg2mIN34a+rGlRyVcXHoz8akPPi5xMlXhbwXiQUlJcmo8YfqMDoRxBoy3Mx8bqafs9+2dYIfoOFWHo/gh1Vx/VjrnrhMlUzZSwwopVFP4z12cohtM7OvPicoHlvqZ0duoMcPF4xHEi6xFd7Sm4dDd7SJ/cg2AQIYwHbY/KhchWcE58id1IejU3OpZcZIyeSZgkf5c7iumendvkklvlID/ymVrcIdM4E7kq0ceWR4tzB6XDL7vFNXSQUr9FgXfuQuVZNNOCqE4OPwGHScfI7/yMzB4Zyjs2rA23iz0HoGVNUTnIKq3CPDE+6xxcsN0UCi/nxuhAlYWrJmVZBqpQgzwIj28SKAB6WfzM2n8l3/CHGjEviFEK4oY3S4TB/g/RJnurwFRw4sriAJbgfmaQAwJcwXxwqr2B3hm0U91oF2ObBihKIVPTk6SHMaS2YXgF7
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5372.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddffba5c-aad7-4ab4-8c2e-08db09fe9575
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2023 18:02:03.6596
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QC6UNUYtfijc4MjA5UovWCoVQ5aYTtvkMHuZgbzGRFztNHXvhFXeycZ+3QMDqwPxMXYzWoUwX++DqEhjSUBbDQKfX0vvGgSS+7ismVnqM2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5727

> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> on behalf of Mih=
ails Strasuns <mstrasun@amazon.com>=0A=
> Sent: Thursday, January 19, 2023 10:13 AM=0A=
> To: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>=0A=
> Cc: mstrasun@amazon.com <mstrasun@amazon.com>; Michael Kurth <mku@amazon.=
com>=0A=
> Subject: [PATCH v1 1/4] common.h: Flush stdout before writing to stderr =
=0A=
> =A0=0A=
> Flush existing debug messages before writing an error to stderr.=A0 stder=
r=0A=
> is usually unbuffered and stdout is usually buffered. This results in=0A=
> odd looking output when an error occurs and both stderr/stdout are=0A=
> printed on the same console/file. More precisely, the error message is=0A=
> printed in the middle of previously emitted debug messages.=0A=
> =0A=
> Signed-off-by: Michael Kurth <mku@amazon.com>=0A=
> ---=0A=
> =A0common.h | 1 +=0A=
> =A01 file changed, 1 insertion(+)=0A=
> =0A=
> diff --git a/common.h b/common.h=0A=
> index 02c9b7b..9a9da79 100644=0A=
> --- a/common.h=0A=
> +++ b/common.h=0A=
> @@ -10,6 +10,7 @@ extern char *childobj;=0A=
> =A0=0A=
> =A0#define DIFF_FATAL(format, ...) \=0A=
> =A0({ \=0A=
> +=A0=A0=A0=A0=A0=A0 fflush(stdout); \=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 fprintf(stderr, "ERROR: %s: " format "\n", child=
obj, ##__VA_ARGS__); \=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 error(2, 0, "unreconcilable difference"); \=0A=
> =A0})=0A=
> -- =0A=
> 2.38.1=0A=
=0A=
Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>=

