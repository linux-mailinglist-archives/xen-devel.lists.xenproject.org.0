Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F22C4D01F8
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 15:51:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286138.485517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nREhs-0007na-8i; Mon, 07 Mar 2022 14:51:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286138.485517; Mon, 07 Mar 2022 14:51:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nREhs-0007ld-5b; Mon, 07 Mar 2022 14:51:28 +0000
Received: by outflank-mailman (input) for mailman id 286138;
 Mon, 07 Mar 2022 14:51:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9NfF=TS=citrix.com=prvs=058fb9784=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nREhq-0007lX-MW
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 14:51:27 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d588857-9e26-11ec-8eba-a37418f5ba1a;
 Mon, 07 Mar 2022 15:51:24 +0100 (CET)
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
X-Inumbo-ID: 0d588857-9e26-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646664684;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Nf2d3LiP0+gNXgZuWDmuum3+UIEDe9INXg63qoVt2Io=;
  b=XDQO0b/XZA1P0AqyWV/GgZof1gTVaEu6bxhBfQLbriPcbrTNA/3Cqa8E
   RnJ23Gm8KljZlcuBrqYC8SRJAzL+03PoTv2SUwYzqrvvJmqVxWZ0dXuNW
   +OVw3gUQ/Llpu0OzVrRpLMsIEw982R1ImPChhqhaeNIJxTcaDc4eET1nP
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65551223
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:6OftlawNMTFE+IErW8x6t+fxxirEfRIJ4+MujC+fZmUNrF6WrkUHy
 GJKWmuAMvjcY2OhfIt1bo+wpEkD65fTyYRgSwc9/yAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NYz2YfhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplqq2Zdxw5OaL3od8xVTxnAx1dYqZk5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AO
 pdEMGA1N3wsZTVEIQszVJc9vNyhnz7TVwIE+EOepa8etj27IAtZj+G2bYu9lsaxbdVYmAOUq
 3zL+0z9AwoGL5qPxDyd6HWui+TT2yThV+o6C7mQ5vNsxlqJyQQ7ChQQWUGqvPqRhUu3WtYZI
 EsRkgInq6Qo+UXtVcXwQRS+qWKDlgUVXcZZFesz8ACWw+zV/26xBGIJUzpAY9wOr9ItSHoh0
 Vrhoj/yLWUx6vvPEyvbr+rK62PpUcQIEYMcTTA1ZDUe897sm7gIohTqccZfM/G+rMKgTFkc3
 Au2hCQ5grwSi+sC2KO64U3LjlqQm3TZcuImzl6JBzz4t2uVcKbgPtX1sgaDsZ6sOa7EFgHpg
 ZQSpySJAAni57mpnTfFfugCFarBCx2tYGyF2g4H83XMGl2QF5+fkWJ4vWsWyKRBaJ9sldrVj
 Kj741852XOrFCH2BZKbmqroYyjQ8YDuFM7+StffZcdUb556eWevpX8yOxPBgTiyyxh8zcnT3
 Kt3lu72UR4n5VlPlmLqF4/xL5dxrszB+Y8jbc+ilEn2uVZvTHWUVa0EIDOzghMRt8u5TPHu2
 48HbaOikkwHOMWnO3W/2dNDfDgicClgbbir+pM/SwJ2Clc/cI3XI6SKmu1Jlk0Mt/k9q9okC
 VnmAh4IkAek3CafQehIA1g6AI7SsV9EhStTFQQnPEqy2mhlZoCq7awFcIAwc6Vh/+tmpcOYh
 dFcJ61s3twnpuz7xgkg
IronPort-HdrOrdr: A9a23:McrPuqoVh5JTM9yDP7QBqycaV5uLL9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossSkb6Ky90KnpewK5yXbsibNhc4tKLzOWx1dAS7sSrLcKogeQVBEWk9Q96U
 4OSdkHNDSdNykZsS++2njELz9C+qjGzEnLv5ak854Fd2gDAMsMj3YbNu/YKDwNeOAvP+tiKH
 P23Lshm9PUQwVvUi3NPAhiYwGsnayvqLvWJTo9QzI34giHij2lrJTgFQKD4xsYWzRThZ8/7G
 nsiWXCl+aemsD+7iWZ+37Y7pxQltek4MBEHtawhs8cLSipohq0Zb5mR6aJsFkO0aOSARcR4Z
 zxSiUbToNOAkDqDyeISNzWqlDdOQMVmjvfIJmj8CPeSILCNWkH4oF69Pxkm1PimjsdVZdHof
 92Niuixulq5VmrplWM2/HYEx5tjUa6unwkjKoaiGFeS5IXbPtLoZUY5149KuZLIMvW0vFuLA
 BVNrCW2B+WSyLsU1nJ+m10hNC8VHU6GRmLBkAEp8yOyjBT2HR01VERysATlmoJsMtVcegJ28
 3UdqBz0L1eRM4faqxwQO8HXMusE2TIBRbBKnibL1jrHLwOf3jNt5n06rMo4/zCQu1E8LIi3J
 DaFF9Iv287fEzjTcWIwZ1Q6xjIBH6wWDz8o/surqSReoeMMoYDHRfzPWzGyfHQ0cn3KverL8
 qOBA==
X-IronPort-AV: E=Sophos;i="5.90,162,1643691600"; 
   d="scan'208";a="65551223"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oF76Y/XTfvpttzSUPM4fZ7BNSAocq380VluZPoLuDWGUS0TTW/bjhKJJn7OTwviKH2m+cFesRS1rs8L8WkzBmmKsl6Yh6PrpEHWqKubWQ5plf+Ng43D2lYMdRneQ1vM7IGmiS83H4KFtMFJVTILL/+6ILT6d4bjVJzf29uS0rFHK/b0OuLjZ77o4jdu1f8XHHQeCNUiXdd0tiMmUVdLiT1E3kDxDChSnhbDBaLGloCc4qL+7w4ueqNwYwdchRWk6k8Jp74FPxVHzk66sKn5axVg9xvQMtP8QGAzMoAlABJ051ZCjxamULshzuGGtAiKXtPjfz6Wm67SzSeEGoa9RUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nf2d3LiP0+gNXgZuWDmuum3+UIEDe9INXg63qoVt2Io=;
 b=MMkm0COMlkQWdxZFDx9nYtWf9poaeIFhbELJAH7tZLwgPQb1Y17PYF31228wQD/iom+4/fqxVoNI4OKUtxc98GQvvo2NfxVc0qzSi8sBANZgXMvLl/r8K61FfoIwwsvxrtvlphwk/xK9yYojt9snSccnniXiW+RedKxId8hsMw3kKTqg1pIJGOb5wHqHMjQnqUe4X0yq/zbwa2Z8YrFymSU9jVlFUMUZuK9R2KtiTj8TPlfhm6+UPalrkzheO5lmXEG53TyJAZH9DbLCekFBFfEdaSa5/x8tdrirMp8oKFO4Hn1mQJ43CdavPZdKiZ/aXfeOWF4GB5TnegB/H93uZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nf2d3LiP0+gNXgZuWDmuum3+UIEDe9INXg63qoVt2Io=;
 b=HAxbu7YydvaGWnnuGaAQR9dV7St9k0esesViDjHIDGHWXlEsijHHCptYLrhGM/xJ2vlx468OizGDYHZl/2v9q2J8rWD4hn3k4HIrZjb0/8/jynaM1L8rC8uxnocwe4qZMnYpf5Se4hP4/3kdlMuFcCAuwZHJrDjUoVT2cimBSvk=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Andrea Stevanato <andrea.stevanato@santannapisa.it>, Jan Beulich
	<jbeulich@suse.com>
CC: Jason Andryuk <jandryuk@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "wl@xen.org" <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: Network driver domain broken
Thread-Topic: Network driver domain broken
Thread-Index: AQHYLw1qzygpamMN3EyejpXz6IEhzKyt0cGAgAAJD4CAABp2gIABKTaAgAADz4CAAAYkgIAAFf+AgASOpQCAAATMAIAAAeqAgAArEgCAAASXAIAAAfkAgAAB+YA=
Date: Mon, 7 Mar 2022 14:50:55 +0000
Message-ID: <04e4ecfb-0235-db0d-d5fd-3274879003fa@citrix.com>
References: <DB7PR03MB50027EE92E11BFFF71AADC4598049@DB7PR03MB5002.eurprd03.prod.outlook.com>
 <92827eec-b6e9-9c95-8f9e-fcf063d45090@santannapisa.it>
 <YiDt7fX92n6Luc2l@Air-de-Roger>
 <CAKf6xpsnmQG7-LXn5+Uz4mncWsN0EZ8wpagY8f8OydvZNb6g5A@mail.gmail.com>
 <YiH9cee6NIKA6MWg@Air-de-Roger>
 <53a4fe6b-efc8-bfa1-8475-0aa58774051a@santannapisa.it>
 <YiIFyRUNXpUfzwRB@Air-de-Roger>
 <0ce52d38-f542-9336-a100-1cbfc559f218@santannapisa.it>
 <YiXq5HIrvZsy7QKU@Air-de-Roger>
 <b388ed5b-177e-2e9d-6450-6df16d9250c4@santannapisa.it>
 <YiXwhUnZL8bcJvH2@Air-de-Roger>
 <93fb9755-d40a-3cfe-1f6e-335b57d5a213@santannapisa.it>
 <e5c4c591-8ef4-f8d7-aa2a-b196a5a9749c@suse.com>
 <6028180c-ff1c-5d4f-2cf2-582e4104d888@santannapisa.it>
In-Reply-To: <6028180c-ff1c-5d4f-2cf2-582e4104d888@santannapisa.it>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb4ce27f-d7b3-4b2c-a6f1-08da0049e2a5
x-ms-traffictypediagnostic: BN6PR03MB2804:EE_
x-microsoft-antispam-prvs: <BN6PR03MB280495F8AD1F269FE838EAB8BA089@BN6PR03MB2804.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Bi9F9mu4h7G84P2FNsM5VRlEaHQiMrrbjTZ4vqln5JkWDj+7xSHSn59pZeU1BMdQvN+b4QMYOcU9FI4tbGvjijch1uW0LbK5nDy5huKy1iCY60XxxgDwAsPVymZT5/B+eOMOdnQ3tj1bo+u+FjTaoswDofDcTCEwvkQgKfNUS3fSM8CgJ9Pr9hB+rPWMNVstPAcz3T9F8pqzuGdRlBfV+FdeIpUN9Q15Sx+IXsrGFtWBn5xyGWwxKNCRiEz5F409X2ifoA+Hlf1QaAmX/a7dZejd+4nlK9q4SW3+P0lGEB3iT3XwQ83KcwQHv/dyjf6+1Sx+hEGQgVk7bUfcekNu1DVlhMuVjG5EOizkBz+fidd0JobQGD9T6n784snAdvS+nauVsT23Ita2Vx9sVh7ihxrHRm7wb/eWUvwjyHFn8ubnuyxQIitBhoSLRUBNgNZa4LCa1AYbjN9LZUPQBRLjjPJiOLqzu5aD3RcN8mVzZht2NyErN1ZeiVWVXvzB64Oj+AlXdLD7DE0mspzXknBCMG2jPGwIPyaGKsvjDurlIvY5vVgcskXKF6dMk4vMjIM9PazDGtV73ee1k6vLV4UrbZ/ZlLNiFqlmViSXEjx9q8+IJ4dBGFqvquOpSWeyADCXshCM/knV9qkwlT1CYKf71a1L81IuupnTAm+tz8YVHnSmp3vMTuNG6ZWwZnrYPI/UrLrBSm/PUHUyF+nGEex5INzHt82GhMZHC5lYoyt5utzCdrOCOKBkglhsnpH/Fedd//hhDTcAp1Frrj6/0MrrEw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(107886003)(6506007)(3480700007)(71200400001)(76116006)(6512007)(6486002)(508600001)(53546011)(186003)(26005)(31686004)(36756003)(83380400001)(91956017)(54906003)(66946007)(38100700002)(8676002)(66476007)(4326008)(64756008)(66556008)(66446008)(316002)(82960400001)(122000001)(8936002)(2616005)(2906002)(5660300002)(38070700005)(31696002)(86362001)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmtZMXRNMmN2bHFFOXdlQ05xMVFJRll3Sys5MVBUZFFYeExwTUxuM0JGd1Zy?=
 =?utf-8?B?YmZQVjV0b2tqTGJ5OFZqMzZiRGFhK0NBdnFlaW9DQXRQejhDcmZieGhneFdq?=
 =?utf-8?B?RjJ3bjNSNFVZUjY4M25FRU9pemlBT2h5VU1NS2JSa0xZdnd6cVU0am94ZGgx?=
 =?utf-8?B?cGVmK2xLL0E4RE42QjRVUkcwM2dZR0s2eUt1bFA4SGRhZmNrVFZkaEtOUlg5?=
 =?utf-8?B?MkdPbVcwZkVZZEtCSXhwTUtPYlcwaDNxTjBRTmc3WEZCRmV6OUNPc1dlSHdz?=
 =?utf-8?B?UGF4WnFuanl3VjNiRUMrQ3RJS1BtLzh5d1BiSU1vSXR4NG9RcHYwVFFsTkNN?=
 =?utf-8?B?eURTWlhsM0ZvUGNTSSsvK1NjcWlTbVRmSm5FRmhSZFl3ZUFiWENCN1hJS3B6?=
 =?utf-8?B?ZmVycnVXTFh4aG55V1VNN05LcVFZb05RdUd4Uks4Yk9FQ1Y4RWQxRnA1SzFi?=
 =?utf-8?B?L2pLMUxqRXZmVXY5WlArdWV6OWtUb2FGN25XZkRSalJmbmRZem8xV1VFKzBP?=
 =?utf-8?B?aU94VGxFdDBRYzV6VlhLVGVXMjlkNWIyclZjM1o3d1pBR0d5MmIwTzVtU1JI?=
 =?utf-8?B?RldlYUJucGNYaHo0aHRvdm9mVXZZSUc4Q3prcU5aSEtHWVFvYmxaNk84OEVD?=
 =?utf-8?B?elprTVRFbEthR2xaSitPRW9nUDVtQ2xpVHVsZDFLdFRLdldQZjY4VGNrTTNw?=
 =?utf-8?B?T08ySE8vVjA1dnY2ekVwVEU0UDR5N09SeFhFQlpuNjk1a1NldWFoNWNQRm9v?=
 =?utf-8?B?VTdRNCt6ZHdjNkt5TndKZFRLbTN4Q25HbFhrK3NsbmRFcnFaVE9lU2pxTUly?=
 =?utf-8?B?cEtMcnozNnUvTFFVSjlzSlJIVXI1bmY3VmVyZDdhVGQrNDdGSGx5VlNReHVF?=
 =?utf-8?B?L2ZTNUl6ZnN4MitvSllhSVJTZ3dteU5YM0lHWmFxNEU1d3cwNkRoQWZUUjV5?=
 =?utf-8?B?TUZCSDVvR2xsUkJDT1lIdll1SVBFV2FJVzJwQmJTK1BXak5pbVRxN3FwbmVy?=
 =?utf-8?B?T21NeWh1TUkzVEVIV2t2dmZtZXcwREFYRkM3ajZoaU45OUR1eW9uMlVBNDNB?=
 =?utf-8?B?bWNZc3YyRngwUS9WYnhNcTlaZFpqamVYbTJOeG83d3puUC9QbGc1K2lJSm85?=
 =?utf-8?B?RGZSTDdxV1BqTHZXVHROYjVCQUFuZjlUNmRZRjFiRE9VNGdnVXg2b2N2VEZ5?=
 =?utf-8?B?a0ZTZUd3QTBlcTZRWXlGZUNITjNzOVNhcXN5dllDOVFBaS82SDQyUDhMd3NB?=
 =?utf-8?B?R1RzVUhKZENiUkppVnUxSkxMQW5lWSs5OGFIUmNJVGV4YmFGbWJ5TkNuZ1RD?=
 =?utf-8?B?Uy9qenZtYTZQQTVKQkREZ3V1Qk16ZnNsMCtmOE84d2xUOTZBWjZheC9KOVh0?=
 =?utf-8?B?ZklOajNvTXVKZXQwYjZvcmprQWgxVUdUdGtDRnZ5bm5DYnU4TSt6UGErbXB4?=
 =?utf-8?B?ODZyT1BIdHVON1liSVZnMUlaMUh1ZEVnd0NOWURaVWVMRmNRSFR5ajNMWERt?=
 =?utf-8?B?aUM4NmpuOW4zSGp2RnJsTHZBN3NZMXVLQ01PNU9vV1BJRVVrMDVsRWxmcXgy?=
 =?utf-8?B?UWd4YXE3RzVraXZXSFBZK3RBcFNsK216MXhzUzJmbUt2aFZmdkZVWEVEUU5X?=
 =?utf-8?B?YXloQXVPdXRRakU1UDNTUUpUbE1Yd1NiWHlObVg0bFhLN2VpWTNzQ0Z6WGJT?=
 =?utf-8?B?S3FqNFkzOEszSE0rODdFSFRoK0xvN21SVnRJclFjMG45SDVOYkFxQzlTelAz?=
 =?utf-8?B?Qzd2YmIvai9xaE5SVE5TS1BjWm5sMmUvbVErZ1NLL0I2dXFnNkRtNklWN2J0?=
 =?utf-8?B?NmdESmNtd3E3cldGdHVjMDFrTkxQV1NGTnZQdkUzcU00c0ZoRGZROFhqWDVG?=
 =?utf-8?B?UVhjV283VURMd2JMNDJCQU9aWWJNdFFkdmZNdUpIRHUrNXN4MkhqWkNuNmxZ?=
 =?utf-8?B?UGRvSzhvakVQRzdqS2QwMnZPZFdxNGRRZXFEajJlcHdqOVhWL3VUWnVlRUhT?=
 =?utf-8?B?VXRiVURNVytxSzNoM21heHZ3NFlnanBONHlxYXI0cTlKY2xPRTFnd2hTMUp3?=
 =?utf-8?B?TUQvRkdjUzdHQzV2QU1EVWxhc0s3Zk9JOTBZY095QkJMSlpXSTc2WEFsaTlx?=
 =?utf-8?B?Y2U4Ym02R080cXJ5M1JxR1crenRzWXZmR09YVi8zNDMyYXdoVFk4UVJZQ1pY?=
 =?utf-8?B?eDNHR1pIT2JvYkFnSGJ0ZWdFM3UyUzk2SS9VTkVuSEtpRTFQWDl3dlJVcVp0?=
 =?utf-8?B?Mmh6UWJNY2Q4eURQRmFqNDM2TVhRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5E4251EB0C088C41983A6BA1AE28D594@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb4ce27f-d7b3-4b2c-a6f1-08da0049e2a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2022 14:50:56.0059
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IbucAYVzTl0PSU2yosWZu04Q93JYoas7q5X6IRYpqBwTYeUiQKY4IjjtO6tHFP9Qyv7SvIZ88y9axaBNf8LsCAjLuvQojCatHxQcXgpIG18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2804
X-OriginatorOrg: citrix.com

T24gMDcvMDMvMjAyMiAxNDo0MywgQW5kcmVhIFN0ZXZhbmF0byB3cm90ZToNCj4gT24gMy83LzIw
MjIgMzozNiBQTSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAwNy4wMy4yMDIyIDE1OjIwLCBB
bmRyZWEgU3RldmFuYXRvIHdyb3RlOg0KPj4+IE9uIDMvNy8yMDIyIDEyOjQ2IFBNLCBSb2dlciBQ
YXUgTW9ubsOpIHdyb3RlOg0KPj4+PiBPbiBNb24sIE1hciAwNywgMjAyMiBhdCAxMjozOToyMlBN
ICswMTAwLCBBbmRyZWEgU3RldmFuYXRvIHdyb3RlOg0KPj4+Pj4gL2xvY2FsL2RvbWFpbi8yID0g
IiIgICAobjAscjIpDQo+Pj4+PiAvbG9jYWwvZG9tYWluLzIvdm0gPSAiL3ZtL2Y2ZGNhMjBhLTU0
YmItNDNhZi05YTYyLTY3YzU1Y2I3NTcwOCIgICAobjAscjIpDQo+Pj4+PiAvbG9jYWwvZG9tYWlu
LzIvbmFtZSA9ICJndWVzdDEiICAgKG4wLHIyKQ0KPj4+Pj4gL2xvY2FsL2RvbWFpbi8yL2NwdSA9
ICIiICAgKG4wLHIyKQ0KPj4+Pj4gL2xvY2FsL2RvbWFpbi8yL2NwdS8wID0gIiIgICAobjAscjIp
DQo+Pj4+PiAvbG9jYWwvZG9tYWluLzIvY3B1LzAvYXZhaWxhYmlsaXR5ID0gIm9ubGluZSIgICAo
bjAscjIpDQo+Pj4+PiAvbG9jYWwvZG9tYWluLzIvY3B1LzEgPSAiIiAgIChuMCxyMikNCj4+Pj4+
IC9sb2NhbC9kb21haW4vMi9jcHUvMS9hdmFpbGFiaWxpdHkgPSAib25saW5lIiAgIChuMCxyMikN
Cj4+Pj4+IC9sb2NhbC9kb21haW4vMi9tZW1vcnkgPSAiIiAgIChuMCxyMikNCj4+Pj4+IC9sb2Nh
bC9kb21haW4vMi9tZW1vcnkvc3RhdGljLW1heCA9ICIxMDQ4NTc2IiAgIChuMCxyMikNCj4+Pj4+
IC9sb2NhbC9kb21haW4vMi9tZW1vcnkvdGFyZ2V0ID0gIjEwNDg1NzciICAgKG4wLHIyKQ0KPj4+
Pj4gL2xvY2FsL2RvbWFpbi8yL21lbW9yeS92aWRlb3JhbSA9ICItMSIgICAobjAscjIpDQo+Pj4+
PiAvbG9jYWwvZG9tYWluLzIvZGV2aWNlID0gIiIgICAobjAscjIpDQo+Pj4+PiAvbG9jYWwvZG9t
YWluLzIvZGV2aWNlL3N1c3BlbmQgPSAiIiAgIChuMCxyMikNCj4+Pj4+IC9sb2NhbC9kb21haW4v
Mi9kZXZpY2Uvc3VzcGVuZC9ldmVudC1jaGFubmVsID0gIiIgICAobjIpDQo+Pj4+PiAvbG9jYWwv
ZG9tYWluLzIvZGV2aWNlL3ZpZiA9ICIiICAgKG4wLHIyKQ0KPj4+Pj4gL2xvY2FsL2RvbWFpbi8y
L2RldmljZS92aWYvMCA9ICIiICAgKG4yLHIxKQ0KPj4+Pj4gL2xvY2FsL2RvbWFpbi8yL2Rldmlj
ZS92aWYvMC9iYWNrZW5kID0gIi9sb2NhbC9kb21haW4vMS9iYWNrZW5kL3ZpZi8yLzAiDQo+Pj4+
PiAobjIscjEpDQo+Pj4+PiAvbG9jYWwvZG9tYWluLzIvZGV2aWNlL3ZpZi8wL2JhY2tlbmQtaWQg
PSAiMSIgICAobjIscjEpDQo+Pj4+PiAvbG9jYWwvZG9tYWluLzIvZGV2aWNlL3ZpZi8wL3N0YXRl
ID0gIjYiICAgKG4yLHIxKQ0KPj4+Pj4gL2xvY2FsL2RvbWFpbi8yL2RldmljZS92aWYvMC9oYW5k
bGUgPSAiMCIgICAobjIscjEpDQo+Pj4+PiAvbG9jYWwvZG9tYWluLzIvZGV2aWNlL3ZpZi8wL21h
YyA9ICIwMDoxNjozZTowNzpkZjo5MSIgICAobjIscjEpDQo+Pj4+PiAvbG9jYWwvZG9tYWluLzIv
ZGV2aWNlL3ZpZi8wL3hkcC1oZWFkcm9vbSA9ICIwIiAgIChuMixyMSkNCj4+Pj4+IC9sb2NhbC9k
b21haW4vMi9jb250cm9sID0gIiIgICAobjAscjIpDQo+Pj4+PiAvbG9jYWwvZG9tYWluLzIvY29u
dHJvbC9zaHV0ZG93biA9ICIiICAgKG4yKQ0KPj4+Pj4gL2xvY2FsL2RvbWFpbi8yL2NvbnRyb2wv
ZmVhdHVyZS1wb3dlcm9mZiA9ICIxIiAgIChuMikNCj4+Pj4+IC9sb2NhbC9kb21haW4vMi9jb250
cm9sL2ZlYXR1cmUtcmVib290ID0gIjEiICAgKG4yKQ0KPj4+Pj4gL2xvY2FsL2RvbWFpbi8yL2Nv
bnRyb2wvZmVhdHVyZS1zdXNwZW5kID0gIiIgICAobjIpDQo+Pj4+PiAvbG9jYWwvZG9tYWluLzIv
Y29udHJvbC9zeXNycSA9ICIiICAgKG4yKQ0KPj4+Pj4gL2xvY2FsL2RvbWFpbi8yL2NvbnRyb2wv
cGxhdGZvcm0tZmVhdHVyZS1tdWx0aXByb2Nlc3Nvci1zdXNwZW5kID0gIjEiDQo+Pj4+PiAobjAs
cjIpDQo+Pj4+PiAvbG9jYWwvZG9tYWluLzIvY29udHJvbC9wbGF0Zm9ybS1mZWF0dXJlLXhzX3Jl
c2V0X3dhdGNoZXMgPSAiMSIgICAobjAscjIpDQo+Pj4+PiAvbG9jYWwvZG9tYWluLzIvZGF0YSA9
ICIiICAgKG4yKQ0KPj4+Pj4gL2xvY2FsL2RvbWFpbi8yL2RyaXZlcnMgPSAiIiAgIChuMikNCj4+
Pj4+IC9sb2NhbC9kb21haW4vMi9mZWF0dXJlID0gIiIgICAobjIpDQo+Pj4+PiAvbG9jYWwvZG9t
YWluLzIvYXR0ciA9ICIiICAgKG4yKQ0KPj4+Pj4gL2xvY2FsL2RvbWFpbi8yL2Vycm9yID0gIiIg
ICAobjIpDQo+Pj4+PiAvbG9jYWwvZG9tYWluLzIvZXJyb3IvZGV2aWNlID0gIiIgICAobjIpDQo+
Pj4+PiAvbG9jYWwvZG9tYWluLzIvZXJyb3IvZGV2aWNlL3ZpZiA9ICIiICAgKG4yKQ0KPj4+Pj4g
L2xvY2FsL2RvbWFpbi8yL2Vycm9yL2RldmljZS92aWYvMCA9ICIiICAgKG4yKQ0KPj4+Pj4gL2xv
Y2FsL2RvbWFpbi8yL2Vycm9yL2RldmljZS92aWYvMC9lcnJvciA9ICIxIGFsbG9jYXRpbmcgZXZl
bnQgY2hhbm5lbCINCj4+Pj4+IChuMikNCj4+Pj4gVGhhdCdzIHRoZSByZWFsIGVycm9yLiBZb3Vy
IGd1ZXN0IG5ldGZyb250IGZhaWxzIHRvIGFsbG9jYXRlIHRoZSBldmVudA0KPj4+PiBjaGFubmVs
LiBEbyB5b3UgZ2V0IGFueSBtZXNzYWdlcyBpbiB0aGUgZ3Vlc3QgZG1lc2cgYWZ0ZXIgdHJ5aW5n
IHRvDQo+Pj4+IGF0dGFjaCB0aGUgbmV0d29yayBpbnRlcmZhY2U/DQo+Pj4gSnVzdCB0aGVzZSB0
d28gbGluZXM6DQo+Pj4NCj4+PiBbICAzODkuNDUzMzkwXSB2aWYgdmlmLTA6IDEgYWxsb2NhdGlu
ZyBldmVudCBjaGFubmVsDQo+Pj4gWyAgMzg5LjgwNDEzNV0gdmlmIHZpZi0wOiAxIGFsbG9jYXRp
bmcgZXZlbnQgY2hhbm5lbA0KPj4gV2VsbCwgdGhlc2UgYXJlIHRoZSBlcnJvciBtZXNzYWdlcywg
ZnJvbSB4ZW5idXNfYWxsb2NfZXZ0Y2huKCkuDQo+PiBXaGF0J3MgYSBsaXR0bGUgb2RkIGlzIHRo
YXQgdGhlIGVycm9yIGNvZGUgaXMgcG9zaXRpdmUsIGJ1dCB0aGF0J3MNCj4+IGhvdyAtRVBFUk0g
aXMgbG9nZ2VkLiBJcyB0aGVyZSBwZXJoYXBzIGEgc3RyYW5nZSBvciBicm9rZW4gWFNNDQo+PiBw
b2xpY3kgaW4gdXNlPyBJIGFzayBiZWNhdXNlIGV2dGNobl9hbGxvY191bmJvdW5kKCkgaXRzZWxm
DQo+PiB3b3VsZG4ndCByZXR1cm4gLUVQRVJNIGFmYWljcy4NCj4gQXMgeW91IGNhbiBzZWUgSSdt
IHByZXR0eSBuZXcgdG8gWGVuLiBGdXJ0aGVybW9yZSwgaXQgaXMgdGhlIGZpcnN0DQo+IHRpbWUg
dGhhdCBJIGhlYXJkIGFib3V0IFhTTSwgc28gc2luY2UgSSBkaWQgbm90IGNoYW5nZSBhbnl0aGlu
ZyBJDQo+IGRvIG5vdCBrbm93IHdoYXQgdG8gYW5zd2VyIQ0KDQpQbGVhc2UgY2FuIHlvdSBhdHRh
Y2ggdGhlIGZ1bGwgb3V0cHV0IG9mIGB4bCBkbWVzZ2AsIHdoaWNoIHdpbGwgaGVscA0KYW5zd2Vy
IHRoaXMgcXVlc3Rpb24uDQoNCn5BbmRyZXcNCg==

