Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA7A43CDB1
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 17:35:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217073.376915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfkxE-0001LD-BL; Wed, 27 Oct 2021 15:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217073.376915; Wed, 27 Oct 2021 15:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfkxE-0001Iw-8F; Wed, 27 Oct 2021 15:35:04 +0000
Received: by outflank-mailman (input) for mailman id 217073;
 Wed, 27 Oct 2021 15:35:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ie0f=PP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mfkxD-0001Iq-Hj
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 15:35:03 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 72a38e14-373b-11ec-8475-12813bfff9fa;
 Wed, 27 Oct 2021 15:35:01 +0000 (UTC)
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
X-Inumbo-ID: 72a38e14-373b-11ec-8475-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635348901;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=omqzar+LVci20djhtPeKhrDhQttQh6vnd5U9NP+pDLU=;
  b=Sm8Wa+gNfqcPbg9ktaIVLMf75jsy7Z2lwuEgH/ekwV1n6D0ntGnUmeg7
   9Ds93GzVdmkPp8QLDmsHy+FBjxNdw+Xs20S8AyM9lONBBvi+RMc07QxPX
   51cSL5xiQTHnYjPE7JgU8l4PF3sbixe6R8gNMTtw6D4a0DSS1bNQgK7VG
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: DgHiUFgs+7zIGXMUdNZH+0wbZFoPWPvmH382QJiAwIbIdHtsjA18CCcPw3aSPdjeu6l4mr/2to
 D5NiutJwanj9Bo7+uut/bI2z76Aw+kxAnCZyZaFG15qOv+gG3qxtkhAmewrZ+qzSi0EBIK+irC
 SWTRRvGcfxqHwiF3WTVTw8uI6C9Wt2pMsObIlCfKhILwKS+DFMM1wFltvAuM8VJcXhelwqhPVL
 2Nr2hugwu10qhYFbxUSs/0xViYvq0fld4KG388cpDB9L0Qmk1ISQeABNtz41CLXP5MtTUMfrOF
 APBke8II/diKMGzT3xCM7vi2
X-SBRS: 5.1
X-MesageID: 56414692
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:j3ovtqpFYUx3T4IJyLbleJkDUzJeBmICYxIvgKrLsJaIsI4StFCzt
 garIBnSb/aCMDemf4h2aN+3o0MHu5PSx4VqTgM++CA8FCxA85uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd+4f5fs7Rh2Ncx2YLmW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZyyGSg0Prftov4UVAVYMiN/Eqd/0YaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp0QQa+CO
 ZtDAdZpRAXyZDgfGFEQNJg/gtyyq1z8fg1/gnvA8MLb5ECMlVcsgdABKuH9U8aWSMBiu1eXr
 2PL4Uz0GhgfcteYzFKtzHWogePemDLhb6gbHra46/1CjUWawyoYDxh+fVmxrOS9i0W+c8lCM
 EFS8S0rxYAo/Uy2Sp/mXhu3oFaNpBtaUN1Ve8Uw5RuR0KPS70CcD3IdUz9aQNU8sYk9QjlC/
 k+EmZblCCJitJWRSGmB7fGEoDWqIy8XIGQeIygeQmMtxN3uo5o6iB7Vef9lHLSold3+GTz2w
 DeioTA3gvMYistj/6em+VHKhRq8q56PSRQ6ji3wWm+m9Qp/aJSSW52z6VPb4PBDK66UVlCE+
 nMDnqC29/sSBJuAkCiMRuQlH7yz4fuBdjrGjjZS84IJrmr3vST5JMYJvW84dBwB3ts4lSHBY
 E2Dlh5R/r5pJnKtca9WYYOeAf0D9P21fTj6bcz8Yt1La5l3UQaI+iByeEKdt1zQfFgQfbIXY
 sjDL579ZZoOIeE+lmDuHrZCuVM+7nlmnTu7eHzt8/iwPVNyjlauQrAZLEDGUOk96K6VyOk+2
 4cCb5XUo/mzveuXX8U2zWLxBQxVRZTYLcqvwyCySgJlClA+cI3GI6SIqY7Ng6Q/w8xoeh7gp
 xlRoHNwxlvlnmHgIg6XcH1lY76Hdc8h9i9hYnd8Zw7xgyVLjWOTAEE3LcNfkV4Pr7UL8BKJZ
 6NdJ5Xo7gpnE2yvF8shgWnV89U5KUXDafOmNCu5ejkvF6OMtCSSkuIIijDHrXFUZgLu7JNWi
 +T5imvzHMpSLyw/XZ2+QK/+kDuMUY01xbsas73geYIIJi0BMeFCdkTMsxPAC5tTdkyTl2HDj
 lf+7NVxjbClnrLZOeLh3Mish4yoD/F/DgxdGWza5qyxLi7U4iyoxooobQpCVW21uLrc9Prwa
 ONL4ev7NfFbzl9Gv5AlS+RgzL4k5suprLhfl1w2EHLOZlWtK7VhPnjZgpUf6vwTnudU6VmsR
 0aC2thGIrHVasnrJ0EceVg+ZeOZ2PBKxjSLtaYpIF/37TNc9aacVRkAJAGFjSFQdeMnMI4sz
 eo7ltQR7giz1kgjPtqc13gG/GWQNH0QFa4gs8hCUoPsjwMqzHBEYIDdVXCqsM3eNY0UPxBzc
 DGOhafEi7BN/Wb4ciI+RSrXwO5QpZUSoxQWnlUMEEuEx4jejfgt0RwPrTluFlZJzg9K2v5YM
 3RwMxEnPr2H+jpliZQRX22oHA0dVhSV9laolgkMnWzdCUKpSnbMPCs2PuPUpBIV9GdVfz56+
 rCEyTm6DWa2LZ+phiZiC1R4r/HDTMBq8lyQkc+qKM2JAp0mbGe3maSpf2cJ90PqDM5ZaJcrf
 gW2EDKcsZHGCBM=
IronPort-HdrOrdr: A9a23:TASrlaijH/1iBnMCCywPWDfb0HBQX0Z13DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3I+erhBEGBKUmsk6KdxbNhQItKOzOWxFdATbsSl7cKpgeAJ8SQzJ856U
 4NSdkbNDS0NykEsS+Y2njJLz9D+qj+zEnAv463pB0BPGIaCdAS0+46MHfhLqQffng2OXNTLu
 vk2iMonUvGRZxBBf7LeEXtEtKz6uHjpdbDW1orFhQn4A6BgXeB76P7KQGR2lM7XylUybkv3G
 DZm0ihj5/T/M2T+1v57Sv+/p5WkNzuxp9qA9GNsNEcLnHJhhyzbIpsdrWetHQeof2p6nwtjN
 7Qyi1Qc/hb2jf0RCWYsBHt0w7v3HIH7GLj80aRhT/ZrcnwVFsBeoJ8rLMcViGcx1srvdl63q
 4O9XmerYBrARTJmzm4z8TUVjlx/3DE4UYKoKo2tThyQIEeYLheocg050VOCqoNGyr89cQODP
 RuNsfB//xbGGnqLkwxhlMfguBEY05DWytvGiM5y4ioOnlt7T5EJnIjtY8idixqzuN7d3FGj9
 60e5iA2os+CPP+VpgNcdvpd/HHfFAlcSi8Ql56Hm6XYJ3vG0i94KIfs49Frt1DRvQzvewPcd
 L6IQpliVI=
X-IronPort-AV: E=Sophos;i="5.87,187,1631592000"; 
   d="scan'208";a="56414692"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zzof1VCqOUXSUPe8bqPiN/FXUHWHVVhyVu0BJOf6I8jGAGbbILqg19WIPBmVrY+rO21K0UpoLFi6qe4j569LJYx7NLW9xkxgjfMWAYTXIpOvXRXQHLs0+DLY8IvPpYWJYQVtvtKk93aJleu//w1qEE6AhsTOuiWZQm5c68icu9X5txa3ymXyoz5dQ5QWIliws2lrNZfkqhDu79XNtaCSInAvY3kW4qrWIOlCsocVcGvehcE+AALUAt7VvENl1KUsd/ThSFqOtyerd5nvg+yoHVN2IQlNk7r+IvOaMlgTU+5C5/6ftUXpUw55JCwJ+RLDNhWGpJjV9t3GJu1ls6tI8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7Fv1Im5mtr/Kbm5XYnuYLi1vcvEW6YgAsGomI1zCzs=;
 b=Rlh4JaMVAiXFT3w3DIZej3uprGNX/9mk2kbN+9ATk3isWgKUmzq0ZyCiCMLVltGxp5xeEfIzRteNT46X31+2NVWoc1yvg2xxGAiU5xuChmdXDWl7aXs4wufrvkqDtCblwj3i4jrlISxYzn8F0ELB5tdphiz5L07cz93uPZY9qAzknpihpRy29wc1038pSNyLTwASBRE3c+4wg6DErPTxCzcOCkGJPF7sIV7yI9wO4J1i8tq1u7UlMXIlZawewv4EyXUBnFiP20eI0Mp7fE6T4CjINoKXj6sGgd40T2PxvzGj3I1836RQ/9ehSmXgTYyRK3o6TkXDmUzXkRQzq7PA9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E7Fv1Im5mtr/Kbm5XYnuYLi1vcvEW6YgAsGomI1zCzs=;
 b=gch4TUWWilt444k/1CWoknRnucGr3h93rFHJUOHVxUBwOuqlHAa3iiv5fgIhqXQkyf4VfIhmMBpN8yYACkIGLBrLX3J4tKv/13/GsVFcgAAp7Q4SH1fVAmaQAzHZahP1AKn1SekFP+L0/ISxRMWqJUvCGfZnnQJB2VpM/a5QFYI=
Date: Wed, 27 Oct 2021 17:34:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"jbeulich@suse.com" <jbeulich@suse.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH v3 03/11] vpci/header: Move register assignments from
 init_bars
Message-ID: <YXlxmdYdwptakDDK@Air-de-Roger>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-4-andr2000@gmail.com>
 <YWbkZ216FbV8lBns@MacBook-Air-de-Roger.local>
 <89e1f09e-c840-860e-e596-38fb141aa707@epam.com>
 <344cf880-8f76-1a71-d27c-e7ba10459d5b@epam.com>
 <YXlS68Ghrphi5dHB@Air-de-Roger>
 <368bf4b5-f9fd-76a6-294e-dbb93a18e73f@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <368bf4b5-f9fd-76a6-294e-dbb93a18e73f@epam.com>
X-ClientProxiedBy: MR2P264CA0144.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::36) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9574d431-39a5-4bb0-5584-08d9995f533d
X-MS-TrafficTypeDiagnostic: DM6PR03MB4299:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4299DC31C442BAA8C75B6DD68F859@DM6PR03MB4299.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JmtGjcnb0nPPxBepb86jcaJulj9p2SVae4KRUVGOpoOKsKs+NdCFPcXWEZr0zqL8Ywkk26t3i7jdGIPgOo4NNuZ7ECUMdsj5Fc3LxncsKvzqedOLcdkcizloXD9ZVOBfBWguXs9nZ2J0uLVF+sW3gYZeNgJOFkIfzXfpj6YUIKIyYqtfTkuj1BTiI5PtNr1MhQqkXWm1gWqvrSePLNHSNYmRvgjSaB+IWqH+zKb0Zxa5PiF7ZGKl00SE8gQK2P2lUH1XyQ0TtlnoXTA58k5SgMO4Mf1jdl4jHCdiDY651u0xuKb/1zAZD/FWooTG9EHDxMO3G4jrkYyGt3T69XIs/zgm3COkyF5TyV8pz7FA/2hQY71VSzY3dvLL+b8197ZCzRP3THF+ItE7GlBxZh9y5gQPxHo0ox3Vl3A+/m6igkcl1Sn24HMGFwKDZ/da04qAhtfNovYDCRMwEeMrLp9E1qNS0M8AdmMemz6pt8lz1016hDJ5K03cENf8mfstqwuORdUmSl7g+Xv711dIFYAMSOZWH1a9IoaYDAVK5l4880A1krJhqM8fBBgzbqUCvP6EFNeWqmkZLMXa0Dt4SmwSwfFJWszW1J2NbATISl2F1NdJtxk8jY7DmaFfNioF4rr+YMEJglyBPrDZj0dTJ1Ibyg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(6666004)(26005)(53546011)(186003)(508600001)(5660300002)(33716001)(6916009)(2906002)(54906003)(4326008)(9686003)(6486002)(316002)(66946007)(956004)(7416002)(6496006)(85182001)(82960400001)(66556008)(66476007)(8936002)(8676002)(38100700002)(83380400001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0ROamkvdzlQNXV5Y0NLSDRWVmRhTVYxTmw1TDVSRTZ3by9Xb0t4MnROZVRV?=
 =?utf-8?B?VW1uTnFIWUhCT0tjMDFUdjlnRStUbStBcVZGM1NHajVtbnZJcnFwMDh0YWRN?=
 =?utf-8?B?RVVHTUVpNjVWSDdRRTBlVktsVjdnQmxEY1E1T0dmRmlYWUpUTkRUMzhTWk5W?=
 =?utf-8?B?K3dHcnlvRjR4S3FGL3hCdFE2c1drOWFWZ2FQTW43VGxhMkNyb1dNWVljNldJ?=
 =?utf-8?B?cHJPQ0ovMVlua1BiVG9XekxoNmF2VVh0c1lzeS9zUmozSzZtc1ZVYkpMZDRF?=
 =?utf-8?B?NDBXWmNVMkEyN2NORyt1eUh6azdwb1JkRlJUbm9SZE5ZMWVocFRTS2NrM2to?=
 =?utf-8?B?OFIybVVyM0RXSlE4eUtQcjEwM0hiZ2lsMkVHWTZGdlpWVFlGYWluTjRFWGYw?=
 =?utf-8?B?ZGl6YnAwS2VtMk5JTGU4VHVxMXRwUHBrQ0VuRjNRWnNoOFdaaVNmdXZKYWVw?=
 =?utf-8?B?U2xaaVljdzBZVW41djZtWXVrelpDUWtwZEpMUmRUSDI1SEV5cDZ3MkZMSzVM?=
 =?utf-8?B?Y0NaNm5QUHBqZ0JQZFJwZEtKY205djFydlZYSjBuWllVcDlhcHh1UlNYYWwv?=
 =?utf-8?B?UWl4QUY5Mk5WU2pXczVuL3E0NE5mR2htL2ZOQmNVeVV0Y0J3V3Jla2VKOGEx?=
 =?utf-8?B?MHhWdHlRMUdUeTJlQzJCKytGYWt6SDRIVnZaemhldjJYbXQ3WGVlOGRLa3gz?=
 =?utf-8?B?dmhZM1BvTmVQYjY1YTREL1ZCQ2RuQnMrZHM1WU10eWhvNFFxbGhIaCtEelI0?=
 =?utf-8?B?RWxmRzNyOXl0UnhZdzlURWl2MGZodElzdFpZUE5BMkJwejNESWR2Y3Jkd0dm?=
 =?utf-8?B?UEh5dzI2aFZOMm1iRVRmN3hTSzZsWm91UnU0ODFIN1Q3ekpmT3ZEdUtSSUlO?=
 =?utf-8?B?TmtUZnE4cTJXQWRoc1dHYW5JcEVuVXFjK0NpSE1xOHZmcWtqNC9MNzhuaDB0?=
 =?utf-8?B?anRsY2FlOUt0NlVyUFozTG9vTm5MSUd3d3ZtRzFKdnhCc1RhWkQxdGpWcVh1?=
 =?utf-8?B?RjJmdnhKbVJOYm14eTFNMmxoYTZXQjNmRS9pWk1WNXp5NzFNZTRRbDkwK3dr?=
 =?utf-8?B?VHZMTGFEenhSMko1R29FWjNQR3FjMk5XVm9ySjl6OFhNZDZmZDl4bGJ1bzNW?=
 =?utf-8?B?UWd0UFNuOUd5MSsveEhOZThETkk5WnNobFZVQWRaTWJyblFqUWw5T08vUzh2?=
 =?utf-8?B?QitjZjgvK0RIWGMwOTZ4eEZ5S0hpWFlCZVFOc3orRjlZVHBoZktkWG1FM0V1?=
 =?utf-8?B?RVNEYlVLSzdxZUp5bnM0anIyVkFNV0t0ZE9CQ0NMREJ0RVpkeFZVS2R1MXFn?=
 =?utf-8?B?Qzl5SGU5OVNRQTVveXVSUGFvTnQ5T253dTEzZDhrcXh1aGdjTWFKNm9OdUE0?=
 =?utf-8?B?NXRrSytTMWhlTC9xV1NJTkpiNEFtc0hYTis5Y2t2SG83dmdVMWpuRmdWb295?=
 =?utf-8?B?UmVRcWxOdXlENGlDL1FRTm1ObzRCbnBjMVllY3V4T25nSkZlOXpZYkVqekJp?=
 =?utf-8?B?T2RnWEo3S2NQL3VFYUM1U1MwZVgyVnRySWtaeGlyT1B3Y3c4TkE2NTU3VFRQ?=
 =?utf-8?B?ZUNHZTZuTUpGNjFWWjFEK1Qyek9mamJJM1pXQWRSZGJtbzJqYXBrdzFjVGlr?=
 =?utf-8?B?cHNMZ2t5VGhITjVXZFdUMFVqQ2RQSkFNOTVyZURsN0c0cWVoTEt5ZzFFMUJ1?=
 =?utf-8?B?REgxYWsxekI2ZTcvaHR1dWs2ZFBBYU5Ddm9jTnRlTWNiaTlWRUh4WjZMd2xC?=
 =?utf-8?B?Y3d6ZzNpUC8vRGpoeHVJUmhlSFl0RTJlRGVaODFpaUZoR1B2RHpnUSt3cTVR?=
 =?utf-8?B?NUtyRnhISExNZUl3bkFpbjduOGVlTDJkQ2JaVXhHRE5OZ3dKWjNGbERaVzg2?=
 =?utf-8?B?eVJSTmFXWlZBVWw3K1VxVS9ERS9EUkkwMERKSlFIeHNlVTZraVdBaW1ENGgr?=
 =?utf-8?B?eU1qVjlnUVNlN1hJZzJ1d1liQ3ZLbWcxdzQ1ck1nRzhxd2tvRnVDaXRlZkVJ?=
 =?utf-8?B?K01wWWxMUmxDaWExY1cxYW9JU1ViQW50Z0dyNjVObEYxVTV5SHlEVzdpcGdK?=
 =?utf-8?B?SkxNaGRPWXRVUXhja1dKUzJmdlppam9SellCNzU1WmdvbXB3WnBzWUNrd21l?=
 =?utf-8?B?dnpRQ3gydkVhc1hqUW95aXdNU25QRi9Ec0lmTXF3RngzMXVsWndPdkJuWGhN?=
 =?utf-8?Q?B/5OVE2nw7vHl4kBdzydl0M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9574d431-39a5-4bb0-5584-08d9995f533d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 15:34:54.8799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJrhyvBFhkM8mdz5yapYlw1sItk9gOOOzPwA+4va2ZSw17z1CMT4BhdJ2xJXSbhnKd61jRWCI8kPxaE5pUZ6fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4299
X-OriginatorOrg: citrix.com

On Wed, Oct 27, 2021 at 02:06:40PM +0000, Oleksandr Andrushchenko wrote:
> 
> 
> On 27.10.21 16:23, Roger Pau Monné wrote:
> > On Wed, Oct 27, 2021 at 11:59:47AM +0000, Oleksandr Andrushchenko wrote:
> >> Hi, Roger!
> >>
> >> On 27.10.21 13:17, Oleksandr Andrushchenko wrote:
> >>> Hi, Roger!
> >>>
> >>> On 13.10.21 16:51, Roger Pau Monné wrote:
> >>>> On Thu, Sep 30, 2021 at 10:52:15AM +0300, Oleksandr Andrushchenko wrote:
> >>>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >>>>>
> >>>>> This is in preparation for dynamic assignment of the vPCI register
> >>>>> handlers depending on the domain: hwdom or guest.
> >>>>> The need for this step is that it is easier to have all related functionality
> >>>>> put at one place. When the subsequent patches add decisions on which
> >>>>> handlers to install, e.g. hwdom or guest handlers, then this is easily
> >>>>> achievable.
> >>>> Won't it be possible to select the handlers to install in init_bars
> >>>> itself?
> >>> It is possible
> >>>> Splitting it like that means you need to iterate over the numbers of
> >>>> BARs twice (one in add_bar_handlers and one in init_bars), which makes
> >>>> it more likely to introduce errors or divergences.
> >>>>
> >>>> Decoupling the filling of vpci_bar data with setting the handlers
> >>>> seems slightly confusing.
> >>> Ok, I won't introduce add_bar_handlers, thus rendering this patch useless.
> >>> I'll drop it and re-work the upcoming patches with this respect
> >> On the other hand after thinking a bit more.
> >> What actually init_bars do?
> >> 1. Runs once per each pdev (__init?)
> >> 2. Sizes the BARs and detects their type, sets up pdev->vpci->header BAR values
> >> 3. Adds register handlers.
> >>
> >> For DomU we only need 3), so we can setup guest handlers.
> > I think you assume that there will always be a hardware domain with
> > vPCI enabled that will get the device assigned and thus init_bars will
> > be executed prior to assigning to a domU.
> Yes, this is the current assumption...
> >
> > But what about dom0less,
> it was decided to put dom0less out of scope for now
> >   or when using a classic PV dom0?
> I thought that vPCI is only used for PVH Dom0 and it is enough for now
> (yes, this is a weak argument, but we do not want PCI passthrough on Arm
> to become a never ending game... since 2015...)

I understand that not everything will be supported, that's perfectly
fine, but we should aim to not make supporting those use cases
harder in the future.

> >   In that case
> > the device won't get assigned to a hardware domain with vPCI support,
> > so the vpci structure won't be allocated or filled,
> Yes, this is true. But because of the 3 functionflities of the init_bars is
> doing it might still need some dis-aggregation, e.g. BAR sizing
> is not needed and might not be possible while assigning to a DomU.
> So, I think that init_bars will need to be split in any case.

I understand that BAR sizing will not be needed if the structure is
pre-initialized, but I also cannot see why it would be impossible, at
least on x86.

> >   and hence
> > init_bars would have to be executed when assigning to a domU.
> Please see above: not sure init_bars can exist in its form to achieve that.
> One of the steps this patch is doing is we split init_bars into
> a) register assignment
> b) all the reset: initial pdev's header initialization, sizing etc.
> 
> The same is true for MSI/MSI-X. When we add support for MSI/MSI-X on Arm
> you will see the same: we need to split [1] (this is WIP).
> 
> So, I am still convinced that we need add_bar_handlers in some form.

I'm fine to split it if there's a hard requirement, but I'm afraid so
far I'm not convinced it's required. Maybe if you could elaborate on
why BAR sizing might not be possible when assigning to domU I could be
convinced.

Another option might be to just modify init_bars to have slightly
different paths for dom0 vs domU.

Thanks, Roger.

