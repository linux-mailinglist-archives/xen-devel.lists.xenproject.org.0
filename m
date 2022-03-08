Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD114D1AA3
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 15:33:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287006.486766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRatw-0004iF-By; Tue, 08 Mar 2022 14:33:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287006.486766; Tue, 08 Mar 2022 14:33:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRatw-0004fb-83; Tue, 08 Mar 2022 14:33:24 +0000
Received: by outflank-mailman (input) for mailman id 287006;
 Tue, 08 Mar 2022 14:33:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yKud=TT=citrix.com=prvs=05922dae9=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1nRatu-0004fV-PZ
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 14:33:22 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3597f83-9eec-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 15:33:21 +0100 (CET)
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
X-Inumbo-ID: b3597f83-9eec-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646750001;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ha1KRl/FXBnfbn8QksGEsyyyxpVpkX910k/W/zwJgyM=;
  b=VJIJeZyJsF/+/gI7aTjrkmIZp38RaiFhbVMGUt4ffCz/FcFGHQM+vd9o
   OQX+y8eFdHKtpvnZg6mP2F+nZ9h4GzimNKzvINsiKX/KW5ALhnxkt93Go
   EQbNN2EESKJ/GcbmQ2hO/kGulod6cMsdxla8PM3da/eJ9j8hGJiBUWdaa
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68061393
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:E3E4jqxnLdhYLNvMrpJ6t+f0xirEfRIJ4+MujC+fZmUNrF6WrkVUm
 zdJXmCGOfiKYDeje9pwPN/j/EgHv5aBn4BgSlZrqyAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NYz2YjhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplnKOPVyoAAJDwqP0NbAJJMgZjG/Jm9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQEoTdkxD7UF+kvRZTrSKTW/95Imjw3g6iiGN6AN
 5JHMGE+N3wsZTUVOHBICqoxg9yXi1DhKiBYjVKfvKQ4tj27IAtZj+G2bYu9lsaxbcBNmUacr
 2nF1238CwMdMpqTxFKt8XWqnObD2zz6XIE6E6ex/fpnxlaUwwQ7DR4LfVK+qOu+jAiyVrp3J
 0sZ8CcqhaE3/V6sSJ/xUnWQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3PLaXhRzi
 AXPxYmwQ2Uy7vvFEhpx64t4sxubBhcLAEY8WBM0VBs6+MjCh5wV0TLAG4ML/LGOsvX5HjT5w
 javpSc4hqkOgcNj65hX7WwrkBr3+MGXE1ddChH/Gzv8s1gnPNLNi5mAtACDhcusOrp1WbVoU
 JIsv8GFpN4DApiW/MBmaLVcRer5jxpp3dC1vLKOI3XD32n1k5JAVdoJiN2bGKuPGpxcEdMOS
 BWP0T69HLcJYBOXgVZfOupd8fgCw6n6DsjCXfvJdNdIaZUZXFbZoH8wOh7NhDm9zRNEfUQD1
 XGzK53E4ZEyU/gP8dZLb71Fje9DKt4Wnws/uqwXPzz4iOHDNRZ5uJ8OMUeUb/BR0U93iF69z
 jqrDOPTk083eLSnOkH/qNdPRXhXfSlTLc2n8KR/K7/cSjeK7Ul8Upc9N5t6INc790mU/8+Vl
 kyAtrhwlAKv1SeZeF/RNhiOqtrHBP5CkJ7yBgR1VX6A0Hk/e4e/qqAZcpo8Z7488+J/i/VzS
 pE4lw+oW5yjlhyvF+whUKTA
IronPort-HdrOrdr: A9a23:UJjQhKrELLK5syTYdvfFnl0aV5t+LNV00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssSkb6K290KnpewK4yXcH2/hsAV7EZniohILIFvAv0WKG+VPd8kLFh5dgPM
 tbAstD4ZjLfCJHZKXBkUeF+rQbsaG6GcmT7I+0pRYMcegpUdAa0+4QMHfCLqQcfngjOXNNLu
 v72iMxnUvGRZ14VLXYOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPYf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFcRcsvy5zXMISdOUmRMXee
 r30lMd1gNImjTsl1SO0FnQMs/boXATAjHZuAalaDDY0LPErXoBerR8bMRiA0DkAgMbzaFB+b
 hW0WyUrYdaACXJgTn07dnNWxZ2oFC5u2Ajl+kkj3E3a/puVJZB6YMY509bC5EGAWbz750mCv
 BnCIXG6O9Rak7yVQGTgoBD+q3kYp0IJGbPfqHCgL3g7xFG2HRii0cIzs0WmXkNsJo7Vplf/u
 zBdqBljqtHQMMaZb90QL5pe7r7NkXdBRbXdG6CK1XuE68Kf3rLtp7s+b0woOWnYoYBwpc+kI
 nIFFlYqWkxcUTzDtDm5uwAzjndBGGmGTj9wMBX4JZ0/rX6WbrwKCWGDEsjlsOxys9vdPEzm8
 zDT66+L8WTX1cGQ7w5rDEWc6MiXEUjbA==
X-IronPort-AV: E=Sophos;i="5.90,165,1643691600"; 
   d="scan'208";a="68061393"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aKUajuY+N3iZs8rlfzYgaGty55Ch0hXXRxbkwlvPvoP5eNT4+vqhWjDkNCf4nOOEiLpriDZRiUzJjVOZOO606qH3ucBECu5HhIN58+lpH8H+gC2ywpyNllJP60dofNfJVTBLG/VFHO4XP2Qr4dDlnP3MdfuAJBRtrM/vlyem+sWw9n5tNKLIFz8JQQ3f3AstAo3ZwqI7tcsFidoR9lMMKVt2h0eNvqRdheZ2SjtknDjqh7qW0xqcYbIcs8em7q4CRWJv5G7CNMlxMcxr/lNV3o366yE1tmOS9hHjVVXyZOyqX8YdjX2Vm4XBsM+YrG4JrsBBjEqsD1e2RkyAiuC4QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2aTTN9KkmLe/89SdJcuhcVDK4rHqfC9Nq6ouy0DZJ9U=;
 b=cAR0mXe9pG482cnualwvoiu8cohbskG+lSDF+e0q/3QpWwwJYlbCkPO1wOdmz0psc+DyIvt3tAS13tm2hMckLtYGQ9Tus6/B0/iOwHkGBe6PgDZ9kD70SewLJhsxMswTZQDk5vfYaOj9WHUsmTgXBnNMDmFYWhG6YDLSAF5arOm2yXTdYgJyvi0Sl8JNWzsFTBtLiolbDDqqe7peB6BGC3WeOwp9QkESv6/yZ8kPNRkphok6Wiyzs7inH6R8jIp+3OiJahQ5LPYQEJ90r66A9q332uhSGbQz/nYtW1Eyq2BKnHWz1iwXVR/+4+WJEmgWoEZ61ZmFJO3ORUzYfILrqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2aTTN9KkmLe/89SdJcuhcVDK4rHqfC9Nq6ouy0DZJ9U=;
 b=P/eB8N9IWphbUDJ+ufF/nY8n0VfEjh6lZnBg0iSputvnBN1Q9u4KX8jzxA3p07MHvqu3R2j24PkDUBparMQOmdu0RK6V4lUgI44GgGwjq4Kn1xNodUwN5sdATBSkZws4mcr7lBM2H8EIAZ1P6vhT3NaI3J55wMMshSqHqCTohSE=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Bjoern Doebel <doebel@amazon.de>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Michael Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>, "Roger
 Pau Monne" <roger.pau@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH 1/2] Livepatch: resolve old address before function
 verification
Thread-Topic: [PATCH 1/2] Livepatch: resolve old address before function
 verification
Thread-Index: AQHYMhoeZ5kcmjNdQkmxqYcmYis536y1jlWT
Date: Tue, 8 Mar 2022 14:33:16 +0000
Message-ID: <PH0PR03MB6382C404E350EC993C44559CF0099@PH0PR03MB6382.namprd03.prod.outlook.com>
References: <cover.1646653825.git.doebel@amazon.de>
 <15b092bb3af6e32f72ee8fca45317687d23b8be4.1646653825.git.doebel@amazon.de>
In-Reply-To: <15b092bb3af6e32f72ee8fca45317687d23b8be4.1646653825.git.doebel@amazon.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: 54994743-86bd-f76a-1355-5676f724ba4a
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb2563ab-81e6-44af-5d36-08da0110958f
x-ms-traffictypediagnostic: SA1PR03MB6370:EE_
x-microsoft-antispam-prvs: <SA1PR03MB637028273636C561BB16F8A5F0099@SA1PR03MB6370.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mK2qR5bzFFkK4vePuW5mEFn/dA+uA/k5wP6kn0rUt4Dh+49qMasxrLmulKhUic7Yx4O1DS5Ro+3eVbNUA54DZyOAdWvKDS8lK2PkgMIA/MlO+6vrm+xq5zVT/SW57NAYpxoh11NxMUCjLq6bWUz/TRxJP5R5unYqoSJkzSUXfcbpXWtWAxr5hg8ecLuBDnSkCQSOuB3/oVbZbzMQl/xtaOp0TvvwpwJMdj36rfG9FjLRNdNHRcPaD2VtEBPQtdn7XPlV9KtwBScvQv3wuu1sYcrF6P+Wm9E8rP/VVvWr6puhWv5UdDQ4hUbsju9V77+uzd+PW2PlfEgOID7e/k6+w0hUbiL06eKNy/Xy/3K+0CuIgl4qH5b40eSQbfW6Rx5xXcXhOhPMapKbtJu64Zp+X7fVYJqrrCrHQfSY7ox5G75PTIRSSfPwyK8IrIpLECzZwkhJrQETqg0HbAof3lbc5NOMgN8NbQ2ozgeyjVdvArqU8eTmaFFwuRE/zXz60wHhSAWqrMsfn3elWsHFUFZ7SOTbXir4T8RizGHv5sXRwKGLalSyZSaqS8DmEDgRpsuq+4eu+VlGXR7ZfrCuTYyDBbjZE7yKuhOZTuM6uCDpJ1Q3PZ/ypx4ApEovQsNc9ezif/eiHujN8NzU5bkcS4cHxAnv4T8uOx8yiznE9ylDf1lVEXkH+vScgoJgmAnj0TUJJllmAWZB+OhtwPD28Okqpg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6382.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(15650500001)(71200400001)(44832011)(38100700002)(122000001)(26005)(5660300002)(186003)(8936002)(82960400001)(8676002)(33656002)(2906002)(52536014)(6506007)(86362001)(64756008)(53546011)(7696005)(91956017)(66946007)(9686003)(76116006)(66446008)(66556008)(66476007)(38070700005)(508600001)(4326008)(55016003)(83380400001)(110136005)(316002)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?7aKCyXQCrTjDrslnm42Iqvc2qmsieiNNWTkND4VT+dUPvnKoPlX0BjM66C?=
 =?iso-8859-1?Q?r3UW7OQe5Q3c1/V46ONQ+kCoNb8Xa3+oZwXXAeWv27vfz40UWqbXGsdCW6?=
 =?iso-8859-1?Q?suqKLigI+m1zS1fsw8y+/7+nTt/6uQcXFR0OFTu8QDgwjq4DVkI02PKKeq?=
 =?iso-8859-1?Q?Csu7jKcQlfC0aLwExTY4Fi0dsZqn8vKwtjGkPJnca5QR4xQdcph9AxIZ0K?=
 =?iso-8859-1?Q?MMBxcN3a8r1h/dKHCIc7jCzfd4eMxFHM7sYRPb5BIdR9XQ778eXPUiYmek?=
 =?iso-8859-1?Q?p3/SdfZXN1M+QnC+q/d46LJ8EAho8DtYaqdjc1siPtAgDCbwJdT711kpJ/?=
 =?iso-8859-1?Q?suwJOTgOjebNhp7ZdTBhct/giVgpV95Y979asoOWZZpud7w5oIDBN9lp8Y?=
 =?iso-8859-1?Q?7ZMoDk16FiTn5CU+9ct06pmmu9y2AvbFgeaNhk/o+G6vZd21CCBexwgN1M?=
 =?iso-8859-1?Q?tAMUmfIvDZcK943K9JhLZma9w5dpoduMvJ/eTnOo7Adfevx0sGL5dM3egi?=
 =?iso-8859-1?Q?oxVGbasGHIfe86HzgGmYV455UW8PAyAIEVGZuwtlbJUdcxOtX6X39rWF1r?=
 =?iso-8859-1?Q?+LY/1RcmftuaCbl/fRuJ1DcgB7RqXJ9KWqUk2ehji5mQBjY/l9kMl71jw4?=
 =?iso-8859-1?Q?FQMf7ZLWall8k/spW3j3Ad248okoMk2Hi2WDdm+eZvl2D+bOGZFg9+rqei?=
 =?iso-8859-1?Q?UgG/xBZ8asU2glA1D87+onlh4j18M4vLOMUJc2KoWEPW9W9GdCYOQKfhgo?=
 =?iso-8859-1?Q?5XR0O0AEvYpwzYKrmsPvliV/HzNuK/xUEi995NIPl9r1iJZVFiZFCgAQc6?=
 =?iso-8859-1?Q?6eu5MRLYlzoJyO6ozL6nSA4c69ByJ7LsaYK0rX0wDaf506t4N7EG+/cykE?=
 =?iso-8859-1?Q?gpUPbNGwOjo6KZCC5eBjS43CYakz3NNYludeU/gDv5e9QHdL1ljTkd585s?=
 =?iso-8859-1?Q?Eub5TIuamnmRTvHNNyRvbzCFEtpuUzL1zBpLrpHwlIFnnHfxoaay5lrU6r?=
 =?iso-8859-1?Q?B1ktxaNyGUbi6xNwuLNBPBED7FvYPWsZDI0eVPnf3j3kNl2PzUNwtkMMOa?=
 =?iso-8859-1?Q?69oxOkVlp4I4VOrnuVpvn+lVJZz8RI9b0ykL2ECi+9s6IS9XoOtMnPG/qO?=
 =?iso-8859-1?Q?8gCKuk73z9UINfl4l+Zb+1FIQr440jAjl9CA58JC92gvDZcDAQhNwreCOk?=
 =?iso-8859-1?Q?3y1F+RcBwF7XIvZQ5qSAcFkJWTyvm6GZZOhBsbzcp/azYFh8fK/f0QqEWJ?=
 =?iso-8859-1?Q?oqfRUIFqd+Q8g4SCEczFHxQGOpzs1CoJ/msBYyQsyPK47/CNfEpJxccLYC?=
 =?iso-8859-1?Q?VN+TGDtxSOiXjWKvSMRnJcXLfcWAj4rXoSNYXxBSYgmbfh8pKmwqfJ+vH3?=
 =?iso-8859-1?Q?jdiFRP0UTFKMwwIZYbqs0SjPLX3gaglidqErvCPeOhtaUIjjTVVxGBNr04?=
 =?iso-8859-1?Q?D6I2bnhn8tAqkns42gldwZt9qp7CwVSE8DTgeh2j0WhVn0A5Z3YhQzdCDL?=
 =?iso-8859-1?Q?dBuaQ0UeVLYhnZBO8ukq6HbztORit9/XrkEi0+c4HI2trYxtmP7aAaXwuM?=
 =?iso-8859-1?Q?CYUTqUixCGix0K7wWuZcZVl4KrmpLmuYVY3uQkER5YniE0gb0QR0KS4lq5?=
 =?iso-8859-1?Q?s4/iVyKiC4XWG8eRXyK5Z6Q1lQTYWJ8jUZ+qP700H2aYOD9mCCZgoBhh2p?=
 =?iso-8859-1?Q?fmGr1PqQM2UWkpsLdRS76AdaHcOZTdCdE+M5TaR3fyjZa4j62RVITb+Trn?=
 =?iso-8859-1?Q?p5rQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6382.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb2563ab-81e6-44af-5d36-08da0110958f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2022 14:33:16.6026
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SNzYAVWl9hNWcjcAaCKyQ2sFbCkWiKYF09CLPtPIFDa7Z2ILpnF0gf1AOyrwJJO3xjEACK3ubE8OW8frl5GYlMmgNWoG6AIdxHb5kwn+mBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6370
X-OriginatorOrg: citrix.com

> From: Bjoern Doebel <doebel@amazon.de>=0A=
> Sent: Monday, March 7, 2022 11:53 AM=0A=
> To: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>=0A=
> Cc: Michael Kurth <mku@amazon.de>; Martin Pohlack <mpohlack@amazon.de>; R=
oger Pau Monne <roger.pau@citrix.com>; Andrew Cooper <Andrew.Cooper3@citrix=
.com>; Bjoern Doebel <doebel@amazon.de>; Konrad Rzeszutek Wilk <konrad.wilk=
@oracle.com>; Ross Lagerwall <ross.lagerwall@citrix.com>=0A=
> Subject: [PATCH 1/2] Livepatch: resolve old address before function verif=
ication =0A=
>  =0A=
> When verifying that a livepatch can be applied, we may as well want to=0A=
> inspect the target function to be patched. To do so, we need to resolve=
=0A=
> this function's address before running the arch-specific=0A=
> livepatch_verify hook.=0A=
> =0A=
> Signed-off-by: Bjoern Doebel <doebel@amazon.de>=0A=
> CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>=0A=
> CC: Ross Lagerwall <ross.lagerwall@citrix.com>=0A=
> ---=0A=
>  xen/common/livepatch.c | 4 ++--=0A=
>  1 file changed, 2 insertions(+), 2 deletions(-)=0A=
> =0A=
> diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c=0A=
> index ec301a9f12..be2cf75c2d 100644=0A=
> --- a/xen/common/livepatch.c=0A=
> +++ b/xen/common/livepatch.c=0A=
> @@ -684,11 +684,11 @@ static int prepare_payload(struct payload *payload,=
=0A=
>                  return -EINVAL;=0A=
>              }=0A=
>  =0A=
> -            rc =3D arch_livepatch_verify_func(f);=0A=
> +            rc =3D resolve_old_address(f, elf);=0A=
>              if ( rc )=0A=
>                  return rc;=0A=
>  =0A=
> -            rc =3D resolve_old_address(f, elf);=0A=
> +            rc =3D arch_livepatch_verify_func(f);=0A=
>              if ( rc )=0A=
>                  return rc;=0A=
>  =0A=
> -- =0A=
> 2.32.0=0A=
=0A=
Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>=

