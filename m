Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0294F81EA
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 16:38:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300836.513251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncTH4-0002bp-PS; Thu, 07 Apr 2022 14:38:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300836.513251; Thu, 07 Apr 2022 14:38:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncTH4-0002ZG-Kz; Thu, 07 Apr 2022 14:38:14 +0000
Received: by outflank-mailman (input) for mailman id 300836;
 Thu, 07 Apr 2022 14:38:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E9KF=UR=citrix.com=prvs=0897b442a=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1ncTH2-0002ZA-Mt
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 14:38:12 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57f3d2ee-b680-11ec-a405-831a346695d4;
 Thu, 07 Apr 2022 16:38:11 +0200 (CEST)
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
X-Inumbo-ID: 57f3d2ee-b680-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649342291;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=CwYRepV9LF+sx0WoxLchvnEWTWnAZFrcqCU6taNz3do=;
  b=fYSr8BUa75MsxR4QIuWfTe2s/tCYPZPcYGRW3M50bkhhhXscn7sgqeWD
   uX5zCAXrFUg4v5+oWPyhP9ZEHrXtsu4pRfsQ6PYyKI1i0URVDSe48yDMU
   9tqNePpxLk9h4pfol+yssFFV2NVPdcakhmHpIjGgt5D7/l8VUvdeHBY7S
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 70674654
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:mRFFx6k42HWMAellk4Fdvzbo5gwIJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKC22HOf+IYWHzf9EnYIi/8kgHsMXRnINlSgA4pCxjQiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DlW1zV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYeBoCJKDxh/0nXjpFM3knLY1f4J/jLi3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3oHZ71nfdBPkrW4/KR6Hi7t5ExjYgwMtJGJ4yY
 uJGMWQwMEqdP3WjPH88I6k9mcaEoULBbj5VoXbEtKAF+zP6mVkZPL/Fb4OOJ43iqd9utkyVv
 H7c9mL1RBQTLsWCyCGt+2ipwOTImEvTR4Y6BLC+sPlwjzW7xWsVEhQaE0S6pfqRjVS3UNZSb
 UcT/0IGk68280C6S8jnaDexqnWEox00VsJZFqsx7wTl4qje7hudB2MEZiVcc9Fgv8gzLRQ62
 1nMk973CDhHtLyOVWnb5rqStSm1OyUeMSkFfyBsZRAe/9DprYU3jxTOZtVuCqi4ipvyAz6Y6
 zKXqCkzgZ0DgMhN0L+0lW0rmBr1+MKPFFRsoFyKACT1tWuVebJJeaSZ9HPB4MtfNbyUbUSh5
 CEUu9GGzMQBWMTleDO2fM0BG7Sg5vCgOTLagEJyE5RJywlB60JPbqgLvmggeR4B3tIsPGawP
 RSN4V85CIp7ZiPCUENhX26m5y3GJ4DEHM+taP3bZ8EmjnNZJF7ep3EGiaJ9MgnQfKkQfUMXZ
 M/znSWEVy9y5UFbINyeHbp1PVgDnH1W+I8rbcqnpylLKJLHDJJvdZ8LMUGVcscy576erQPe/
 r53bpXWmk8PDbCuPXaOqOb/yGzmy1BhWPgaTOQNKIa+zvdOQjl9W5c9P5t/E2Cao0ilvriRp
 SzsMqOp4FH+mWfGOW23hoNLM9vSsWJEhStjZ0QEZA/ws1B6ONrHxPpPJvMfIOh8nMQ+nKEcc
 hXwU5jZahi5Ym+coGp1gFiUhNEKSSlHcirSZ3H1P2VlJ8cIqs6g0oaMQzYDPRImV0KfncA/v
 6ehxkXcR58CTB5lF8HYdLSkyFbZgJTXsLkas5fgSjWLRHjRzQ==
IronPort-HdrOrdr: A9a23:UH9o46M8qBomasBcT3b155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjzjSWE9Qr4WBkb6LW90dq7MA/hHPlOkMYs1NaZLUXbUQ6TQr2KgrGSugEIdxeOldK1kJ
 0QCZSWa+eAQ2SS7/yKmDVQeuxIqLLskcCVbKXlvgxQpGlRGvldBmxCe2Km+zhNNW977O0CZf
 2hD6R81lidUEVSSv7+KmgOXuDFqdGOvonhewQ6Cxku7xTLpS+06ZbheiLonys2Yndq+/MP4G
 LFmwv26uGIqPeg0CLR0GfV8tB/hMbh8N1eH8aB4/JlagkEyzzYJ7iJaYfy+Qzdk9vfrGrCV+
 O85CvICv4DqU85uFvF5ycFlTOQiQrGoEWStmNwyUGT3/ARAghKUPapzLgpAicw5ycbzaBB+b
 MO0GSDu5VNCxTc2Cz7+tjTThlv0lG5uHw4jIco/jdiuKYlGfZsRLYkjQto+VY7bVbHwZFiFP
 MrANDX5f5Qf1/fZ3fFvnN3yNjpWngoBB+JTkULp8TQilFt7T1E5lpdwNZakmYL9Zo7RZUB7+
 PYMr5wnLULSsMNd6pyCOoIXMPyAG3QRhDHNn6UPD3cZes6EmOIr4Sy7KQ+5emsdpBNxJwumI
 7ZWFcdrmI2c1KGM7z54HSKyGG7fIyQZ0We9igF3ekLhlTVfsufDRG+
X-IronPort-AV: E=Sophos;i="5.90,242,1643691600"; 
   d="scan'208";a="70674654"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a63Eo3wnO6cdYKfIjo95eiK+FP+dXAb77WAUXL9XRFUuYlxtlykA15gJoEFCAGf9/qmYVO/58Psg0orFMUXw+QK8K4T1bqFvMdH0FvokD2Ltsj3sI8raU4uPwA1hjQPh5xiLesmDOsoGlPV/rv0tSxm0AuQaio6NVe3LOtxlTTDzvlQ8rOuAzcUwfBIOpo7O1kxesJR4L7D1WvRDLLePdAfy9KfXXXnP2ImK3lZ2uF1VaqPBR3XGUvhGTtWqjvHnywXKOeeYgSsLo4W3dLXRAI8FpT8WnDkObniWkaLoiL4mK2kJ6jy4Ah7vCSMcWRvKMFHQ/Z4snMtDRzeaydWBcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocQQ9ZFh6y5Ah9sdGtLkG5xPJmoJmSOc0Fq/I/MmYRw=;
 b=Zp1mMOpHw7pqI0Z0GoiBUnH/HouqnETPJUfTs9pu+NEsc9xUHpLjlfADApI+I+Nlh0YgcMZoKTXSsWeUrKWz/EVZl+g9AT2X/SwMM1FEB3MKNhtjDhCD6ggldwqJb34/cpU//pjFGNYhRWtquTFjlHK2LN9T1WHkDnnThbhSacIaQ+xEV1wT5+z1p0uipUtskHXAwp0HxSaYWsZnqPlXfsVzThuttumvs4jWXYthvbM3IWjY7mC8IhfloojrcQACTgEK0k3NpeRa9mkHyrtIMDvurjqSyft3Tcy1Bnj6Fli3xmOJ6PtT9MUi1LHJSKeJ2PbTr3mQCA5OCPj5Qo1Awg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ocQQ9ZFh6y5Ah9sdGtLkG5xPJmoJmSOc0Fq/I/MmYRw=;
 b=MvLqvLh0hEzUTH1G+XFtKcebb8tcXV0QANmp9OxEoWI5cCWNAl7oAEgSBSf972AT9UQvUB1k3knSw/fkCby/BF6aGsUZLvaR0+eEpMXf+n+PmSeJmk8snv75LhKxnVwwzldOfpzLwmM64gMud6IN8/kH8tDpoPHnHv9bdoFo2lQ=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>,
	"Julien Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Roger Pau Monne <roger.pau@citrix.com>,
	"Konrad Rzeszutek Wilk" <konrad.wilk@oracle.com>
Subject: Re: [XEN PATCH v10 2/7] build: replace $(BASEDIR) by $(objtree)
Thread-Topic: [XEN PATCH v10 2/7] build: replace $(BASEDIR) by $(objtree)
Thread-Index: AQHYPd89/8ailHGG5EeamVnyUqUluazknFd/
Date: Thu, 7 Apr 2022 14:38:04 +0000
Message-ID: <PH0PR03MB638278497E7666896DA969CEF0E69@PH0PR03MB6382.namprd03.prod.outlook.com>
References: <20220322112238.1117737-1-anthony.perard@citrix.com>
 <20220322112238.1117737-3-anthony.perard@citrix.com>
In-Reply-To: <20220322112238.1117737-3-anthony.perard@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fdce1558-3e84-44e6-deb6-08da18a4396b
x-ms-traffictypediagnostic: CO6PR03MB6275:EE_
x-microsoft-antispam-prvs: <CO6PR03MB627533BF946FC818A58832A2F0E69@CO6PR03MB6275.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +FUraiUXkJxjOFt2pBfD+IetP2vozcl37eWDLFY1zEOZnjJokacMVy1S0ug8IClGlgUqBUhUymTRBCALDZHN1p+Xs1fYH4xAkPL+PYRI2hRHmjz/SseL4CzDIw4M80jmsmMWExBD0SaDWXmLIDZNqGTxS9pfWMSwff2ak5FesQYfHPoBU0uPXKQz/oOag6FP6vcWyorUeVqlscpmxS/qeG0TE+eIq8PYbkBNNB7kEh+61jEQONleBaKJ0x4AhzlTiZVUJkb79sz0FZgLUHNIvUw9ahDvclZqdc3EofXft+1fL3Nrgs7iMbvo5ccQZrLr41jK01BJbupLV+MJkvSXzPaMS9NHA4hIt2NaBVssn0NBZuCoj449x1JnI/m2PdZzINgABmh0LByEU+k2Sy/QRWxsvNGdJhKkJ8I0dDCLGLe8vD3itstddpTp+bT7y2QydEtC0+V/ROwvCOdBf3KE8cgfCZXwhvAOSuoHDmtvifWdjmOgR2sZ7Rgcz0qQEGejU/WW+ttqhLtKVQQwVvhNgz9h0DN4BJlAWsjx9AxrJm0IzdT+X+59F4HAd1J9IqgXaMJ7ElFjYXiAQKJWTihpWQN3y7Vk40DfzCrVqShqpfmMNTcYDPiO2iYga7fXmJtn3HzAPnXby2zUxdayUBOaj/0B1kwmPfvHz5chdI1i/rQUPkJVg2Dsoya3oJSb6FMEFk+9SJShxWNBOuXJ7db2hQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6382.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(9686003)(53546011)(110136005)(38070700005)(86362001)(33656002)(7696005)(54906003)(6506007)(38100700002)(316002)(76116006)(66556008)(66476007)(26005)(508600001)(186003)(44832011)(4744005)(8936002)(5660300002)(71200400001)(52536014)(122000001)(66946007)(4326008)(66446008)(64756008)(8676002)(82960400001)(91956017)(55016003)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?2d4FtgKC9IohhqZZ+YUGTmG3hwzXi4+8xa98zF7JhWz9zRLZdwm1YcET+F?=
 =?iso-8859-1?Q?S33a22EdOSlb6O72OeOZw/qwrSJU1vGEQeGbtusgu6o7B6HnQ6Btrq4r8W?=
 =?iso-8859-1?Q?K2KfyYJiHY1oWNrLprK/2CFEDxfYvHuC+xe9H1yr2FvehBpRSo8RpejJCs?=
 =?iso-8859-1?Q?pzoDghZ9zkfuVrrhAZQt0+6+4XtR4pkgfTT17ILx85eHomUX+tDOS7CAcX?=
 =?iso-8859-1?Q?2F5gEjRE7WavjHEgIbBkxZJzrl5WD9JJQJypKRMRf3Op9S142lyjC5HwFu?=
 =?iso-8859-1?Q?XJ+ktpW4SzF8UepHyelVrzMNDp9gdL1gxK27+f78St4wGOoAbCeFZJTbCD?=
 =?iso-8859-1?Q?Q9vd6pEo0ZCvQtSn0/tleP7G8pqEoqJPAohrKZIchlx7JkIRijEazwa0IA?=
 =?iso-8859-1?Q?SIn+ye+jlLykMtKuebIEbVtQg02w3509yTWykDHqwxbw0bO0Ehd9rIQY8g?=
 =?iso-8859-1?Q?6W0n++8q3xDgeHaA6d13Opd3O0UxXo384C1daqu2y+tylUegY9ykidbIfV?=
 =?iso-8859-1?Q?mWHY5tg9KHIbJYyGT4iJHpvR629i9d0I6+ca9/Wq/XomV5irsm6lgc/4EC?=
 =?iso-8859-1?Q?wGx2E4Xxtor9gfWuD1j5yHUQllEF48O6FlQ9pMKmCdPNgYSCPQLX4rx+Lr?=
 =?iso-8859-1?Q?acazMoWIoi1ymHtE/L+5Ob4zPalmNwBHtd0C1Zk085BaDKlHA6CNlWNuDm?=
 =?iso-8859-1?Q?Ugyn3GnjbQlIqkoBaddXT2A2m4EftNH2dl1iQ0tjxPx/CciBrQKAZRnAGD?=
 =?iso-8859-1?Q?W3QZHIwfjt287W3GDvWUwhj8EpQoGfjt510FGcfaZbXaeDGUFXsXchV20l?=
 =?iso-8859-1?Q?n/oTBSEtshCyBVFC4+VDZniOFkqk75UngQWsGjuAk/ptaeOqeUZ31RwZfF?=
 =?iso-8859-1?Q?zYipOld63le1iT++UZt+ghvelz57mjHW1zNtIYvHuremQSFEp28BF0FI9l?=
 =?iso-8859-1?Q?TCCndzaKS/Pj+Rb9S2HlZmROXxhR5vqvH4V+7Stz8yalcyHzaJCM83Abe8?=
 =?iso-8859-1?Q?0SyfguNZE8B1o4w+mBAMzViF+r9upGOI5yyK4NaAvAsYqf8CFpIT0OkKGZ?=
 =?iso-8859-1?Q?LgmkH1Ye9Z8hUEqVgMHziKI7E9CvVqKP5mTfjQ/HybdnVx/l28YtqA88U4?=
 =?iso-8859-1?Q?+p9S8y0efJqtQW3aylLlcXd9rmJhW+mbmUJdcq3mwZtfXo1k4ekYFnFugl?=
 =?iso-8859-1?Q?mHcesFXMumbflDm69VA+evm8cLHmWS2w1Wz8cPd0QCRvgIH6/l0jyZVX9C?=
 =?iso-8859-1?Q?023Xlflz+yOmX2ee3b5D82GKi7/DFP6eVoYUz8chhuxFTOaN2iz88fSCDS?=
 =?iso-8859-1?Q?sB6NCt5Qihk4J4MyNcG8i8AJtHyvlEIo7T3TTROZxnDK12XHxeq6c/h9Z5?=
 =?iso-8859-1?Q?yPZxZ45QE3y0JcmABt4Lfh4fwb0RHXU6lvq1l8D0vJFd7MsqHm3kAuTBt6?=
 =?iso-8859-1?Q?kR+XMMc/MdHmmbzxIk06oqBXFunB8xOV8DPTfDuZFUNv55vuMO/avg5hfR?=
 =?iso-8859-1?Q?Gqii50ZKj3VWQ0TiICnz09GFcho9+acxc0tbMYtdnv273g+cuMhwkY0xss?=
 =?iso-8859-1?Q?NQp8LUMPAAApThswfQkxU2SPtP0uwr2+EFLQpqLfBzWzbbv5U+9bwiMarO?=
 =?iso-8859-1?Q?gB8H75gr5UR5zrqgig9M43dv5yPEHMHzkRzLUSDdnQOJJGHFlyuoHe0i0E?=
 =?iso-8859-1?Q?8c/UyyA79Njo3RCs6GM0SaK/BzQXf27QmdKJkFinIBHBHvBaeNvoe+pfyF?=
 =?iso-8859-1?Q?ICUVlO4zTdkmPk6YWnj+LPO+v6+0ZZXaBjTFnpCsTV7+HYJdRa8A+TCcfF?=
 =?iso-8859-1?Q?Jr37tGNCIA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6382.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdce1558-3e84-44e6-deb6-08da18a4396b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2022 14:38:04.1701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5/uwsSCqFSzajWHhYm6IhykiUALzZYIbE3gqd7HIn3K7bSmr+TAXvEq8CYJlN26F9e2FdGvy9hywrQtnfKfdZ2jZGNMNrgbG478aqe36us8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR03MB6275
X-OriginatorOrg: citrix.com

> From: Anthony PERARD <anthony.perard@citrix.com>=0A=
> Sent: Tuesday, March 22, 2022 11:22 AM=0A=
> To: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>=0A=
> Cc: Anthony Perard <anthony.perard@citrix.com>; Jan Beulich <jbeulich@sus=
e.com>; Andrew Cooper <Andrew.Cooper3@citrix.com>; George Dunlap <George.Du=
nlap@citrix.com>; Julien Grall <julien@xen.org>; Stefano Stabellini <sstabe=
llini@kernel.org>; Wei Liu <wl@xen.org>; Bertrand Marquis <bertrand.marquis=
@arm.com>; Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; Roger Pau Monne =
<roger.pau@citrix.com>; Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>; Ros=
s Lagerwall <ross.lagerwall@citrix.com>=0A=
> Subject: [XEN PATCH v10 2/7] build: replace $(BASEDIR) by $(objtree) =0A=
>  =0A=
> We need to differentiate between source files and generated/built=0A=
> files. We will be replacing $(BASEDIR) by $(objtree) for files that=0A=
> are generated.=0A=
> =0A=
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>=0A=
> Acked-by: Jan Beulich <jbeulich@suse.com>=0A=
=0A=
Acked-by: Ross Lagerwall <ross.lagerwall@citrix.com>=

