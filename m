Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E722442B4C
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 11:03:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219893.380947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhqdQ-00063q-94; Tue, 02 Nov 2021 10:03:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219893.380947; Tue, 02 Nov 2021 10:03:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhqdQ-000619-5q; Tue, 02 Nov 2021 10:03:16 +0000
Received: by outflank-mailman (input) for mailman id 219893;
 Tue, 02 Nov 2021 10:03:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XxgO=PV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mhqdO-000613-QF
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 10:03:15 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b8172d0-f1a3-4fce-9c73-18c409afb91f;
 Tue, 02 Nov 2021 10:03:12 +0000 (UTC)
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
X-Inumbo-ID: 8b8172d0-f1a3-4fce-9c73-18c409afb91f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635847392;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=knKIVQw+Bp+LjHr8fipA0Si60DtBi1s3ER/Ioalib7c=;
  b=IOvthAchOZ76+KGWEFztkylcEMQrl9QfMBAwELTdhZI18sqLTkd38mq7
   sb4/TvjL8M1HQfDsRYQg9Hmc8nJ7tI1iuCdBgKsbak0W8a8E2UUaGOyON
   GPQIycaYXWnCJsavymjtMgWVyLOqTX2qbQoe8isRworOy5zvdfo9aWydL
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: C3d0XkNf9jkeg/LgzQc1RlbsSatqoMV2JY9uF+Tj/siRJjGXhSQ7LRlwfFQwiVRqnq2YinLBKz
 i9RWCLKZypf+QRbWaKDX0z2UQwLmKxsIuJJOzPcUDBJrS28cT4ju4HkHaUC7ybcpExDDUg5ZKE
 B3Knqotwb4B36+YLOWlJcsZzm3j79afx89kLdD6JL2s2aNuWK4+mbWBf83sA6jBRW2l7mo+KRf
 9w2vvXMWwVjkc13o7uRKyzpn0BZIFdzZmD0djhNvH2GbU4M8TQJmlr8ahvJSNFtEWOHPmw1thq
 0prx7Jl7dwnTjGUAoywxZIf8
X-SBRS: 5.1
X-MesageID: 56884599
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ODupbatS3la2dq76XJtF9nU9PufnVElYMUV32f8akzHdYApBsoF/q
 tZmKW6DaKqNMWekKY1/bISw90gD75DUy9ZmTAs/rilgQSMX+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cx2YLhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplsYLqSgsGLrHwhuk/Cyl2MX5mAp8F0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY254eTaqDN
 ptxhTxHNDWRRUJxOVwuB5cuvtuGuVzETyRSgQfAzUYwyzeKl1EguFT3C/L8YMCHQPJwj0mRp
 2/Y12nhCxRcP9uaoRK79Xariv7KjDnMcosYH72l9dZnmFSWgGcUDXU+V1G2vP24gU6WQM9EJ
 gof/S9GhbI79FGvCML8WRK4iHeeu1gXXN84O+c38h2Xw6zYpQOQHHEZTyVpYcYj8sQxQFQCx
 lKP2t/kGzFrmLmUUm6GsKeZqyuoPioYJnNEYjULJSMi59Tgu4g1ggj4Z9BvCrOujtb1FDfzx
 BiHtCE7wb4UiKYj1bi//F3BqyKhoN7OVAFdziLTU2G+5wV1frmZdpeo4ljW6/VHBIuBR1zHt
 38B8+CF9/wHB5yJkC2LQc0OEauv6vLDNyfT6WODBLF4qW7roST6O9kNvncufy+FL/roZxftf
 hXQtSxB+KNNMVnyXYFVPJqOOYcDmP2I+cveatjYad9HY55UfQCB/T1zaUP4410BgHTAgolkZ
 87FLJ/E4WIyTP0+kWHoH7t1PaoDn3hmnQvuqYbHIwNLOFZ0TFqcUv87PVSHdYjVB4vU8VyOo
 76z2yZnoiizsdESgAGLoeb/znhQdBDX4KwaTeQNL4ZvxSI9QAkc5wf5m+9JRmCct/09eh301
 n+8QFRE71H0mGfKLw6HAlg6NuiyAscl9S1hZ3VwVbpN55TFSdz2hEv4X8BvFYTLCcQ5laIkJ
 xX7U5zYahiwdtg302tENsSsxGCTXB+qmRiPL0KYjMsXJPZdq/jy0oa8JGPHrXBWZgLu7JdWi
 +Dwh2vzHMtYLyw/XZm+VR5a5w7o1ZTrsLkpBBWgzxg6UBiEzbWG3ASo1aJqeJ5QcU2rK/nz/
 1/+PCr0bNLl+ucd2NLImbqFv8GuFe5/FVBdBG7V8fC9Miyyw4Zp6dYovD+gcW+PWWXq1r+lY
 OkJnfjwPOdexARBspZmEqYtxqU7voO9q7hfxwViPXPKc1X0Ve8wfijYhZFC5v9X27tUmQqqQ
 UbTqNNUDqqEZZH+G1kLKQt7MunajaMImiPf5OgeKVnh4HMl56KOVEhfZkHeiCFUILZvHpkix
 OMt5Jwf5wCl00J4OdealCFEsW+LKyVYAakgs5gbBq7tixYqlQ4eMcCNVHeu7cjWOdtWM0QsL
 juFv4b4huxRlhjYbn4+NXnRxu4B154Ajw9HkQ0ZLFOTl9ub2vJuhE9N8S46Rxh+xwlc174hI
 XBiMkB4KPnc/zpsg8QfDWmgFxsYWU+c8031jVAIiHfYXw+jUWmUdD8xPuOE/UY49WNAf2cEo
 OHEmTi9CTu6Ltvs2iYSWFJ+r62xRNN8wQTOhcS7EpnXBJI9ezfk3vejaGdgR8EL2i/taJkrf
 dVXwds=
IronPort-HdrOrdr: A9a23:3G7evK/zY5SmaCWd+3Ruk+DcI+orL9Y04lQ7vn2ZLiYlFfBw9v
 re+MjzsCWetN9/Yh0dcLy7V5VoIkm9yXcW2+cs1N6ZNWGN1VdAR7sC0aLShxHmBi3i5qp8+M
 5bAs1D4QTLfDtHZBDBkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.87,202,1631592000"; 
   d="scan'208";a="56884599"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U7UJksfQj1MucD4KVpJtwz6Q1Une3pYCvWsDzirkzWt225zSP9JoSNQJm5MnRlBomdhMqO88dRXrIrh68pzci+Gxki73XO39ERCld6vfi+HzaCBNKG+MLhgAkFiD2zgzR7uKzxFo2yqRuXoXdssF70wJfcn9+2OHvPfQ00ZG1bNqohln6L7jv+VyLqv3QqUnybs1W9orQqoQJ1CgGBZB+u+TZSh8a1GcuFBXi952s284Nnqc009bLbHRJIG3C20hUXW/i4kdIqyhfQnX/s+6/Y5r3+Zrn3IxlhnZ/s5T7TExbc+Gq5JSAxzYAXa/n70uuODYLV4UPyc2rUk22AwEAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fwh6fkwWctqalPILbild4nAktzUhmyNxl1JDO+jkTAY=;
 b=YzFk0lYSjdxytCwdrtUMvcs93UdAb+eRDb7/wWjOjs7T+Z2MLwrMiC6xp9BscgTgEdfplkNMAqUIS/0/duFjiLdKWGxiqwsIaaIjiumJ3UA89hAMlL13hiIclqjDpiWxN700GU6paJVFmVK2D0wPp7ip8IfehDWwSazFWDp96ng3aOi3JYBvRpd2XO2Z5/0Qa6F7SY7SQhNx7NJUTL4FnSA33zOdaIZ1eo6AATEn6UJfWsKbr+HjADR4GmqPRYzS6lTNjwLBgQNpap4DR8iM0HfLhTqok5sg0DmxG0pEPmzQSovHBFFJKM9ixFNZ9qD09ppkCpcStmLMbnTDz78qgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwh6fkwWctqalPILbild4nAktzUhmyNxl1JDO+jkTAY=;
 b=F4BdwXSAvsVtyqmt5WocSUGqDkLAdEy4GV+xGd+xmPkCIVzanOCpXrSudg7ZjMfdDCseveRjzPfvKpEehpprfSnuOHI0Za0872ngA8w80uy7lfo6QaNbdodHQGp8miZNtleCVeu+WlZy0bgib7TkjFDMEo9ySV23Ga1BTfrAMxY=
Date: Tue, 2 Nov 2021 11:03:02 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"jbeulich@suse.com" <jbeulich@suse.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH v3 04/11] vpci/header: Add and remove register handlers
 dynamically
Message-ID: <YYEM1lX8NhK7nfhj@Air-de-Roger>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-5-andr2000@gmail.com>
 <YXbRsbzLxZs94v0Z@MacBook-Air-de-Roger.local>
 <ba1fea82-e2db-89af-b48d-56d393bd4ce8@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba1fea82-e2db-89af-b48d-56d393bd4ce8@epam.com>
X-ClientProxiedBy: PR0P264CA0238.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92e3e4a2-4536-4c13-1d43-08d99de7f8b5
X-MS-TrafficTypeDiagnostic: DM6PR03MB5067:
X-Microsoft-Antispam-PRVS: <DM6PR03MB50674ED89C76171FCD9051038F8B9@DM6PR03MB5067.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4R0Zp7XDLWFPvO6mfbicPvVQ6ynxJx0Xy4Uf2LjA70NEhXxmkNZouLWdgYt0KILZFzvN2RZ/Uy7ZPaO74TWtaIPF6+S+1GkEvk7LWkudoLPfhZBKCEHjAyJzRsHSlNQWhfw2skJPZDHuVcHzBA6xeh5rRXNrHWeGtzhD+jtCccl5pfMq4UvJmoZfnZPXcVHhiop6VX8VM1NoaIM97TRIw91RboMdZj4uz9e58ATgeR9w0ZjXwruDhR9B7ArdUkZ1Y1IoXaHPQJx2A4SDZXiGd5KLRnGEwJoPnLuJVXrYE18ZL6p0SrsxfE7uZrdhV7EXPIjYE9OFhR3kGjNPcv/InT92PCZDY1UiPjP2FcaYCib05FnjAxCUjYot+OPzpYGwIJN9vPMu2Q0hKgDqhPKN3Wtq1MTQcHvR7FXgWiI0dopYeFJlyEGHdWlDT7qpnNoI1e3UlreQnmPkZNcv9W44PBBj70aoI+TpsC2OBaJUwDvTHzcpUjvslAKix88jPByicL+45hN0Rc+MgniRmKcAU0cmUNsKyeSOaWLvewr7eC+dcs12Hkvpl/dLn9bJspoMnOW1GbxlteUaTiNwh0W+t2P8rruc+nTe7eecHN0fyNMe343A+/2sKIdOvSfZCzmK+vSaBxu6uAjJTRqw0Pzvu8Qvu6KeHbwP4sfY2tgOsduTlmjv9zv6nK1mSakW6b3al5otB0BQxjjfVtAr9rp0FVqhUTD7xaYNseLAmIxFImuvYVBn+A7GI+sjPwSV47es1zpwV8wlkYkfSNmu5+Bgxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(82960400001)(316002)(9686003)(83380400001)(26005)(85182001)(6666004)(186003)(54906003)(8676002)(956004)(66476007)(86362001)(66556008)(8936002)(6496006)(66946007)(38100700002)(966005)(508600001)(5660300002)(7416002)(6486002)(4326008)(33716001)(2906002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TG9ycUdXWnNPbDM4WCtzVzZ4cXY4Tk5kVHRYMW1pT0VzZXgyZ0hoTTA0bGxq?=
 =?utf-8?B?NUpYUXRDbVB1bUN3UVdCSytXZVgrVFZPeXlCZ2liMitSZXlQYnc3TE81UVJq?=
 =?utf-8?B?TlBDWTZiUTVOcjIrTTBRMjVPWDBBa0tUWmEzMTZDVEw5dzFTZGFueTdDN0pn?=
 =?utf-8?B?SGpnRHE4am5uNkFBVmpXYU9mazB2SFlEdS9oSnhrZnlZd2VBQVU0UWh6YnY2?=
 =?utf-8?B?MUVvM2ZUQTJvSldVQXBmSXhmV2FxdlcwL1JnY3ROekdpWWt6alNGNzlpdytE?=
 =?utf-8?B?SVA5eWNFZ3lGRTIvbUUyVjd3TTdHYVRaQnFJenN0Q2xORjBHRWt5TnhCZXNk?=
 =?utf-8?B?d28wanFYZ3F1eWdhK01JTGVWVXlJODcrMUNBL09RaUNlYUszTlNNMWptanM4?=
 =?utf-8?B?OTAzS0ZTVmJXZmlSZ1VmUFJpZzYxZ2UwNDJEc3JtZmJqRHdDTEszcnAwSFBN?=
 =?utf-8?B?TkpxTWpXMERwUGl0aFRlV09GN0RvVGxLVkdVb0F6bFZxSEZSb2ZkYjlyYWJj?=
 =?utf-8?B?aTlPWlBaMHBnc1p5YVVGZ3RycG9QRTJrNXY1cGpYbGFKSUxvUDJWL2k1UDN3?=
 =?utf-8?B?Zk9TSUhmN1Vja3JoN0VQaHBHYjUrMW9KN0Nkdm1YQlZIbm5NUU5OTGc5dVRl?=
 =?utf-8?B?eEZjbUJqcDJCY29mVlkyZnJLT1YyUXZ1RmtGVHlEZlRlSG9QeDFXbmtwajVX?=
 =?utf-8?B?a1VoZ2hKMVllUVVUN0czT1ZMaVdVSjRObmJRM3N6SkNFeXVJNysxcWExa09N?=
 =?utf-8?B?NTBHMGh4NTNQa010QityMmJrdW5FZkxNd0s4bEJjR1RyaE9ka2JMK0pUYmxw?=
 =?utf-8?B?cTc5ekJmUFNoWFh2ZEVacHoycS9GZ29iai9BQVB1eVdOZ3hsRldWeTJERnov?=
 =?utf-8?B?YjZWTW1iYmhaTldCQk1FUVlBZUViaGJ2cFJMc0V1Q1FqQmFjRzJnM1BnWVQ0?=
 =?utf-8?B?YWRGdzA3QkJLcVpkd3VEY3ZkU29KR3kya29HQlZlc0NvSFFqRUdWK2l0bW93?=
 =?utf-8?B?TmxIVWFqSndvUTVpOGUxZkRWa1pWSEdRRU5HNWxGNHNMN00wTGpZcEM1ZnZr?=
 =?utf-8?B?OXA1Yi9SV3FSR3Bub3dBd09wRlBZcDZaYmZ6b0FpQUtNd3BnM241N2lKdXVK?=
 =?utf-8?B?NS9haVJNY004UDVvRTBjTEFtS05qbXRoVFNWSFhrRlVEbU9VVjVCZFUvOHd1?=
 =?utf-8?B?eGJUUlNOYWUwdFIyd2l0Y0JtM1RZN21FSHU2SUVuNzBudy8yR0hmZFVaK2t5?=
 =?utf-8?B?L3JBN1o3RjFleTVUWVhxZDdxbDFjano3TmorRDFCcUxzZjgyYjNXNUVzUFdr?=
 =?utf-8?B?dE9sY3Y5MXB0U2YrM1YrZ2lPNkhFNG51dmxQUGRxYWNBRzdqem14VTkvc1hY?=
 =?utf-8?B?QjFvMzBVODNBV3B2ZmVhWHpFczg0aHhmeEFIaEtNNURzQVo0R1BjeUpVK1pr?=
 =?utf-8?B?VlZmM1NMOWp6N05pSm1UWVROVXhtZytacStDZTZGM1NUVnp4eTRXZkI0ZVZp?=
 =?utf-8?B?R0lpTER3VjI5RzVLKzhSY1MxWW4xTGFEMUtIM3VtYkpaRy85MDVNUzlKVXRY?=
 =?utf-8?B?UzlqRFEyVjdFSW1EUSthNWpOMEVlelVoTlZpOTdHbWtkNGtmcHA4MklBaVJD?=
 =?utf-8?B?c29tdDV0dUxLUU9ua01VS3cvSkJud2JRdThmTTFSR0EvSkJtTHhDU2N0R1R2?=
 =?utf-8?B?NTV2K1NvSEIyOVVXMFgrbHBwUk9KUDRyOURiUGlYTkZwSE42YTA3MFY2MXJt?=
 =?utf-8?B?RGhod0hJVVZWR0l0bkNzQkh4QnlxM0dPQ0R0RkxwOHRxWmJJWUZkYmpVUHEy?=
 =?utf-8?B?dzNsZ29CSW9lZkxVaWhvMHZ5RUc4K0swNGlmWnlRaE1kVGZZTnd1T051YkhF?=
 =?utf-8?B?QkxBdUFONmcvTTdwZGVHeEF1Wmt2QWQrSUdwZmdmd3ZLbjVUNEVJeUEySXk5?=
 =?utf-8?B?TTVqb2JXa1d5U3BWWG1kekNvb3RIb1RFbEJZbUg2cDBzT21Rb2xXcTNZR2Vj?=
 =?utf-8?B?VVkyWTdUcTgwcTVldlZBbGllSzBPdmJxd2xsWkd4ckphQ09yRDNVMWt2WTVp?=
 =?utf-8?B?aDRpQ2JjNCtMcklUcTF6clNxcEtOb20rMkRyVGJDM1ZmeWFRL2p2WmhwSlF4?=
 =?utf-8?B?MnFpcitSem1kOUl3UmZ5NG1QNTA1TGFNL25vUENpRmNBTm1TMHY0ZUk1blYz?=
 =?utf-8?Q?6RyiacTTo0HKcJSVlJS94qI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92e3e4a2-4536-4c13-1d43-08d99de7f8b5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 10:03:08.7172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m0M4Mt0H+CrF6Sf3VFjWZ5wNoJic1L8l/9c9rEXoPZeeAepol1nOU6oVYRE8eER/xlKGQ/gz1BtfwemPx09Fnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5067
X-OriginatorOrg: citrix.com

On Mon, Nov 01, 2021 at 09:18:17AM +0000, Oleksandr Andrushchenko wrote:
> 
> >> +    if ( rc )
> >> +        gdprintk(XENLOG_ERR,
> >> +                 "%pp: failed to add BAR handlers for dom%pd: %d\n",
> >> +                 &pdev->sbdf, d, rc);
> >> +    return rc;
> >> +}
> >> +
> >> +int vpci_bar_remove_handlers(const struct domain *d, const struct pci_dev *pdev)
> >> +{
> >> +    /* Remove previously added registers. */
> >> +    vpci_remove_device_registers(pdev);
> >> +    return 0;
> >> +}
> >> +#endif
> >> +
> >>   /*
> >>    * Local variables:
> >>    * mode: C
> >> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> >> index 0fe86cb30d23..702f7b5d5dda 100644
> >> --- a/xen/drivers/vpci/vpci.c
> >> +++ b/xen/drivers/vpci/vpci.c
> >> @@ -95,7 +95,7 @@ int vpci_assign_device(struct domain *d, const struct pci_dev *dev)
> >>       if ( is_system_domain(d) || !has_vpci(d) )
> >>           return 0;
> >>   
> >> -    return 0;
> >> +    return vpci_bar_add_handlers(d, dev);
> >>   }
> >>   
> >>   /* Notify vPCI that device is de-assigned from guest. */
> >> @@ -105,7 +105,7 @@ int vpci_deassign_device(struct domain *d, const struct pci_dev *dev)
> >>       if ( is_system_domain(d) || !has_vpci(d) )
> >>           return 0;
> >>   
> >> -    return 0;
> >> +    return vpci_bar_remove_handlers(d, dev);
> > I think it would be better to use something similar to
> > REGISTER_VPCI_INIT here, otherwise this will need to be modified every
> > time a new capability is handled by Xen.
> >
> > Maybe we could reuse or expand REGISTER_VPCI_INIT adding another field
> > to be used for guest initialization?
> >
> >>   }
> >>   #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
> >>   
> >> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> >> index ecc08f2c0f65..fd822c903af5 100644
> >> --- a/xen/include/xen/vpci.h
> >> +++ b/xen/include/xen/vpci.h
> >> @@ -57,6 +57,14 @@ uint32_t vpci_hw_read32(const struct pci_dev *pdev, unsigned int reg,
> >>    */
> >>   bool __must_check vpci_process_pending(struct vcpu *v);
> >>   
> >> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> >> +/* Add/remove BAR handlers for a domain. */
> >> +int vpci_bar_add_handlers(const struct domain *d,
> >> +                          const struct pci_dev *pdev);
> >> +int vpci_bar_remove_handlers(const struct domain *d,
> >> +                             const struct pci_dev *pdev);
> >> +#endif
> > This would then go away if we implement a mechanism similar to
> > REGISTER_VPCI_INIT.
> >
> > Thanks, Roger.
> Ok, so I can extend REGISTER_VPCI_INIT with an action parameter:
> 
> "There are number of actions to be taken while first initializing vPCI
> for a PCI device or when the device is assigned to a guest or when it
> is de-assigned and so on.
> Every time a new action is needed during these steps we need to call some
> relevant function to handle that. Make it is easier to track the required
> steps by extending REGISTER_VPCI_INIT machinery with an action parameter
> which shows which exactly step/action is being performed."
> 
> So, we have
> 
> -typedef int vpci_register_init_t(struct pci_dev *dev);
> +enum VPCI_INIT_ACTION {
> +  VPCI_INIT_ADD,
> +  VPCI_INIT_ASSIGN,
> +  VPCI_INIT_DEASSIGN,
> +};
> +
> +typedef int vpci_register_init_t(struct pci_dev *dev,
> +                                 enum VPCI_INIT_ACTION action);
> 
> and, for example,
> 
> @@ -452,6 +452,9 @@ static int init_bars(struct pci_dev *pdev)
>       struct vpci_bar *bars = header->bars;
>       int rc;
> 
> +    if ( action != VPCI_INIT_ADD )
> +        return 0;
> +
> 
> I was thinking about adding dedicated machinery similar to REGISTER_VPCI_INIT,
> e.g. REGISTER_VPCI_{ASSIGN|DEASSIGN} + dedicated sections in the linker scripts,
> but it seems not worth it: these steps are only executed at device init/assign/deassign,
> so extending the existing approach doesn't seem to hurt performance much.
> 
> Please let me know if this is what you mean, so I can re-work the relevant code.

I'm afraid I'm still unsure whether we need an explicit helper to
execute when assigning a device, rather than just using the current
init helpers (init_bars &c).

You said that sizing the BARs when assigning to a domU was not
possible [0], but I'm missing an explanation of why it's not possible,
as I think that won't be an issue on x86 [1].

Thanks, Roger.

[0] https://lore.kernel.org/xen-devel/368bf4b5-f9fd-76a6-294e-dbb93a18e73f@epam.com/
[1] https://lore.kernel.org/xen-devel/YXlxmdYdwptakDDK@Air-de-Roger/

