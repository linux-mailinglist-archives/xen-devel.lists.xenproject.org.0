Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A975C25247
	for <lists+xen-devel@lfdr.de>; Fri, 31 Oct 2025 14:02:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1154282.1484358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEokx-0004ox-8U; Fri, 31 Oct 2025 13:01:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1154282.1484358; Fri, 31 Oct 2025 13:01:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEokx-0004m1-3x; Fri, 31 Oct 2025 13:01:27 +0000
Received: by outflank-mailman (input) for mailman id 1154282;
 Fri, 31 Oct 2025 13:01:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ix4U=5I=siemens.com=haseeb.ashraf@srs-se1.protection.inumbo.net>)
 id 1vEokv-0004lu-Ex
 for xen-devel@lists.xenproject.org; Fri, 31 Oct 2025 13:01:25 +0000
Received: from TYPPR03CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c405::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b339e552-b659-11f0-9d16-b5c5bf9af7f9;
 Fri, 31 Oct 2025 14:01:22 +0100 (CET)
Received: from KL1PR0601MB4588.apcprd06.prod.outlook.com
 (2603:1096:820:87::11) by TYUPR06MB6174.apcprd06.prod.outlook.com
 (2603:1096:400:350::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 13:01:15 +0000
Received: from KL1PR0601MB4588.apcprd06.prod.outlook.com
 ([fe80::3f19:282d:5fe2:f523]) by KL1PR0601MB4588.apcprd06.prod.outlook.com
 ([fe80::3f19:282d:5fe2:f523%3]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 13:01:15 +0000
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
X-Inumbo-ID: b339e552-b659-11f0-9d16-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BFfXLDzMhyKgME5gH+4LDvCofxFdVtxXwEpwX29+ptcYcOiQENmurY42ZUMx65T0O/YDW/L0S2qts+ApR21aHeyqSeFnBwT5uBBmo5HuqrkYxf5fyUaehlSmxiQOxdd3xG09CeEgmdW8WicYrFLBlN526DbpiPahviwORN5tDAGghs3EWlUdQWE4XSIxwP0xdY/J1XpiZ8cOfUYyvUtXYJLnNCJ+a41JG5r/EA63hKGtwnzBc3Cb53NT4zmXEZkvruToFqP2B65zWuj4pGsfh5nhiVs2o/waLJ2rOk8xhK+r7oikXiOfTPm4TtpkN+xupBtjofB5uiAFUQreo/hNYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J/1Z5GDfgxPUdvJl42/unphW0EUmCkCNBb3VXSVYTww=;
 b=HgHiJRnmxc2QjkG+yyiXAuO21YrdLhiqEQiVqRAv6m9YlhQDLopyEj8RwHpDM2kmrfQQJvvSBstrV2dboDqKge2XaMA0jr70bCnrB+f+pjwjLMKxecxRNE9rYTXdeMGyazc68JSNGcEKscBw2d6mfsdIIQ2fjQHG5J+HH89ihdtaWzoYx7JyzvoByEX6wV6eSZNQxUcFefglyYFKgdJzZNmPvAnbp+fRVXy+A6EaD6CQTxbOieIg6x8vqgALCQfLBBWl6vo+J2qH+c+CgVTUskVwHccxOZDYEK8rUHk1GMP08fjKzKC+fcRGfwkYvm4WCxQhEDb5D4HyJd3JNql0mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/1Z5GDfgxPUdvJl42/unphW0EUmCkCNBb3VXSVYTww=;
 b=dOJgIiwRUPkAE9Lu+AMj0EQrzLco8hc/mElyLH8aFW/Vv196E8CQdyiy305F5rrMd5Qptur5lOd3noIBYeREQdJ7dfspfrzoN6rUQe7OcF4NbjN4knyLwwI1NeP/JL/7cT4bHAPlAhHz9lzWra2OB7FDh0gErxjsG8S8xsAJMtlFcuDVMQk798PGfojwEpqrlr0fBSXMTIKyMAhuqdBGE2Ip3nP+ES7BRu1GLpz3FBuqwLlVlnhHjlifCPr09L0CtPr1Nm12nu2FMY3voapB8HvJJQX2JYqyi0VM+3pI+BZH0rBMcLOHNb38RKR0GRxjN9K2+om+nsdfuekQss1oow==
From: "haseeb.ashraf@siemens.com" <haseeb.ashraf@siemens.com>
To: Julien Grall <julien@xen.org>, Mohamed Mediouni <mohamed@unpredictable.fr>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, "Driscoll, Dan"
	<dan.driscoll@siemens.com>, "Bachtel, Andrew" <andrew.bachtel@siemens.com>,
	"fahad.arslan@siemens.com" <fahad.arslan@siemens.com>,
	"noor.ahsan@siemens.com" <noor.ahsan@siemens.com>,
	"brian.sheppard@siemens.com" <brian.sheppard@siemens.com>
Subject: Re: Limitations for Running Xen on KVM Arm64
Thread-Topic: Limitations for Running Xen on KVM Arm64
Thread-Index:
 AQHcSVi3paxtnyIgIkOf6jhuJCbvfrTalv6cgABtkgCAAFoJgIAABxcAgACWJ4CAABonww==
Date: Fri, 31 Oct 2025 13:01:15 +0000
Message-ID:
 <TYZPR06MB4580126B98C6A38AA710F597E6F8A@TYZPR06MB4580.apcprd06.prod.outlook.com>
References:
 <KL1PR0601MB4588D25A95D680640A80F2CAE6FBA@KL1PR0601MB4588.apcprd06.prod.outlook.com>
 <KL1PR0601MB45885505ECBBE9262C2B25E0E6FBA@KL1PR0601MB4588.apcprd06.prod.outlook.com>
 <FC5C66FD-8554-4F46-8546-B27DE76C8EEF@unpredictable.fr>
 <2b00a98f-6fee-4341-92bd-25909ebb6e36@xen.org>
 <CA753BD2-31FA-480D-B32A-2125F0F4981D@unpredictable.fr>
 <fc181349-d743-4ef0-bcd2-01c04d2a463e@xen.org>
In-Reply-To: <fc181349-d743-4ef0-bcd2-01c04d2a463e@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=True;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-10-31T13:01:14.618Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=C1
 -
 Restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=1;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0601MB4588:EE_|TYUPR06MB6174:EE_
x-ms-office365-filtering-correlation-id: d6fcbee7-3de0-4533-1338-08de187d933b
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|39142699007|31052699007|366016|1800799024|38070700021|8096899003|7053199007;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?w/3kTir0DyEDqq8RcVO4vMP69Zm3XSMnn2bwwFewUl8d5DHKwzKjT/H1?=
 =?Windows-1252?Q?dHP3f+F0sxNqlwdYEL9f/vn66Dlgo0RUAXPUDi8D/HwV3tUv5IdU2tej?=
 =?Windows-1252?Q?oXGiQE8zAVVFqBnxlXdtVADdX9sd60rrlDcOipLlKMMg3T/w4+zwqhGC?=
 =?Windows-1252?Q?wawoFLs4Bq5mXMq0YgKwsxHhGk70XNfjAleMlVHv6bEwn6rO+UHN8Q8j?=
 =?Windows-1252?Q?BcG5O4rNVNLN8V6isWlfkOmxOxhTF1kMc5P8y70YPvpgdYAIjyNy53+R?=
 =?Windows-1252?Q?2HGpJ4mbO6Co1vsN+zspp3YjGd++zdXQw19mxC2aVKSwV1lxRaSfoJDh?=
 =?Windows-1252?Q?N98Q1fq+ujdvymApQQgWgzxmoqB517I66WFWyhLuRXXOO86jxHiIfvpp?=
 =?Windows-1252?Q?sWfcl5+vE5uvJYenyYA1jWcRB3G/i1hNk5xaE98NZ/DVR3eOhY+lFBQF?=
 =?Windows-1252?Q?GelO/4oK21sow5kDQUy8nAFCPv7DI9VhYPxu9fgysvdOOmC6ldulJDLP?=
 =?Windows-1252?Q?VuM3tMkpHGzgEmUPks6F2LK2ZUaVhgc65hRVCzveFRn5yLsgTNRfonM5?=
 =?Windows-1252?Q?b+B1YVx7cS/wC8Z7tA2uMP/8Zo87QnBCWNV3AIGMRGbiVW/sg9QBdRA7?=
 =?Windows-1252?Q?3TKFbMPVdj3W4RSADyRSFDSNoD5KyoyE4xEe2N9kG7lUcpgegdWgwX4F?=
 =?Windows-1252?Q?ShcLYAbTgGjgQVp1HC83ZmUx7UAEH8Ad9IwZ+Z5zN3WWRiBhcV1gi10e?=
 =?Windows-1252?Q?ezc3Cc8blHfcusVACJogfOHmnFnkpfUQQmqrgAm5C8R263jQrQIq6i5f?=
 =?Windows-1252?Q?tORAy06JAu6fylxPPq29vlEcjjUaSNhg4YknEUNyO9z6l8eCM7Ve86Qt?=
 =?Windows-1252?Q?tJmHE79A0VMkepCgU1lU6fhf5HfW1q/AB/9eRZLEg9IkToesTn1TXHmm?=
 =?Windows-1252?Q?wVdM+nM5fhBC7AwxYKJZEkQ9xA5YrwwQmqC0i+CrxNxJ0hBlrJqQ/JaI?=
 =?Windows-1252?Q?rCNF2lGc0lGKsfuf6YhlUCSchT0hr76yKApQfTi8+SSSe0hlYrvAFmwk?=
 =?Windows-1252?Q?KBuU+dVvH19V19zZyuZ4ftxIOZN+elk1nfxvZUdn9yvbY661IQ+s57Fj?=
 =?Windows-1252?Q?IyvnWAc4jMHV/pazzAAhRb+/rvJ59QO0k2tAQFFKBTjMku8LV0803vhE?=
 =?Windows-1252?Q?tkfA/NiuEVx+aKZP7nENf/9n5a6/m9E+QHeQhYGuIV2Lb5rLA39XDE/Y?=
 =?Windows-1252?Q?NiOVmQWkCRFYUmC4pducnlYdjkoIvNQsbpMGqw61uUkF08xzZ06jZawu?=
 =?Windows-1252?Q?H35j2JCUn6wf7H44AuGaLZupfEX+iCBo2Yk9OQ24sdOxGc+0yzgi6vKx?=
 =?Windows-1252?Q?qa9vrFz0Xf8tJPm8ScWEQI2T5JzhWI/q4BrpuShhb2/N3PIYGqpUMKIK?=
 =?Windows-1252?Q?48w4Q8M2Rs9+oIDiCQGk2s4whLCb86zK6F/2RXrwDLTo8GdasKWFhJnL?=
 =?Windows-1252?Q?09VYNXJz/R1mBoIG9N1oxmpX3BbdfA69BlT5S3lpnnJ1oryO6gW4KA80?=
 =?Windows-1252?Q?3fQ62fri6LF3mvlD1tqw30BlP2MbQaQQfyh4eSErPi3IK8oVEmEZ7D+l?=
 =?Windows-1252?Q?2/8lF8KIg5DaZMl6XL6wxpXg?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB4588.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(39142699007)(31052699007)(366016)(1800799024)(38070700021)(8096899003)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?ktEw2h9o+3FsxzEeP0xE3etnjfetYxCLqUr7fjvnJLyz+1H2BKj1rWmg?=
 =?Windows-1252?Q?cJf087nmgmWUOwbyo5sliEcQPV4QyxQpUzPUlhW5Ij9GNtsUhhgGHfmK?=
 =?Windows-1252?Q?teK9tpikrwx+AugsDGH558GAhBBcvpRyxl1EV3Ohf2CsfWoGr2MfjZvh?=
 =?Windows-1252?Q?kvdNZlubaYDGZCUOXhJ6txYxuXQ/5gcR9vVPN4/7l57rtA+HpDoT+suJ?=
 =?Windows-1252?Q?N2hcKXCwcBYuyw2eW96jrTl1FC5q2Wh0ewT6CT+GawiMcN1ZK4gq/OMA?=
 =?Windows-1252?Q?pesAwSvvJAssjQ/TbvOuvCTnx7wlPRhXHXxhS9R96ElwqndG+ldcuLfO?=
 =?Windows-1252?Q?1MNbzKSdtu/M36/Y4Cb46UEMKQS6KNBNIo3nZIqmS2GZXD5HdVGqXFNq?=
 =?Windows-1252?Q?maUx+0cyOKpeSVLs8mqbarnYu+Y25mYgkU5J5XvKha7eYdzb90oTN4eB?=
 =?Windows-1252?Q?NBbZWOMdVVS738LwG9qRH0mDAGRTlVTeQ0o+xiU0nrpZy+z784iJcuXn?=
 =?Windows-1252?Q?2R3ylDAO2ahJ3BjD552BwdRaDBz81GF1f/ivdFGkJJ/vmw1fbdabJD5d?=
 =?Windows-1252?Q?nMUy3f/k4IVWlnneL/EOqWVdyehoEyfRihxcn+lpd+c3uwTu/543RSga?=
 =?Windows-1252?Q?jQwapxWVO084F8pUQpVF61R68mRwbj83niZ4d42aYSyxyrVFo3v3CHL7?=
 =?Windows-1252?Q?SuFEJDuwGsq2FPhVS7hMLx108SSlSJ2BTLa9ApgZgNjvh1zGx10uU4FA?=
 =?Windows-1252?Q?NCkLdr5NO7VPIzxe9XCoc3c7DdLIR7UI6nNsmn/x6f8Yn0ktE4JbZHQ4?=
 =?Windows-1252?Q?o2CmqdPOJurgvfcA55Bcf2Hl0iqYqpqqmJMEL5qKhOCV9GMFxtIitJbS?=
 =?Windows-1252?Q?rnT8TWtRTW8Xl7YgLe1fytAuRHjHyv7b1q3qIOM4xkIMleAeJWiHJf6z?=
 =?Windows-1252?Q?925LJJhgz31oKOywXL8dvItnVbeZhEBLv6nNkPqKSkfX/Cn00evxQerd?=
 =?Windows-1252?Q?Sd02sNF9V67xy2WWAaYUJxgMKY4ccAhv1x93NYG8Yy+ldAkVAtpGuSor?=
 =?Windows-1252?Q?/cZ+SS5YBefgIkH+9hh4cpgvVyp1fX6uttTe7qqfVb6flzQD2Yn7zOOq?=
 =?Windows-1252?Q?xeZjEY8dydg65QHc5QZ+S7f9G7zPLRfZOcqGYa41ELc2AHISZiLk3n9w?=
 =?Windows-1252?Q?5qToyuM/6F0JU9bonotP6jS5rbk87jkiZVCAQXEWy3/J/b21CBp5R3yK?=
 =?Windows-1252?Q?dfPuUweDlciBXtV2OSWQkjiao34QKNVxz39ba1mA5N+6IhcI9eT4F7EV?=
 =?Windows-1252?Q?pfXPApfA9fpo0W5CXrnaDBXXHYj7Jmoksv4g5lmsVTCjtj3sI6bRSopj?=
 =?Windows-1252?Q?W2sbL5rFuQK30rq9g6mkEOo88xq5FmvGdNyeNt1bVzLNcK2wnvFwOLIm?=
 =?Windows-1252?Q?xyzDLWL3+0qQvn8wxKR7kc69rvUYUmBN6A65Oxm6R4/T+2IJHlKr9CPi?=
 =?Windows-1252?Q?yfuU7JNmc7CsN3iIernnJ1D00oHmuEZOOShAAd9sSNMZ1yBdkFYDTxpd?=
 =?Windows-1252?Q?GUtTn5luJ1VPru88j3eCw2El8GctLdhOSiJeEI9RlZeFBZi1cAq3fc9x?=
 =?Windows-1252?Q?TcLh8R25BJs5FHdoYh2lPpqqXfDY3R/3fQCNvCCh55qJPdMAFy8SFoCN?=
 =?Windows-1252?Q?LCTjAwJ1bMHhv7uOTz0SmY1z4hOYedD5?=
Content-Type: multipart/alternative;
	boundary="_000_TYZPR06MB4580126B98C6A38AA710F597E6F8ATYZPR06MB4580apcp_"
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4588.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6fcbee7-3de0-4533-1338-08de187d933b
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2025 13:01:15.3237
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v0s0fsq/mR/7lddmsukuFmJA9c15+ortFkxIOLbFDSqZ0/kaD0wl3BfNfimeuJpS3kY5b0TfucxpGNBbxRT3wcqjtBXjusjQL3fgXDMZ4HE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6174

--_000_TYZPR06MB4580126B98C6A38AA710F597E6F8ATYZPR06MB4580apcp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hello,

Thanks for your reply.

You mean Graviton4 (for reference to others, from a bare metal instance)? I=
nteresting to see people caring about nested virt there :) - and hopefully =
using it wasn=92t too much of a pain for you to deal with.
Yes, I am using Graviton4 (r8g.metal-24xl). Nope, it wasn't much of an issu=
e to use G4.
KVM has a similar logic see "last_vcpu_ran" and "__kvm_flush_cpu_context()"=
. That said... they are using "vmalle1" whereas we are using "vmalls12e1". =
So maybe we can relax it. Not sure if this would make any difference for th=
e performance though.
I have seen no such performance issue with nested KVM. For Xen, if this can=
 be relaxed from vmalls12e1 to vmalle1, this would still be a huge performa=
nce improvement. I used Ftrace to get execution time of each of these handl=
er functions:
handle_vmalls12e1is() min-max =3D 1464441 - 9495486 us
handle_tlbi_el1() min-max =3D 10 - 27 us

So, to summarize using HCR_EL2.FB (which Xen already enables?) and then usi=
ng vmalle1 instead of vmalls12e1 should resolve the issue-2 for vCPUs switc=
hing on pCPUs.

Coming back to issue-1, what do you think about creating a batch version of=
 hypercall XENMEM_remove_from_physmap (other batch versions exist such as f=
or XENMEM_add_to_physmap) and doing the TLB invalidation only once per this=
 hypercall? I just realized that ripas2e1 is a range TLBI instruction which=
 is only supported after Armv8.4 indicated by ID_AA64ISAR0_EL1.TLB =3D=3D 2=
. So, on older architectures, full stage-2 invalidation would be required. =
For an architecture independent solution, creating a batch version seems to=
 be a better way.

Regards,
Haseeb
________________________________
From: Julien Grall <julien@xen.org>
Sent: Friday, October 31, 2025 2:18 PM
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: Ashraf, Haseeb (DI SW EDA HAV SLS EPS RTOS LIN) <haseeb.ashraf@siemens.=
com>; xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>; Volo=
dymyr_Babchuk@epam.com <Volodymyr_Babchuk@epam.com>
Subject: Re: Limitations for Running Xen on KVM Arm64



On 31/10/2025 00:20, Mohamed Mediouni wrote:
>
>
>> On 31. Oct 2025, at 00:55, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Mohamed,
>>
>> On 30/10/2025 18:33, Mohamed Mediouni wrote:
>>>> On 30. Oct 2025, at 14:41, haseeb.ashraf@siemens.com wrote:
>>>>
>>>> Adding @julien@xen.org and replying to his questions he asked over #Xe=
nDevel:matrix.org.
>>>>
>>>> can you add some details why the implementation cannot be optimized in=
 KVM? Asking because I have never seen such issue when running Xen on QEMU =
(without nested virt enabled).
>>>> AFAIK when Xen is run on QEMU without virtualization, then instruction=
s are emulated in QEMU while with KVM, ideally the instruction should run d=
irectly on hardware except in some special cases (those trapped by FGT/CGT)=
. Such as this one where KVM maintains shadow page tables for each VM. It t=
raps these instructions and emulates them with callback such as handle_vmal=
ls12e1is(). The way this callback is implemented, it has to iterate over th=
e whole address space and clean-up the page tables which is a costly operat=
ion. Regardless of this, it should still be optimized in Xen as invalidatin=
g a selective range would be much better than invalidating a whole range of=
 48-bit address space.
>>>> Some details about your platform and use case would be helpful. I am i=
nterested to know whether you are using all the features for nested virt.
>>>> I am using AWS G4. My use case is to run Xen as guest hypervisor. Yes,=
 most of the features are enabled except VHE or those which are disabled by=
 KVM.
>>> Hello,
>>> You mean Graviton4 (for reference to others, from a bare metal instance=
)? Interesting to see people caring about nested virt there :) - and hopefu=
lly using it wasn=92t too much of a pain for you to deal with.
>>>>
>>>> ; switch to current VMID
>>>> tlbi rvae1, guest_vaddr ; first invalidate stage-1 TLB by guest VA for=
 current VMID
>>>> tlbi ripas2e1, guest_paddr ; then invalidate stage-2 TLB by IPA range =
for current VMID
>>>> dsb ish
>>>> isb
>>>> ; switch back the VMID
>>>>      =95 This is where I am not quite sure and I was hoping that if so=
meone with Arm expertise could sign off on this so that I can work on its i=
mplementation in Xen. This will be an optimization not only for virtualized=
 hardware but also in general for Xen on arm64 machines.
>>>>
>>> Note that the documentation says
>>>> The invalidation is not required to apply to caching structures that c=
ombine stage 1 and stage 2 translation table entries.
>>> for TLBIP RIPAS2E1
>>>>      =95 The second place in Xen where this is problematic is when mul=
tiple vCPUs of the same domain juggle on single pCPU, TLBs are invalidated =
everytime a different vCPU runs on a pCPU. I do not know how this can be op=
timized. Any support on this is appreciated.
>>> One way to handle this is every invalidate within the VM a broadcast TL=
B invalidate (HCR_EL2.FB is what you=92re looking for) and then forego that=
 TLB maintenance as it=92s no longer necessary. This should not have a prac=
tical performance impact.
>>
>> To confirm my understanding, you are suggesting to rely on the L2 guest =
to send the TLB flush. Did I understanding correctly? If so, wouldn't this =
open a security hole because a misbehaving guest may never send the TLB flu=
sh?
>>
> Hello,
>
> HCR_EL2.FB can be used to make every TLB invalidate the guest issues (whi=
ch is a stage1 one) a broadcast TLB invalidate.

Xen already sets HCR_EL2.FB. But I believe this is only solving the
problem where the vCPU is moved to another pCPU. This doesn't solve the
problem where two vCPUs from the same VM is sharing the same pCPU.

Per the Arm Arm each CPU have their own private TLBs. So we have to
flush between vCPU of the same domains to avoid translations from vCPU 1
to "leak" to the vCPU 2 (they may have confliected page-tables).

KVM has a similar logic see "last_vcpu_ran" and
"__kvm_flush_cpu_context()". That said... they are using "vmalle1"
whereas we are using "vmalls12e1". So maybe we can relax it. Not sure if
this would make any difference for the performance though.

Cheers,

--
Julien Grall


--_000_TYZPR06MB4580126B98C6A38AA710F597E6F8ATYZPR06MB4580apcp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
Hello,</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
Thanks for your reply.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<blockquote style=3D"margin-left: 0.8ex; padding-left: 1ex; border-left: 3p=
x solid rgb(200, 200, 200);">
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
You mean Graviton4 (for reference to others, from a bare metal instance)? I=
nteresting to see people caring about nested virt there :) - and hopefully =
using it wasn=92t too much of a pain for you to deal with.</div>
</blockquote>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
Yes, I am using Graviton4 (r8g.metal-24xl). Nope, it wasn't much of an issu=
e to use G4.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
<tt class=3D"elementToProof">
<blockquote style=3D"margin-left: 0.8ex; padding-left: 1ex; border-left: 3p=
x solid rgb(200, 200, 200);" class=3D"elementToProof">
<div class=3D"elementToProof"><span style=3D"color: rgb(102, 102, 102);">KV=
M has a similar logic see &quot;last_vcpu_ran&quot; and&nbsp;&quot;__kvm_fl=
ush_cpu_context()&quot;. That said... they are using &quot;vmalle1&quot;&nb=
sp;whereas we are using &quot;vmalls12e1&quot;. So maybe we can relax it. N=
ot sure if&nbsp;this
 would make any difference for the performance though.</span></div>
</blockquote>
<div class=3D"elementToProof"></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif;">I have seen no such performance issue with nested KVM. For Xe=
n, if this can be relaxed from
<code style=3D"font-family: Arial, Helvetica, sans-serif;">vmalls12e1</code=
> to <code style=3D"font-family: Arial, Helvetica, sans-serif;">
vmalle1</code>, this would still be a huge performance&nbsp;improvement. I =
used Ftrace to get execution time of each of these handler functions:</span=
></div>
<div class=3D"elementToProof"></div>
<div class=3D"elementToProof"></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif;">handle_vmalls12e1is()&nbsp;min-max =3D&nbsp;1464441 - 9495486=
 us</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif;">handle_tlbi_el1() min-max =3D 10 - 27 us</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif;"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif;">So, to summarize using HCR_EL2.FB (which Xen already enables?=
) and then using vmalle1 instead of vmalls12e1&nbsp;should resolve the issu=
e-2 for vCPUs switching on pCPUs.</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif;"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif;">Coming back to issue-1, what do you think about creating a ba=
tch version of hypercall XENMEM_remove_from_physmap (other batch versions e=
xist such as for
</span><span style=3D"font-family: Arial, Helvetica, sans-serif; color: rgb=
(0, 0, 0);">XENMEM_add_to_physmap</span><span style=3D"font-family: Arial, =
Helvetica, sans-serif;">) and doing the TLB invalidation only once per this=
 hypercall? I just realized that&nbsp;ripas2e1
 is a range TLBI instruction which is only supported after Armv8.4 indicate=
d by&nbsp;ID_AA64ISAR0_EL1.TLB =3D=3D 2. So, on older architectures, full s=
tage-2 invalidation would be required.&nbsp;For an architecture independent=
 solution, creating a batch version seems&nbsp;to be
 a better way.</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif;"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif;">Regards,</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Arial, Helvetica,=
 sans-serif;">Haseeb</span></div>
<div class=3D"elementToProof"></div>
<div class=3D"elementToProof"></div>
<div class=3D"elementToProof"></div>
</tt></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Julien Grall &lt;juli=
en@xen.org&gt;<br>
<b>Sent:</b> Friday, October 31, 2025 2:18 PM<br>
<b>To:</b> Mohamed Mediouni &lt;mohamed@unpredictable.fr&gt;<br>
<b>Cc:</b> Ashraf, Haseeb (DI SW EDA HAV SLS EPS RTOS LIN) &lt;haseeb.ashra=
f@siemens.com&gt;; xen-devel@lists.xenproject.org &lt;xen-devel@lists.xenpr=
oject.org&gt;; Volodymyr_Babchuk@epam.com &lt;Volodymyr_Babchuk@epam.com&gt=
;<br>
<b>Subject:</b> Re: Limitations for Running Xen on KVM Arm64</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText"><br>
<br>
On 31/10/2025 00:20, Mohamed Mediouni wrote:<br>
&gt; <br>
&gt; <br>
&gt;&gt; On 31. Oct 2025, at 00:55, Julien Grall &lt;julien@xen.org&gt; wro=
te:<br>
&gt;&gt;<br>
&gt;&gt; Hi Mohamed,<br>
&gt;&gt;<br>
&gt;&gt; On 30/10/2025 18:33, Mohamed Mediouni wrote:<br>
&gt;&gt;&gt;&gt; On 30. Oct 2025, at 14:41, haseeb.ashraf@siemens.com wrote=
:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Adding @julien@xen.org and replying to his questions he as=
ked over #XenDevel:matrix.org.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; can you add some details why the implementation cannot be =
optimized in KVM? Asking because I have never seen such issue when running =
Xen on QEMU (without nested virt enabled).<br>
&gt;&gt;&gt;&gt; AFAIK when Xen is run on QEMU without virtualization, then=
 instructions are emulated in QEMU while with KVM, ideally the instruction =
should run directly on hardware except in some special cases (those trapped=
 by FGT/CGT). Such as this one where KVM maintains
 shadow page tables for each VM. It traps these instructions and emulates t=
hem with callback such as handle_vmalls12e1is(). The way this callback is i=
mplemented, it has to iterate over the whole address space and clean-up the=
 page tables which is a costly operation.
 Regardless of this, it should still be optimized in Xen as invalidating a =
selective range would be much better than invalidating a whole range of 48-=
bit address space.<br>
&gt;&gt;&gt;&gt; Some details about your platform and use case would be hel=
pful. I am interested to know whether you are using all the features for ne=
sted virt.<br>
&gt;&gt;&gt;&gt; I am using AWS G4. My use case is to run Xen as guest hype=
rvisor. Yes, most of the features are enabled except VHE or those which are=
 disabled by KVM.<br>
&gt;&gt;&gt; Hello,<br>
&gt;&gt;&gt; You mean Graviton4 (for reference to others, from a bare metal=
 instance)? Interesting to see people caring about nested virt there :) - a=
nd hopefully using it wasn=92t too much of a pain for you to deal with.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; ; switch to current VMID<br>
&gt;&gt;&gt;&gt; tlbi rvae1, guest_vaddr ; first invalidate stage-1 TLB by =
guest VA for current VMID<br>
&gt;&gt;&gt;&gt; tlbi ripas2e1, guest_paddr ; then invalidate stage-2 TLB b=
y IPA range for current VMID<br>
&gt;&gt;&gt;&gt; dsb ish<br>
&gt;&gt;&gt;&gt; isb<br>
&gt;&gt;&gt;&gt; ; switch back the VMID<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =95 This is where I am not q=
uite sure and I was hoping that if someone with Arm expertise could sign of=
f on this so that I can work on its implementation in Xen. This will be an =
optimization not only for virtualized hardware but also in general for
 Xen on arm64 machines.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; Note that the documentation says<br>
&gt;&gt;&gt;&gt; The invalidation is not required to apply to caching struc=
tures that combine stage 1 and stage 2 translation table entries.<br>
&gt;&gt;&gt; for TLBIP RIPAS2E1<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =95 The second place in Xen =
where this is problematic is when multiple vCPUs of the same domain juggle =
on single pCPU, TLBs are invalidated everytime a different vCPU runs on a p=
CPU. I do not know how this can be optimized. Any support on this is apprec=
iated.<br>
&gt;&gt;&gt; One way to handle this is every invalidate within the VM a bro=
adcast TLB invalidate (HCR_EL2.FB is what you=92re looking for) and then fo=
rego that TLB maintenance as it=92s no longer necessary. This should not ha=
ve a practical performance impact.<br>
&gt;&gt;<br>
&gt;&gt; To confirm my understanding, you are suggesting to rely on the L2 =
guest to send the TLB flush. Did I understanding correctly? If so, wouldn't=
 this open a security hole because a misbehaving guest may never send the T=
LB flush?<br>
&gt;&gt;<br>
&gt; Hello,<br>
&gt; <br>
&gt; HCR_EL2.FB can be used to make every TLB invalidate the guest issues (=
which is a stage1 one) a broadcast TLB invalidate.<br>
<br>
Xen already sets HCR_EL2.FB. But I believe this is only solving the <br>
problem where the vCPU is moved to another pCPU. This doesn't solve the <br=
>
problem where two vCPUs from the same VM is sharing the same pCPU.<br>
<br>
Per the Arm Arm each CPU have their own private TLBs. So we have to <br>
flush between vCPU of the same domains to avoid translations from vCPU 1 <b=
r>
to &quot;leak&quot; to the vCPU 2 (they may have confliected page-tables).<=
br>
<br>
KVM has a similar logic see &quot;last_vcpu_ran&quot; and <br>
&quot;__kvm_flush_cpu_context()&quot;. That said... they are using &quot;vm=
alle1&quot; <br>
whereas we are using &quot;vmalls12e1&quot;. So maybe we can relax it. Not =
sure if <br>
this would make any difference for the performance though.<br>
<br>
Cheers,<br>
<br>
-- <br>
Julien Grall<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_TYZPR06MB4580126B98C6A38AA710F597E6F8ATYZPR06MB4580apcp_--

