Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C58F4D1CA5
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 17:01:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287141.486986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRcH7-0001b0-4T; Tue, 08 Mar 2022 16:01:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287141.486986; Tue, 08 Mar 2022 16:01:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRcH7-0001Z2-12; Tue, 08 Mar 2022 16:01:25 +0000
Received: by outflank-mailman (input) for mailman id 287141;
 Tue, 08 Mar 2022 16:01:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yKud=TT=citrix.com=prvs=05922dae9=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1nRcH4-0001Yw-PW
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 16:01:23 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcb29208-9ef8-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 17:01:18 +0100 (CET)
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
X-Inumbo-ID: fcb29208-9ef8-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646755278;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zHhwl9oOMQGrQHzvKS89NqOSaxnPNzY8CMiv807CZts=;
  b=NuuUoXBmvWMPEsJhZYUbY/HiZFNFX/eAB25r6TRtmlv5nwkYPRm0RaK8
   /EJ7bf9k3Pk0Ng27683mdKBwYhWzEkFX6vhkYby18CZpnljByrkXtNIhG
   etcvI/fgu0ijr0iZTNwRSq49ubEeS59pk0jx3akLeqrtypPpyS0O6ZQ4O
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65727463
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:UQjeyKO2Qnqwwq3vrR1ml8FynXyQoLVcMsEvi/4bfWQNrUpw1WdWn
 2UZWz3VPKnZZmT8LtFxbYuyoxxU7JLXy9VqSgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZi2t4w27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z5
 dsK9pKqUCoQYKzMxLtFfABZEA5yIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7wJ8Ubs35t1y7QCfIOSpHfWaTao9Rf2V/cg+gQQKmEO
 JZHMlKDajyeexNEEF4lMKkDt+6XhCD+aj9guQmK8P9fD2/7k1UqjemF3MDuUtmSQsVRl02bj
 mvD9nb+BFcWObS3yj2D6HugwPDOmSDTX5gbH7m1sPVthTW7w28OIBQTXEm8p7+1hyaWV9VSI
 UEQ0iMrpLo18gqnQ7HVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAOHKr+dvG2Zsj
 AXQ2Yq0W3o/69V5VE5x6J+5o3TxNzIMAFZcZC9YElMq+tjgj40s20enoslYLIa5idj8GDfVy
 j+MrTQji7h7sfPnx5lX7nic3Wvy+8Ghohodo1yOAzn7tl8RiJuNOtTwgWU3+8qsO2pworOpm
 HEf0/aT4+kVZX1mvHzcGb5ddF1FChvsDdE9vbKNN8R5n9hO0yT6FWy13N2YDB0xWirjUWW1C
 HI/QSsLuPdu0IKCNMebmb6ZBcUw1rTHHt/4TP3SZdcmSsEvKFHZo3EzPhfAgjuFfK0QfUcXY
 8zznSGEVypyNEia5GDuG7d1PUEDnEjSOl8/tbiklk/6gNJylVaeSKsfMUvmUwzKxPjsnekhy
 P4Gb5Hi40wGCIXWO3CLmaZOfQFiBSVqXvje9p0IHtNv1yI7QQnN/deKmuh/E2Gk9owI/tr1E
 oaVBhcImACh1CecdW1nqBlLMdvSYHq2llpiVQQENle0wXkzJ4Gp6aYUbZwserc7sudkyJZJo
 zMtIa1s3twnpuz7xgkg
IronPort-HdrOrdr: A9a23:Nt461Ky7dgNOrhQwGsSsKrPxeegkLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9IYgBcpTiBUJPwJE80hqQFnbX5Wo3SEzUO2VHYYL2KiLGN/9SOIVyGygcw79
 YCT0E6MqyLMbEYt7e13ODbKadZ/DDvysnB7o2+r0uFDzsaEJ2Ihz0JUjpzeXcGIDWucKBJcq
 Z0kfA3wAZIF05nDPiTNz0gZazuttfLnJXpbVotHBg88jSDijuu9frTDwWY9g12aUIP/Z4StU
 z+1yDp7KSqtP+2jjXG0XXI0phQkNz9jvNeGc23jNQPIDmEsHfpWG0hYczAgNkGmpDr1L8Yqq
 iJn/7mBbU115rlRBD2nfIq4Xin7N9h0Q669bbSuwqdnSWwfkNFNyMGv/MDTvKR0TtRgPhnzK
 xE03iFu5dgBQ7clC7949TOSidxmlCvoXwkp+4f5kYvILc2eftfq5cS81hSF4pFFCXm6Jo/GO
 0rF83E4u1KGGnqJEwxk1MfieBEZE5DVitug3JyzvC9wnxThjR03kEYzMsQkjMJ8488UYBN46
 DBPr5znL9DQ8cKZeYlbd1xDPefGyjIW1bBIWiSKVPoGOUOPG/MsYf+5PEw6PuxcJIFwZMukN
 DKUU9et2Q1Z0XyYPf+lqFj41TIWiGwTD7twsZR69xwvaD9XqPiNWmZRFUng6Kb0oMi6w3gKo
 GO0b5tco3exDHVaPV0NiXFKuxvFUU=
X-IronPort-AV: E=Sophos;i="5.90,165,1643691600"; 
   d="scan'208";a="65727463"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VgVgwiNd+ZM7HHvLw7J9s/h3ac7IoBXxtD/l6Kui6lku1/m/HL/ijaLTYp1iz/YaUGSXNDannaKyxxgUfVKQJKHin8asVlW++zfQlL3PNvT2rlTuLhPv7ICVMFbbXE4IgPd9XWtvCRCkWdegCXJFq9w2jECiCDOiOB4iRQ24aj54n+FegIs2DJHxGGxa3ggzj1bY6G6kJmdtNwv66/WbqW1bxZzb1gp3tc4+OpOneC/RlCrQBpHigeayAXAsn+3CR7CoBBc9zyX3vjTJv7x/SvXjfvbYzH6FL+3Vze1ZOGP2cHvvWMq/kb7CpGx8v9SFaBpJuQRfa6VL8cu2pdR6Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLI8XwUm361KPfZfHzF/rVWZ9+I9y0FLXC4erMvoFRA=;
 b=KnFPRiD1Y5axl+sqygDaxKwaccEw5sKYkc/9BxV/hF6B5r4oHF/a+y5RSjnf5ZMsAcMgu+p8a1ECArVDO6jZ26zVmlQDZf20h+QTkucTho9x7/Lip3LgINzBh430J1tclJcT2tZy3KE82yFoM5Aa5WFeM080Khv4gkFOCsvouJDAFBalSSdPr9IwscUXSrha5p2OMGK1NC8AVxbyofR2BXuPWznLGJbcGMNVGB3YhsFi9EQPYQRE6apmODejB3QAJmiqKVh1LsQOAflpw8rJ/GLxI6UL/lF7DYP0i9oIUPX2RJ2xYMzz2iz6CLhz2+y202plsap6cU1OUde74xaTnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLI8XwUm361KPfZfHzF/rVWZ9+I9y0FLXC4erMvoFRA=;
 b=exJPVmStzKT19AydtBxf1GOl1flfGJFi2fw7xL/358XkJPrsmHdwJGR2YRFdWiVeo88DlGQ/zvQ81EWEfE+Tm9UDIkRCxXcpYU3EJ6UA6fed3q4U1vZVPZ1UQP0xTNfpMaJECn/RhieNplIz0BlgigINSKmeoGJNNt++Hl69K/0=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: "Doebel, Bjoern" <doebel@amazon.de>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Michael Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>, "Roger
 Pau Monne" <roger.pau@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH v3 2/2] xen/x86: Livepatch: support patching CET-enhanced
 functions
Thread-Topic: [PATCH v3 2/2] xen/x86: Livepatch: support patching CET-enhanced
 functions
Thread-Index: AQHYMteGyv4uMb9n4kauwbWKAS/6qKy1mRGggAAHVwCAAAGqhg==
Date: Tue, 8 Mar 2022 16:01:13 +0000
Message-ID: <PH0PR03MB63820AB55264C57717C81675F0099@PH0PR03MB6382.namprd03.prod.outlook.com>
References: <453c6e5decb315109a4fbf0065cc364129dca195.1646735357.git.doebel@amazon.de>
 <b91fc474832dd0ce07d223542316fba74afc35ee.1646735357.git.doebel@amazon.de>
 <PH0PR03MB63822464CF42ECDC06A3510BF0099@PH0PR03MB6382.namprd03.prod.outlook.com>
 <e380b32a-2267-0514-53ef-00657c0ce46e@amazon.de>
In-Reply-To: <e380b32a-2267-0514-53ef-00657c0ce46e@amazon.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: f0076554-7567-3c14-3226-d1dbe962566f
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de9b17e8-1d71-4c8d-47a1-08da011cde9f
x-ms-traffictypediagnostic: BN6PR03MB3041:EE_
x-microsoft-antispam-prvs: <BN6PR03MB3041E847F50D06B19F68C47AF0099@BN6PR03MB3041.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Zcf8QVRtQAomMcAVHCGgP6a6SDcR7q3drSXUDnfvWZvup4EMtEokzYhIAjkF3gpYztv0AYBQ1m0JbFsm5/VaErSlz39W0ycb8AIgVWeHR0EDwaNxG0Dsec3M19TH+J69gOmTcVffuZbTwbu3HRmBLwr3aYCajNhzQpxd4oQeMREcElpL88TJ3YCi4qQr7wLwex7CjVaOu3wOSQn6ALfUO9neMt+L/sE76Hy9C0aut6TPr8tWGD3RlI0O6E3/1JuoUEUj1ccz0qFbVKmKNNQ3j2kVgEyfAYS1RWgsO529EbhE2KkYztfVcpMN0M0yw3k6YK+oE/KJgorjimSA9UJPRbUcOmaYs0utBCaqol4H7uxaP7BtO0z6g7DWeIrvO/M8dk5oy6hzEs/aLq/Rntsko/vcxfcVlSxWPX3Sgnz971h9/4wVclui4DA+CeMH83G3BHl+zzqnP4cWtEaZtyiG+4mU8ZNWwyeVUZELqVM5T5kNHyGaU9sHAgQ+phjSLVD0oJEuD9sFNfdS8JjMHqiGgFccTalAsOSnxSVTo7QHu7NpHNdhzzN694wwfDL4A5qdVekVmGxjwHW2MNd5Qj0NMREijrVNz1oWtdzP479C1Icjb0Qftv5tuGIG80jAHGqfzwuLiQ5bhhw48WjGfb1GVU6wXNg5txBARAs1jyT178l3ruwCXSkKMjz9L4FYXYMtoLTi3ZFj/z4K+qdVDHmIpQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6382.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(55016003)(91956017)(54906003)(110136005)(316002)(26005)(83380400001)(86362001)(38070700005)(82960400001)(186003)(8676002)(4326008)(5660300002)(2906002)(8936002)(38100700002)(66946007)(64756008)(66446008)(66556008)(76116006)(6506007)(66476007)(71200400001)(52536014)(9686003)(33656002)(122000001)(44832011)(53546011)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?BkUmieZebthMf870sAYuiztE543aL2+7sX2ENVUk0RI6NORszLQdpHFdLd?=
 =?iso-8859-1?Q?G6NyM/d+lvb4QF4+QhM034R8nGSHZMEVR4815pTNZJeH0NrNQXqdr1xxLT?=
 =?iso-8859-1?Q?AqkLMLZ80DNcbh3yxaiH/FMkDjka8NpyJojrs4TdaKzi8MrUnx343CpWs1?=
 =?iso-8859-1?Q?3U5mAbGVI+MugpVCalKba42ZXNuY+GdyCEtWhT7VqYQ9oPwVRcbTJUvzkE?=
 =?iso-8859-1?Q?usFBt2z5XXvoVkGDLY2mKxX9Fb/ec9e5CxOXIwbjXUBaGNdDZ2tY4VZBEQ?=
 =?iso-8859-1?Q?qDVSHRga1GY88SWVZgBYP7CWN+c1vAkGMMDTHtqH0LZWS6K3uT8xDJk+U1?=
 =?iso-8859-1?Q?qmkqp1/1B+S0ZGjlWxwT8wMIFXPe/po+4ImcSbpRw1zX4quyd86Gr5GA8H?=
 =?iso-8859-1?Q?tETdG7XB42dUpS8FYIYyngZwh1r7X2XltnqHrIFEXoHsy8HfHkZZeMgRWk?=
 =?iso-8859-1?Q?4nsAoWaMkzHyAqlAF/QypHh5EJr9jVelCsRZtpPoB68Uf8CWdTVsAT5EJf?=
 =?iso-8859-1?Q?LAHiRgPwnq0x1wh+WnAqATtWISPK5IORV/6p5aSeGOsTyv7jGzYxw59TQs?=
 =?iso-8859-1?Q?vN/mYXrE9WIGXsZJJPF9y61MwCeVLPbydB3v0L8iNnrV861R/ojlzGzr2a?=
 =?iso-8859-1?Q?wGiNxy0JZSOLtVdiFLGtq9T+a9P3P2nVXSIw7TlGBYXwd6vQXieXMuzUJh?=
 =?iso-8859-1?Q?MRpuCfpM//91zgGz3W0M2BsUg0a/JzWQBouhNr6DpDyGgrZXpFjHQkUJCA?=
 =?iso-8859-1?Q?HUGnEFdd968m6+pKuSU6/zdMbzR/2CHF0+oEgkfyi3JaqdtfJRVlCqSY6/?=
 =?iso-8859-1?Q?myYZOaYzp8Fthpw0wrX486Lxdnhb92wHuDpblAWmGaj87TR1zZyJrPQVZH?=
 =?iso-8859-1?Q?xcTGx7mR9LDP9ZhR6ae3R3qnp2HkWsGV86DFoLEWlU6GYV7/VZ3K8OsUrG?=
 =?iso-8859-1?Q?E25WGBqk2adHhMd/ZJyyig1Of7SKn5BEJNekQR4dRqEwKeKdPujWk37yw+?=
 =?iso-8859-1?Q?+o8latovkRGm5e2TCZTsLp0/qstjUHXM3J18VlBvVkUVg0M7j4Kwj6SSSk?=
 =?iso-8859-1?Q?iLqIJhdL8zUrGQVIw8QvS0Yw6c83+pMSWXLNTE63hXVTMQq3U6NwFXWEo/?=
 =?iso-8859-1?Q?4dwIThW5KFiPlkuLUL9/WYZSdfY/4xlo0JKJo42NqriI3o9a4UBTpo2Vlp?=
 =?iso-8859-1?Q?XGKD9yRVMBD8fo2d/HD47djZPdecwvO2qZm6oC2ZCtTrWaVe2y5wbep3Sf?=
 =?iso-8859-1?Q?8fnQCTeO0P29AJ5liuS9X8X6l9TEd724vJ194gY03D+m+9OiigE3pSVLQg?=
 =?iso-8859-1?Q?0BQHE7qSHg4QGN3QXnNFx7bz0Q6/FExMIdpOD/1DHxf4AklXafsS06KSiF?=
 =?iso-8859-1?Q?JTJeD2JUlpMnM0qqbAi8AGkDp+qos6K2MtDgQ0aVxhX9JtZl3b330Hr0o9?=
 =?iso-8859-1?Q?qhn0ZYZBTz04allKrACq8A8jdEl7w9HurcFuUAMBRfYuH4KP9wv5p0Ss06?=
 =?iso-8859-1?Q?OXoAwTh1dGLTzD1ThhdQrc6CbnTVQoX1/JWriUno99vbRMCfLtE+wczIs7?=
 =?iso-8859-1?Q?0qPytBfrb0AgrjZH0BCrB0nh2gFhdOQYzRfvt/jYUaUOar7aFomjmuNBg3?=
 =?iso-8859-1?Q?PY+KFP2tYxWKQkaX6bEw4Iiw84m23jAWxsldJg4/6/fWGwVghFp/eazj3D?=
 =?iso-8859-1?Q?pOekUDaZHHDcCJ9G68fu+wp0qEOj/ToYcd57BuyvUWyuHqTw1hpCj/b/yo?=
 =?iso-8859-1?Q?Bjvw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6382.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de9b17e8-1d71-4c8d-47a1-08da011cde9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2022 16:01:13.0945
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HpAFH9lFpt40Hm7mSSEWE7WJWZcm89g7IMcVzoEustYtZKS94RWqn72LuyrQ7+Wg6eBqIuBvvLBWm7Qz9yQNCicYRpLdTWRcezqvtRe+5jY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB3041
X-OriginatorOrg: citrix.com

> From: Doebel, Bjoern <doebel@amazon.de>=0A=
> Sent: Tuesday, March 8, 2022 3:41 PM=0A=
> To: Ross Lagerwall <ross.lagerwall@citrix.com>; xen-devel@lists.xenprojec=
t.org <xen-devel@lists.xenproject.org>=0A=
> Cc: Michael Kurth <mku@amazon.de>; Martin Pohlack <mpohlack@amazon.de>; R=
oger Pau Monne <roger.pau@citrix.com>; Andrew Cooper <Andrew.Cooper3@citrix=
.com>; Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>=0A=
> Subject: Re: [PATCH v3 2/2] xen/x86: Livepatch: support patching CET-enha=
nced functions =0A=
>  =0A=
> =0A=
> On 08.03.22 16:25, Ross Lagerwall wrote:=0A=
> > CAUTION: This email originated from outside of the organization. Do not=
 click links or open attachments unless you can confirm the sender and know=
 the content is safe.=0A=
> > =0A=
> > =0A=
> > =0A=
> >> From: Bjoern Doebel <doebel@amazon.de>=0A=
> >> Sent: Tuesday, March 8, 2022 10:29 AM=0A=
> >> To: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>=0A=
> >> Cc: Michael Kurth <mku@amazon.de>; Martin Pohlack <mpohlack@amazon.de>=
; Roger Pau Monne <roger.pau@citrix.com>; Andrew Cooper <Andrew.Cooper3@cit=
rix.com>; Bjoern Doebel <doebel@amazon.de>; Konrad Rzeszutek Wilk <konrad.w=
ilk@oracle.com>; Ross Lagerwall <ross.lagerwall@citrix.com>=0A=
> >> Subject: [PATCH v3 2/2] xen/x86: Livepatch: support patching CET-enhan=
ced functions=0A=
> >>=0A=
> >> Xen enabled CET for supporting architectures. The control flow aspect =
of=0A=
> >> CET expects functions that can be called indirectly (i.e., via functio=
n=0A=
> >> pointers) to start with an ENDBR64 instruction. Otherwise a control fl=
ow=0A=
> >> exception is raised.=0A=
> >>=0A=
> >> This expectation breaks livepatching flows because we patch functions =
by=0A=
> >> overwriting their first 5 bytes with a JMP + <offset>, thus breaking t=
he=0A=
> >> ENDBR64. We fix this by checking the start of a patched function for=
=0A=
> >> being ENDBR64. In the positive case we move the livepatch JMP to start=
=0A=
> >> behind the ENDBR64 instruction.=0A=
> >>=0A=
> >> To avoid having to guess the ENDBR64 offset again on patch reversal=0A=
> >> (which might race with other mechanisms adding/removing ENDBR=0A=
> >> dynamically), use the livepatch metadata to store the computed offset=
=0A=
> >> along with the saved bytes of the overwritten function.=0A=
> >>=0A=
> >> Signed-off-by: Bjoern Doebel <doebel@amazon.de>=0A=
> >> CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>=0A=
> >> CC: Ross Lagerwall <ross.lagerwall@citrix.com>=0A=
> >> ----=0A=
> >> Note that on top of livepatching functions, Xen supports an additional=
=0A=
> >> mode where we can "remove" a function by overwriting it with NOPs. Thi=
s=0A=
> >> is only supported for functions up to 31 bytes in size and this patch=
=0A=
> >> reduces this limit to 30 bytes.=0A=
> >>=0A=
> >> Changes since r1:=0A=
> >> * use sizeof_field() to avoid unused variable warning=0A=
> >> * make metadata variable const in arch_livepatch_revert=0A=
> >> ---=0A=
> >>   xen/arch/x86/livepatch.c | 61 ++++++++++++++++++++++++++++++++++----=
--=0A=
> >>   1 file changed, 53 insertions(+), 8 deletions(-)=0A=
> >>=0A=
> >> diff --git a/xen/arch/x86/livepatch.c b/xen/arch/x86/livepatch.c=0A=
> >> index 65530c1e57..0fd97f2a00 100644=0A=
> >> --- a/xen/arch/x86/livepatch.c=0A=
> >> +++ b/xen/arch/x86/livepatch.c=0A=
> >> @@ -14,11 +14,29 @@=0A=
> >>   #include <xen/vm_event.h>=0A=
> >>   #include <xen/virtual_region.h>=0A=
> >>=0A=
> >> +#include <asm/endbr.h>=0A=
> >>   #include <asm/fixmap.h>=0A=
> >>   #include <asm/nmi.h>=0A=
> >>   #include <asm/livepatch.h>=0A=
> >>   #include <asm/setup.h>=0A=
> >>=0A=
> >> +/*=0A=
> >> + * CET hotpatching support: We may have functions starting with an EN=
DBR64=0A=
> >> + * instruction that MUST remain the first instruction of the function=
, hence=0A=
> >> + * we need to move any hotpatch trampoline further into the function.=
 For that=0A=
> >> + * we need to keep track of the patching offset used for any loaded h=
otpatch=0A=
> >> + * (to avoid racing against other fixups adding/removing ENDBR64 or s=
imilar=0A=
> >> + * instructions).=0A=
> >> + *=0A=
> >> + * We do so by making use of the existing opaque metadata area. We us=
e its=0A=
> >> + * first 4 bytes to track the offset into the function used for patch=
ing and=0A=
> >> + * the remainder of the data to store overwritten code bytes.=0A=
> >> + */=0A=
> >> +struct x86_livepatch_meta {=0A=
> >> +    uint8_t patch_offset;=0A=
> >> +    uint8_t instruction[LIVEPATCH_OPAQUE_SIZE - sizeof(uint8_t)];=0A=
> >> +};=0A=
> >> +=0A=
> > =0A=
> > I think it would make things a bit simpler to use one of the spare _pad=
 bits=0A=
> > from struct livepatch_func  ather than hacking it into the opaque area.=
 Is=0A=
> > there a reason you chose this approach?=0A=
> =0A=
> No specific reason. Are you suggesting updating the public livepatch =0A=
> interface to add a new member and reduce the padding size by 1 byte? I =
=0A=
> guess that will also require a patch to livepatch-build-tools?=0A=
> =0A=
> Bjoern=0A=
=0A=
struct livepatch_func contains info that the build tool needs to=0A=
communicate to Xen as well as space for Xen's internal book keeping=0A=
while the live patch is applied. This includes the array for storing=0A=
instructions, the applied flag, and now additionally the patch offset.=0A=
(It's a somewhat odd arrangement but it's what we've got...)=0A=
=0A=
The build tool does not need to know the details about any of Xen's interna=
l=0A=
book keeping. So my preference would be to have patch_offset as an addition=
al=0A=
member next to applied (reducing padding by 1) and then in livepatch-build-=
tools=0A=
replace:=0A=
=0A=
        unsigned char pad[MAX_REPLACEMENT_SIZE];=0A=
        uint8_t applied;=0A=
        uint8_t _pad[7];=0A=
=0A=
with simply:=0A=
=0A=
        uint8_t opaque[39];=0A=
=0A=
		=0A=
What do you think?=0A=
=0A=
Ross=

