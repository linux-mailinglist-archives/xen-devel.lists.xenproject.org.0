Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7334A445368
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 13:57:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221526.383276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1micIM-00031Y-UP; Thu, 04 Nov 2021 12:56:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221526.383276; Thu, 04 Nov 2021 12:56:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1micIM-0002z7-RA; Thu, 04 Nov 2021 12:56:42 +0000
Received: by outflank-mailman (input) for mailman id 221526;
 Thu, 04 Nov 2021 12:56:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WbKJ=PX=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1micIL-0002z1-WC
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 12:56:42 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5d4867f-3d6e-11ec-9787-a32c541c8605;
 Thu, 04 Nov 2021 13:56:39 +0100 (CET)
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
X-Inumbo-ID: a5d4867f-3d6e-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636030599;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jEzrk8E4XJmCR/FBRCX9U5kAowOT4EQsSDSaetAW0Xg=;
  b=aEVva/DHHPzNu91QBnNBZGG2wVEJ/mLh0DEjR1v6AmxYokbO7c4gAAXn
   Irx3QkMPLJq6OmMloaAyBZfKE++O577IRhgYYmK+7kFj8p0o9/DpW0Vcb
   IPhH07N2tJPr+JuzdW6BCcXGQznJs0zZgbm0BRGXFsT62yxY/UdOwBphe
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: iHNCIau0hJkGgg26qn+sD9vX+27O8kC+8Xl0/dJM9SI4Xeh5Edt5MUgA/R2VuuEUKSeILRBFGG
 kRRnxoCl4s3FQ8kCB3nhPaKaeKobyQ1tRFgeR45vcIFu6WnTUg5Eoi8qdD4eaq7jl/72CiRER6
 J3K40ok14f8vg0lKMgvpacleXDq8naIpsqJogtxzd0eP+wmKU4M1C/QePIIC0VlZ1jw7aEziDw
 NGnuorAFZuTedQQ+hRJ7RIY9EEBs7xUpfm+gPHJ7nxEUoDnz7fUgHagkquHy4A9Kfpqc0LDrPf
 BlubxCWowT2GUz4hRpMDOtvs
X-SBRS: 5.1
X-MesageID: 57456733
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:QuUdl6oW3/rU+lQlIEpRvP3Wv8teBmJHYxIvgKrLsJaIsI4StFCzt
 garIBmPPfzfZWLxf9h3b4WypkgB6sCHy4c1SVc+/y5hQSsQp5uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd+4f5fs7Rh2Ncx2IDlW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZqSFVYCNIDMoccYUidoOC9hPKBY3paSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 pVFNGQwN0+ojxtnFgYSWbUSxL2SqmjbUh1kiFaaj/Aryj2GpOB2+Oe0a4eEEjCQfu1XlEuFo
 mPN/0ziHwoXcteYzFKt8G+oh+LJtTP2XsQVDrLQ3u5nhhify3IeDDUSVECnur+ph0imQdVdJ
 kcIvC00osAa60iDXtT7GRqirxaspQUAUtBdF+k77gClyafO5QudQG8eQVZpVtsis8MnQC0w4
 XWAldjpGD9HvaWcTDSW8bL8hTKtOwAFIGkafygGQAAZpd75r+kbjB3VSc14OLWoldCzEjb1q
 xiGpTYzr68ehskK0+O851+vvt63jsGXFEhvvFyRBz/7qFMiDGK4W2C2wV75sadrJquZd3qEv
 UY0sMaB7e0QK7jYwURhX94xNL2u4v+ENhjVjlhuA4Qt+lyRxpKzQWxDyGogfRk0a67obResO
 RaO4l0JuPe/KVPzNfcvC79dHfjG2kQJ+T7NcvnPJuRDbZFqHONs1HE/PBXAt4wBfaVFrE3eB
 Xt5WZrzZZr5If4+pNZTewv7+eV7rszZ7TmCLa0XNzz9jdKjiIe9EN/pymemYOEj97+jqw7I6
 dtZPMbi40wBC7CvPHSPqN5JdQFiwZ0H6Xbe8Zw/mgmreFsOJY3cI6WJneNJl3JNxvw9ehj0E
 oGVBRYDlQuXaYzvIgSWcHFzAI4Drr4kxU/XyRcEZA7ys1B6ON7HxP5GK/MfIOl2nMQ+nKUcZ
 6RUJK297gFnF22vF8I1NsKm8uSPtX2D2GqzAsZSSGJgI84+HFGQpYKMk8mG3HBmMxdbfPAW+
 tWI/gjaXYACV0JlCsPXY+io1FS/oT4Wn+caYqcCCoA7lJzE/Nc4JirvoOUwJs1QexzPyiHDj
 1SdAAsCpPmLqIgwqYGbiaeBpoavMu1/AksFQDWLsefobXHXrji53ItNcOeUZjSBBmn6z7qvO
 LdOxPbmPfxZwFsT69hgE6xmxL4V7sf0o+MI1RxtGXjGNgz5Cr5pLnSc89NIs6lBmu1QtQesA
 xrd8dhGI7SZfsjiFQdJdgYia+2C09ASmyXTsqtpcBmruncv8ePeA0tIPhSKhChMF5dPMdsok
 bU7pcobyw2jkR52YNyIuT9ZqjaXJXsaXqR56pxDWN33ihAmw01paIDHDnOk+4mGbthBPxV4I
 jKQg6ae1b1QylCbLig2HHnJm+FcmY4PqFZBy1pbfwaFnd/Mh/kW2hxN8GtoElQJn0sfi+8ja
 HJ2M0BVJLmV+2Y6jcdOaGmgBgVdCUDL4Uf20VYIyDXUQkTAurYh94Hh1TJhJHwkzl8=
IronPort-HdrOrdr: A9a23:Va30CqlEzM2H4AApOplDlBZ1F3zpDfO+imdD5ihNYBxZY6Wkfp
 +V8sjzhCWatN9OYh0dcLC7WJVpQRvnhPlICPoqTMmftW7dyRSVxeBZnPffKljbehEWmdQtrp
 uIH5IOceEYSGIK8PoSgzPIYOrIouP3iJxA7N22pxwGIHAIGsMQnTuRSDzrdHGeLDM2dabRf6
 Dsg/avyQDQHUj/Iv7LfEXsCIP41qz2fd/dEFI7Li9izDPLoSKj6bb8HRTd9hACUwlXybNn1W
 TeiQT26oiqrvn+k3bnpiHuxqUTvOGk5spIBcSKhMRQAjLwijywbIAkf7GZpjg6rMym9V5vut
 jRpBULOdh19hrqDy6IiCqo/zOl/Ccl6nfkx1PdqXz/ofbhTDZ/MMZFjZIxSGqT12MQ+PVHlI
 5b1WOQsJRaSTnamj7m2tTOXxZ20mKpvHsLi4co/j9ieLpbTIUUgZ0U/UtTHptFNjn98pobHO
 5nC9yZzOpKcGmdc2vSsgBUsZyRt0wIb1K7q3U5y4ioO2A8pgE/86JY/r1fop44zuN+d3EejN
 60dJiBl9l1P4crhOxGdb48qPCMexjwqCT3QSuvyGTcZdQ60k322unKCZUOlauXkc8zvdYPcK
 qoaiIviYd1QTO3NfGz
X-IronPort-AV: E=Sophos;i="5.87,208,1631592000"; 
   d="scan'208";a="57456733"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCuaSNZaPX1CZLpEK/FGMMG/nFhPPP/52dl5dmi1JSRmaPJm2tiM/csWCOCqIBU+Zx4n37oYXUl4LtsX2EMCC9NF4tSPm0dGQ3ek8WbzUimjYYJ/6dEraV7m7ClCTouN3b0DLiumgOOxcGqmvDVTl1Z4za611Xw1dTgGb2UgT3RDD3oDqoeKTgu0F2jvi/RxVJZO+XNZc0tD6k7UKXL/A5ZLEw04t7+G+E5MDuwpJiENHgxE8juknNwhuCj9sHrSSNzZUPqeS0KCTIu1TQ2Dge2955xm6UuKizrhVqNsUE/3aHwqaUQr/UxcsiCc5YaS/cG6Jamo8wVF8DNMBtOAKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jEzrk8E4XJmCR/FBRCX9U5kAowOT4EQsSDSaetAW0Xg=;
 b=APp7DfFcVMoKTUforJQ8NJ4i7+XNBPS0PdsFXN7m8rR3N4EdfwJc9W/5Uqf5IqGqJ7FPqSgDffJoe+qMYt0mRjROE7rtay4SwB3Ve/m47N5SAQipF5elbOhduZacwR1sgh8GM2estq4lUkoJaP6Qz4X7Hfg5TWJKPNnJk/Zmo7byG4uhcmP0xM+KLLTQBBsmT6yFAhF6PxhHwbFseDNVZAVHNmOs7ifvWPVWycggnN3BO75VcSk3T8u5erFVNnBgnnnpDEmvOPJUZrdnRVc1g8D5F6Xnx44UuNvxN1JuTedckYzNHZHLwfMad/hl/OhLVXqmGuCaWRkbOiIotopQgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jEzrk8E4XJmCR/FBRCX9U5kAowOT4EQsSDSaetAW0Xg=;
 b=EQUAzGbkRZuaxRp3gctF4X3XB1n9sUSzLDNbCp/qOzS/DjEN98ln3XaIca3LDs5+AzmGb+/rMGuywPMD8KtEOeICOlpxPh+MnNXHDXt4Q2twkihZgKWLedzsFS6tQ+kirzE2AHvp6Vmypga/UbcnRJOHW3wZ8WLhL/G3md8Yaa0=
Subject: Re: [PATCH for-4.16 v6] gnttab: allow setting max version per-domain
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Ian Jackson
	<iwj@xenproject.org>
References: <20211104104834.10977-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1bc6b0eb-841a-fe93-877a-5149b8b5f5dc@citrix.com>
Date: Thu, 4 Nov 2021 12:56:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211104104834.10977-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0418.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::9) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe9e5fb3-6122-4ecc-0172-08d99f92877c
X-MS-TrafficTypeDiagnostic: BYAPR03MB4117:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4117FA1D79D847B25E161A01BA8D9@BYAPR03MB4117.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Zlf6ewQ5QUfrPY6amj+NsXXYGnwN1STyOwQOp3TMyx6xNep+0W72L4Uz4ASgUA8txi/TD6FAthZ71DEaN72DUFrKY7gR6vZWsBS+MDQDNlD3XQjWmobzooy+weVs8P1gwJ/t/un5ZbP0WqBLs8ybS7TPw1+8FDvoz/NiumDKHAqTfHtZD7iV3WLNH6Yr4+PAcwue5K8aM1tJ2G1eX2gj/+JbC/SvrDLpCFYrTr2pVoAuvmwBSekZHMCXMZr9ElGNSHB6i9QDs/Syjxd5c+YUbaPKlKqE/HzfOz2nUWuq/sm0FHCL8bL7QEnXZ97k8y6mLGBGFQKIyiG/iGuqx4DCSge1MeUlcUuY+xY1AJhIkJSwdDmSBRr6cXVPIi5azQ6TVebkgheXfyQVGVYhhzbBeXRhbFQX8OGchR1V42XdYKxWzgHZK4UD0ZqskLvAcxhqBqCVqma578rHauJ2mjpLQBaxPax0h8JdKyh+IXRlx7gfiU9yHKtvMupWJdJQNR0qY5h88Gj+92u4MJ0KGknNr/ZhQvzKiPRl1nW0ZYGJjxvh4uDmb2lHLPQ2bchOzkewl3GLi5tfdutqC7MAySRxEeRxxzW9eFoI/WF3uLHJKhU/A3+Rr1tYMxLRQTaRIRT7VHPxE70E/l2Sy/S940fCdqJQW7XulEpGjFQGU9ucmOfj2f265Vn/DtCzu2g9AOaPi8OoUOyWzfFIdpCdg+hxbVD2SvUjtIgJrd86L8hrqDzDAilrHBbAQH9sTGNXAI/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(53546011)(31696002)(66476007)(2906002)(66556008)(956004)(8936002)(186003)(6486002)(4744005)(5660300002)(26005)(8676002)(83380400001)(2616005)(36756003)(16576012)(38100700002)(82960400001)(6666004)(4326008)(31686004)(316002)(54906003)(86362001)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTlNMHQwT0RUOTNHNFJldDBiQVJTWFBDT0IwVVM1bTRSSWtUcE5pSld5ZGVo?=
 =?utf-8?B?aWV0YldUZDRWSjI0YjJkRzNFYmNscWFlWjdtSTZZTlVWRDg5SXJaelhLZnNK?=
 =?utf-8?B?UmdyaWZTNS9Ud1FId3RLRVVvYWtuaEtFVDJITWdid3hNcUwrd2NBYm5QVHZQ?=
 =?utf-8?B?ZjVtQXd1OVpnNi9iSGNQUEJ4Mk9aMWJEZGE0VEdPS1lRWmF4bmYyN29YelM4?=
 =?utf-8?B?S1FHeW14eUNmQTRDWCt5dFZJRlpKaTBWQk9NYmI1eEtLSWJnSC9GWE5CeEJr?=
 =?utf-8?B?bFQ1YWV2dVRwMVdIWHJ2emVGMnRiZTZDdlUzVW9mM01COFRpNVVzbmpTb0VY?=
 =?utf-8?B?ZGZuQU5uZWhwcm9xeVduSU9sc1VkdlVnS3Bmd2RZN3A4R1N3Mk5VVjRyQmNx?=
 =?utf-8?B?NWplcTRidWpQbkVFU3ZuOFRNY1VDNG1RcnQwSSt2Wjh6azVlOWIyZ3JOZFZp?=
 =?utf-8?B?eExzcC9LeVZ3UGpMMTFwaEc1K1hFMDJKV0psd1pzb3IxdEJMSWRKcDVyUWUz?=
 =?utf-8?B?RWwzeG5PK05BWTFab3E0aHBpa0U3bzRMODlDM0ovUmhVZXF5ek5KKzdyWHVo?=
 =?utf-8?B?dVhOUjJJNDNJb0F1M3NLTG1STFE4OGl4ZWI0aUZ5SXdrMS93dElQYmVZdlVD?=
 =?utf-8?B?OFFFVHRWUWFVMVVhOHVGU04yOWkvUk1GSnE4NWFYVVlEdkN1Nm1Xd3UvTlNW?=
 =?utf-8?B?R0kxOFNKMktPKzZ3a2V6bFA0SmlER0tCMW5zajdQTVRMdGRKclc5aE05M01z?=
 =?utf-8?B?cEVXZFAvN2RQWVc2eXd6dCswSmsvQVR5ejE1TVBSY1NldmhmTGxYdUVmek53?=
 =?utf-8?B?RSsrZmZpS2RISkdJR2tqamgyWGdLVG9RMS8wMEtiUHliU0FBcUwrUkhaNU5t?=
 =?utf-8?B?SUh6Wmw3ZlFFSXNDRit1bGhBVUg3YW5yTnhUbkhDd0hMYW9wb0JOWHpuSkxp?=
 =?utf-8?B?QTdFdGVRVW5jcGQzbEVjbWpKOXBJMXU1cDR1eG9TbGh5c1JXbEZDUDU0aWMx?=
 =?utf-8?B?OTM4NFdiTFZ1OEhZNms4SlhUdFNSbEg4NE42M0hKci96YlM1UENPWWJzUVRF?=
 =?utf-8?B?bGJ6RElNZXRrWTF2bTg1VFdBRjlDTGRlZVZMeGk4MERRT2ZaNGZodmp5RzRm?=
 =?utf-8?B?UXBGd2FGVlNNV0FBSHMvc0hyS29sVmw2TTdxYTgrTUVmVU1oWGx5NHFTUlR0?=
 =?utf-8?B?a25sdjNvaENJbWd5c1Jucm50OVJHTS94MEdEQVRWTjNLNCt6K0pFT0Jwb2l6?=
 =?utf-8?B?Rng3d0RhV2gyVTQzNFovejN0ZzQ3SFJqby9saTM2ZURUVHpzcDhMZFpzYVdo?=
 =?utf-8?B?T0tLVGxMcjNhUkVTTUp4cy8welRyNEtOU0NwWDFpRlFWV0c2UFNQT0V5NGZP?=
 =?utf-8?B?aktaS0xJTWNPeFk3ckhvM01pUnVSbm9UQ092dU5YSnp2WHVsenRaeXgxWU1Z?=
 =?utf-8?B?aG84Um00Ykx6QVdva3l1dFJFeWcxdVIrUVZQQ3VEVjkxVzdyMDZ5NXBBc0py?=
 =?utf-8?B?aklEenhXNmFuS1pZTUdrSUlKUEtGNE01YkI1eG9hSDB0VW5aQlBFL0MzMzNS?=
 =?utf-8?B?aVVVM2xnM2dGZEVOZ1k3M28xWnd1ajVldUM1UUVzTkljbUlZSXo5ZWl5Mnp3?=
 =?utf-8?B?MHM1N2VaYkIzRFpZVGdZNm1wc0xOdGNyM05HYWhMckExVXd5aGFPekhMdng1?=
 =?utf-8?B?TTZZU2YzMkJvWitQeUhMRHpnSWora0FMMDd6NzJ6c2JwZis0RFBZNWJxRXg5?=
 =?utf-8?B?RUxBNkRtUklmVzE3NWZuOU1ZOXdqTm5QNE0rYkNIbThDQyswSmtZdjZPQTVx?=
 =?utf-8?B?USt5dnlTR3dzdjBGaGphRDEyblUzVS9qbzkxR0Zvd1ZuMklQR1U1bldUdkhv?=
 =?utf-8?B?VzQrcFJ4bkRVcXROM1BleXNYLzNnM1JkL3RSb0NlVEhWaUtCRHNaMDNDT3A0?=
 =?utf-8?B?UlY1bE1PaWZmWlYzeFFKU1VGeHR1ZFE5NWdjYUUrb2FXb25QeUIzaHFpcGUv?=
 =?utf-8?B?Ky9BbFVHWnFqSi9wcnJzdk11YVo2Tld3TDhURWk5S053OGZpQTBmRDF4MnZ2?=
 =?utf-8?B?dmlMTGtBNWhnLytHaWl1b1VGU3ZkZm5sa0JQU015eWxsdWdSbkZLVHRyVGZv?=
 =?utf-8?B?QTNic3Y2eG1MRkZHT0JNeEpvUWFTeHNqM2s5eEY2bVU1cjFISE9iZDVMYUVk?=
 =?utf-8?B?VCt3clVIbjJwUGljamllUVZudGZzOVB2MVRrRHhDa0h1cjkvYnAxU1JNanRu?=
 =?utf-8?B?YU10RzI5N0h4TEp6QWQrWnhqMnpBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe9e5fb3-6122-4ecc-0172-08d99f92877c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 12:56:33.7937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w9BdpRTuSxuASxl/u3TMdfed1+B6BhfCKFVB9vz7IDvpb+dKxHSGjvtvQ/MgE5GDcR7zDIih4iKUg5vPGcbYOaIwzfWGWSgOciI5hpYra3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4117
X-OriginatorOrg: citrix.com

On 04/11/2021 10:48, Roger Pau Monne wrote:
> Introduce a new domain create field so that toolstack can specify the
> maximum grant table version usable by the domain. This is plumbed into
> xl and settable by the user as max_grant_version.
>
> Previously this was only settable on a per host basis using the
> gnttab command line option.
>
> Note the version is specified using 4 bits, which leaves room to
> specify up to grant table version 15. Given that we only have 2 grant
> table versions right now, and a new version is unlikely in the near
> future using 4 bits seems more than enough.
>
> xenstored stubdomains are limited to grant table v1 because the
> current MiniOS code used to build them only has support for grants v1.
> There are existing limits set for xenstored stubdomains at creation
> time that already match the defaults in MiniOS.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thankyou.

