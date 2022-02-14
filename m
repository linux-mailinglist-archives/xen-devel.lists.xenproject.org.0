Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 134864B54B8
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 16:26:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272439.467283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJdET-0007Q7-5T; Mon, 14 Feb 2022 15:25:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272439.467283; Mon, 14 Feb 2022 15:25:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJdET-0007NW-2T; Mon, 14 Feb 2022 15:25:41 +0000
Received: by outflank-mailman (input) for mailman id 272439;
 Mon, 14 Feb 2022 15:25:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJdER-0007NQ-DK
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 15:25:39 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b5fe4a7-8daa-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 16:25:37 +0100 (CET)
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
X-Inumbo-ID: 5b5fe4a7-8daa-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644852337;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=3YvUr/pK2pqfjGebFFqZNorqgBjA0uiDIOid7t8n1/w=;
  b=Fd5HiM9NGEiQ0Qo1JXGjQmKGjlkdZ61So4JJaCYBhXq7ZgMyE424WuRA
   88xLA+P6w8mbSC1sZSZyt4rCQcHH436pnYNBVtRRmki83MKiWIWko5l0M
   E6Rq/qpsTmIit9ZvCJv60MR6QiQNa8Il/trctnbCUzo1CIzyTiNFi3VfZ
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: O0K8izYdrO6/lyShJr2nIIkNcH2LDnw1lheTYhGd6dzlY6rPC1Q9joWmCmVGKa/tcuEbVWqArl
 4IOcQBoO6aNmRCDmu9S/ghdl/dvw1ik4EMPRcPvfQ1JsRAUXzsSZ7FoFo4fnWubYYmALb6iP5n
 NBFokdxPD/3+ITocTyfc5iUdYWqH970UU6iN80JmtI1+S6r5Nrpt2iAXZ06VhToBQ9lG2AQMr+
 Hm4sHPHr2ei8DOst3xE+r+KCXNYnQPqfuWTU/AGjCFPGM4lA/iaRiaRCZUtcTlDrQ8n45Sf7c/
 at1ijfwYqktxY7YW2gBC8YOR
X-SBRS: 5.1
X-MesageID: 63606711
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:uAa4RqjQHGJ6wG8QJWboDVZHX1618xcKZh0ujC45NGQN5FlHY01je
 htvWmzTPa7ZajSjeN51aoy//UhVvZPVxt9gG1c4/i43RXwb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tQx3YDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1BpMCCYj0KH5aXgcYUYyUBGiNFGPZZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNaiFO
 ZJHNmM2BPjGSx4VCkkoM5x5peKHnlrcKhBU9UyFurVitgA/yyQuieOwYbI5YOeiQMxPm0+Cq
 2Hu/mLnAwobPtiS1TqE9H23gubF2yj8Xeo6DbC967tmjUOewkQVDxsZU0b9puO24malQM5WI
 UEQ/isorIAx+VatQ927WAe3yFaIsBcTVNtXF+wS8xyWx+zf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+pQSiaYHZPazVYPGldEFVDs4KLTJwPYgznQsc/IoWPrfzOQijSy
 gC29SE8vJBIkptev0mkxmzvjzWpr5nPawc64ATLQ26ohj9EiJ6Zi5+AsgaCs6sZRGqNZhzY5
 SVfxZDChAwbJczVzESwrPMx8KZFDhpvGBnVmhZREpYo7FxBEFbzLNkLsFmSyKqEW/vomAMFg
 meO42u9B7cJZRNGiJObhKrrVawXIVDIT4iNaxwtRoMmjmJNXAGG5jpyQkWbwnrglkMh+YlmZ
 8vHLpb8UCtCUP89pNZTewv6+eV1rh3SOEuJHcyrp/hZ+eb2iIGppUctbwLVM7FRAFKsqwTJ6
 ddPX/ZmOD0EONASlhL/qNZJRXhTdCBTLcmv96R/K77SSiI7STpJI6KAntscl3lNwv09ehHgp
 SrmBCe1CTPX2BX6FOl9Qi4/Oe2/Bc4l9RrW/0UEZD6V5pTqWq72hI83fJorZ7g3sutlyP9/V
 f4efMucRP9IT1z6F/41NPERdaRuK0amgxygJS2gbGRtdpJsXVWRqNTlYhHu5G8FCS/u7Zkyp
 Lip1wX6R5sfRls9UJaKOaz3l17h72IAnO9SXlfTJoUBckvb74U3eTf6ieU6Ip9QJEyblCeaz
 QufHTwRufLJ/90u6NDMiK3d99WpHuJyE1B0BW7e6brqZyDW8nD6md1LUfqSfCCbX2Txof3wa
 eJQxvD6EfsGgFcV7NYsT+c1lfozvoK9qaVbwwJoGGTwQ26qUr4wcGOb2cRvt7FWwuMLswWBR
 U/SqMJRPq+EOZ25HQdJdhYldOmKydodhiLWsaYuOEz/6SJ6oOiHXEFVM0XegSBRNuIoYoYsw
 ONns88K8Q2vzBEtN4/e3CxT8m2NKF0GUrkm6c5GUNO61FJzxwEQe4HYBw/3/IqLOodFPUQdK
 zOJgLbP2uZHzU3YfntvTXXA0IKxX3jVVMymGLPaG2m0pw==
IronPort-HdrOrdr: A9a23:O+ZyDa0xpz3A67sGfKv5owqjBRZyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5AEtQ5OxpOMG7MBbhHQYc2/heAV7QZnibhILOFvAi0WKC+UyuJ8SazIBgPM
 hbAtFD4bHLfDtHZIPBkXOF+rUbsZm6GcKT9J/jJh5WJGkAAcAB0+46MHfhLqQffngdOXNTLu
 v52iMznUvHRZ1hVLXdOpBqZZmgm/T70LbdJTIWDR8u7weDyRmy7qThLhSe1hACFxtS3LYL6w
 H+4k/Ez5Tml8v+5g7X1mfV4ZgTssDm0MF/CMuFjdVQAinwizyveJ9qV9S5zXIISaCUmRMXee
 v30lAd1vdImjXsl6aO0ELQMjzboXITArnZuAelaDXY0JfErXkBerV8bMpiA2XkAgwbzYxBOe
 twrhKkX9A8N2KwoA3to9fPTB1kjUyyvD4rlvMSlWVWVc8EZKZWtpF3xjIeLH4sJlOz1GkcKp
 gkMCgc3ocjTXqKK3TC+mV/yt2lWXo+Wh+AX0gZo8SQlzxbhmpwwUcUzNEW2i5ozuNwd7BUo+
 Dfdqh4nrBHScEbKap7GecaWMOyTmjAWwjFPm6eKUnuUKsHJ3XOoZjq56hd3pDmRLUYiJ8p3J
 jRWlJRsmA/P0roFM2VxZVOtgvARW2sNA6dg/22J6IJzIEUaICbQxFreWpe5PdI+c9vcfEzc8
 zDTa5rPw==
X-IronPort-AV: E=Sophos;i="5.88,368,1635220800"; 
   d="scan'208";a="63606711"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WKWXxLLkMbIxb+SboNm4dqJ+Gdu0ltLaGbwgMqXLbSPT6dIAYyPawNpAfx137q4btuZk7BWu9wplstOilV7Pea8lIZ8mcxxi28q4rlibf0Esec38jAgK4QCf5+2Fd4EkjIu8T5OfN6djOFfzbzd08u01iq6e2N5kgizbdweYIoLi4fIpfsLSh5UyT2EHIo29nMcJdCiYmA1/5HqYwsjYc6SrQ86XcbP/Akd16x42Xm8SVUvnzp+Bm8IgvdMNsuuCciaACgk1oPtOPF2wkcpB5Eicj8wRVwDtJLkah7+Ad/uYHgNlAj4baOSir6QTZZCtBO5QCPhQzO8JhocLLmee1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3YvUr/pK2pqfjGebFFqZNorqgBjA0uiDIOid7t8n1/w=;
 b=PbGs19KGKqGH6YM/nypFA6DV+o2dwt3qxO5dk5yDdJWF9F6e3YvvOyWgF4gwHQYcVz8AXwXzd5qP5+lGW0gOgKryaEYlGF9OJcB7LJhhXWB++7LKuhybmE0ZGORYUY5+SEO6hEEBah8gtUyle3WZHeNGSoNCQ/5VJZFrhh7DGkDKUQO17QWV/q0VvvI9fiT9Q8FhGXzLzNrEsaREs8hMuzhkKhcFwkfxeFQA2lpQby2AV7+/9yH+ZzUB4Te08hcHT0AewmEfcLWc2Ze8WXkTIYSGxDv/JriVqKNzP2uM+KoMCoRcsjeU50+J/GXUDzFGknms6k4to9PtDi7yQrvKXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3YvUr/pK2pqfjGebFFqZNorqgBjA0uiDIOid7t8n1/w=;
 b=NdFFdJFBOG4exJ1MvE61lb7PUdH4pj3pIsl73J3MsxWxC7+/OYPa3oH5dhpnUJSnILBEKhd/IqPxQAxCTyVDShvjTYhKXMijk0dgOqBk1WUwef/nhS4zAWPXPe9vfaIvRy/LHt7A/jf1mJlOSVvFkzsuJuu01hYxNGtMCUh96d4=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Dario Faggioli <dfaggioli@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
	"marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Anthony Perard
	<anthony.perard@citrix.com>
Subject: Re: SecureBoot and PCI passthrough with kernel lockdown in place (on
 Xen)
Thread-Topic: SecureBoot and PCI passthrough with kernel lockdown in place (on
 Xen)
Thread-Index: AQHYIbPxFY5Kj3bRXE6t4z/dbeVrR6yTKssA
Date: Mon, 14 Feb 2022 15:25:31 +0000
Message-ID: <55436ceb-3c6b-beff-5cac-eb83cb1bc44d@citrix.com>
References: <8daad0f6c623a57bc0b047fc2388e8b698135624.camel@suse.com>
In-Reply-To: <8daad0f6c623a57bc0b047fc2388e8b698135624.camel@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b094890-24b2-4c57-57b9-08d9efce3ceb
x-ms-traffictypediagnostic: SN6PR03MB3917:EE_
x-microsoft-antispam-prvs: <SN6PR03MB3917E2F62D0592472AD6B95DBA339@SN6PR03MB3917.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XoU8N4yIAVD000ZgIB2w0rEUFujD/7RCBxml+FjRgoduwqDWCg8/0PFe53ZCNaF4pSPAxzznFRKtCVSf+iSIYhSauMQ27RCGQcfUvBLKHuxcymB2pvbJccmzyRB4sggWbGyNZUf3oPqQEtftbRZoeX+TSRsCxjXbv2B0ZyTKiVjtgqe2iSVIWjWyvrINrEcqivABua2T5vwQsiPoEsuMPQIKoUc+LxXlbPJzn7ohbqNMgVtJu4Qd1u5nyzaQfgEmhkstuWgrA/Gwh3uzu5bhnp2IGND0MbsliS5JDXtSMB1Rv8pMxGDJmrB6Rit8fAY0q++BI0E/uQ2w7gnQRd+RVAvc/paewcDokBpwbp6jKQ0rxh8R5RoB4yj6RWgUhQ2bB/EWecSM4pWuzm5eVI47k6XhrZLgKS/jyK8AQQ5YYfZaJteTK6g2XhejT4chQwXdlrjrm2mC6JYb/WpHqll1tGary6+Lxw9c0g95RbDIWf0J3ILIocTiReHS8yqsEoxjt68u6Yhcr+owemjMWyJcSg1PIBLF0awE+OVRypZ2pvePSEABTxrbyRsmHN4FAdB9VJ5lp78G0quUY6JVv/t3DVsi0gqoVgoAoh3vLxeCnXMvcfYjwxMZt7FW90OzMdLiZf/NSZP1fT6zukIT1aDKwxXzfMLt+2U4y9uqHX4fEIWuZbtQ63z5kIYiNNV0qDK/M0BornJfcPOt6IRwhjWX92BKNAKl0Riq0yn/w9yUXG2JY4kaZXxlduY5PVugJcupXURDV3cqbeQu827rDPAL3Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(76116006)(66476007)(110136005)(38100700002)(4326008)(66556008)(5660300002)(86362001)(82960400001)(2906002)(91956017)(64756008)(31686004)(8676002)(31696002)(38070700005)(8936002)(316002)(66946007)(54906003)(6506007)(107886003)(26005)(2616005)(186003)(6512007)(122000001)(36756003)(66446008)(6486002)(71200400001)(53546011)(83380400001)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bmg1ZFBMQ1hveTc0NjFzSGpIWm1ORC9vUFB4VW5wUzkreDlXK24wMkFUSXBV?=
 =?utf-8?B?VVJDbS9YZGNnYVU1cFEvd1pUdEpNZ09WRjJrTFh1amp2QkpyNmtxVEk3RE9W?=
 =?utf-8?B?WFE3cXVSeFpQQlJYaG9nSUJhYjJpNzhHZ3lOMWU1cmdjTXRucExRVmQxSmhk?=
 =?utf-8?B?Vi9VU3d2SUtlMXFrQlpZR0FGS1JNcUtPQ2paRWFjNE93cS9haFM3RHhGL3ZY?=
 =?utf-8?B?UHJZUjVNNitVL3U2TGdNaTdqL1haZjA1TEV4Y2hLdFBrd3FiVlh4OFdpQ2tu?=
 =?utf-8?B?WFJWV05ZSWxTOXhCV2pOUFFCUWNFaWxZVXh4RTVpa0I1eEpIckt2eUttakIy?=
 =?utf-8?B?ZzBtVjU1TTJUUzIxVTdkOWplcHBzNXhpZHNlRSs4eWFXcXMzenA0TXZ0V3FW?=
 =?utf-8?B?L2ZFa2VRV1RDd1lCaElKSXdMWkRsRmVodUlOQVlWMHY1a2E4a0VBRnppam9k?=
 =?utf-8?B?N3dwOHhITmRDUXlJMGpRdFVSdnJ1K1RTbHpiMzczeGxqZjRWSUxYVGcwd1Y5?=
 =?utf-8?B?UWhMQ21icit5N2FZelU2NUgwc0N2Rk9KZDVPendzTlQwWTkxWTNLUFFBcDFD?=
 =?utf-8?B?Q1dTVS83L0FxRUQ3VXZxblY5KzhINGZWeERQQ0ZoME9sOHpmN1BpZ2Q2OTFk?=
 =?utf-8?B?RFpncklEdDJGSEowdnYrWWhnZmRqVTVyZnc5ZS9kT1lrRWJJVHFyQmY3dENn?=
 =?utf-8?B?R0ZqVDZXQ0liV1VEQ2w0TVdzVE4rQXlUenM5Smw0aWRiQWZSSFpsV1Q2UFFJ?=
 =?utf-8?B?U1lzc2dhd25ybi95bC9NNnFmSXF4V0FWNmpvNHBxTFhweW5XL2tDMkY5Smkr?=
 =?utf-8?B?SGpwbDV5NEtQNEh0NGxUTHJrQlNtUWFzaS84NWFLR2hKTmZjRy95UzdUK0Fw?=
 =?utf-8?B?RjhtcHpXaWV0K2xnWVBqYVp0UWNsWFZRanNQMlIyc2ZYSkd6NmgyWUtrN0N0?=
 =?utf-8?B?YkRNYTR6SDRvVEZvSlp5VVRTOExidW5ab2xlZ0wrL2xmbmNZVUVkajVLbith?=
 =?utf-8?B?dkJUNjJPS2NwOWJjWkFhNVpCVU1QTnlvLzdqdC9WRVlkaUFIQWZycm5rSVpV?=
 =?utf-8?B?ZmZueHc5TTdhMCtVNVo3QnpKc3Z6bU5xMWcyTnpIK2xjN05zUmxZTjZUbG5X?=
 =?utf-8?B?UFlMOW5GamllSTRDeXQxbkZVaVd0U1hzWFFEdUlFclRaSEtuL3hST2M2WHh6?=
 =?utf-8?B?RVVHaWljTVVzQ242QTVrTGNicmlwTXJWV2ZTeXNSRzN5NFpWRXN6NW5PS0NG?=
 =?utf-8?B?QjBoQS9NemNZRVpFM1NBTklhOTM4aXFGejBzbGQwYzJtL3I2R3B5MWsvZTlp?=
 =?utf-8?B?NWgrQmYzcXVHaWpyNlZtTFFQQitiMmtsam1yVkdudE81bDBzcTFsR1NGNGxQ?=
 =?utf-8?B?VlliWmhHTFpXRHBLNWszVW52WGFhVkxCUXFzbkxvb0F2cVg0bThIdSsrRWFa?=
 =?utf-8?B?NkhQblJxemFSK2JKR2hLVndmQTY4NDMyR1ZrT3I3a3g3aXc0SUlSbk9JbGtq?=
 =?utf-8?B?R0hrZW9jdXdCTEdySHFET3FMcTFtaCtzdlVqV1BYYTFtYU14UnpLS0pMWjZV?=
 =?utf-8?B?VFNGUXRTZStsZnJhZ2ZMNFdMR2l5QnVqNlgrMW5GeC9MTlordlI5NnFFb1JJ?=
 =?utf-8?B?L0twNUVRcHZERDl4K1VFaCtDYVFjT21PYzJ0NDNvTk1wSmRObFFWWUZYdExz?=
 =?utf-8?B?L1kyV204cWNKN3A1aFQxSEd5UGdXMTZVanhjWS9naEdLcklYVkxJRmJJeTNY?=
 =?utf-8?B?QnRPQmJySVlKTXhPTGl2WHZwQWxHeWZtSjR4VlZUM2FDRC9GZDg1bUNvb0th?=
 =?utf-8?B?WXVYUVMxSlZJM3BBN2hqZXIySUUvRXE5bC9lRkZoYW9uK2svdnpFdDZnNmdk?=
 =?utf-8?B?Q2VGbjBXNVBJT04reC9uR1c1TDZrVlV3cWRDNm5RVlJXZnlXMGZEYUx5SWZH?=
 =?utf-8?B?WUkrZ2VCMHlNZXR4anYrRXE5ajZ5N25pNHdrT29aUzBGVkNKY3F3Z3Y4aTdR?=
 =?utf-8?B?U1Z3czJmcWFVQTFSMVhzSVZCc2FjeEN3SEMrMStmTXVoOFJvTjVKcmR2NjYy?=
 =?utf-8?B?Vm10MU1teStoSS9IL0d2Z2JRQ010cmlCQ3lxa2gxZGJPeWovcUl0UWl0UWJp?=
 =?utf-8?B?WDltaG1jWjJYL3AvQXdRSXo4YjN3anVudHczU2tNaEpaWkl6cys1VFJZa1Jy?=
 =?utf-8?B?UDdydnU3ZWcyUkJQdTVZNFM1L1AzSDNGMFhaTzJUZm1FUlkxTDNZNk91OWh2?=
 =?utf-8?B?QlFPRXEreW9qV2VOSGJ0RWw1VE5RPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <532005749EF29E42803B1CF76E67C68D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b094890-24b2-4c57-57b9-08d9efce3ceb
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 15:25:31.3212
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oCH+o5zwerIC9kI5/zfcRsf1hRcFmKOiqVBnq7shAiwqlCwtEnfGauXysEhsaFOZWWGEGincTxY3QGXIjAuM0sEAxG1bnHj27LecC6rxaGM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3917
X-OriginatorOrg: citrix.com

T24gMTQvMDIvMjAyMiAxNTowMiwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6DQo+IEhlbGxvLA0KPg0K
PiBXZSBoYXZlIHJ1biBpbnRvIGFuIGlzc3VlIHdoZW4gdHJ5aW5nIHRvIHVzZSBQQ0kgcGFzc3Ro
cm91Z2ggZm9yIGEgWGVuDQo+IFZNIHJ1bm5pbmcgb24gYW4gaG9zdCB3aGVyZSBkb20wIGtlcm5l
bCBpcyA1LjE0LjIxIChidXQgd2UgdGhpbmsgaXQNCj4gY291bGQgYmUgYW55IGtlcm5lbCA+IDUu
NCkgYW5kIFNlY3VyZUJvb3QgaXMgZW5hYmxlZC4NCg0KQmFjayB1cCBhIGJpdC4uLg0KDQpYZW4g
ZG9lc24ndCBzdXBwb3J0IFNlY3VyZUJvb3QgYW5kIHRoZXJlJ3MgYSBtYXNzaXZlIHBpbGUgb2Yg
d29yayB0bw0KbWFrZSBpdCBmdW5jdGlvbiwgbGV0IGFsb25lIHdvcmsgaW4gYSB3YXkgdGhhdCBN
U0ZUIGFyZW4ndCBsaWFibGUgdG8NCnJldm9rZSB5b3VyIGNlcnQgb24gMCBub3RpY2UuDQoNCj4N
Cj4gVGhlIGVycm9yIHdlIGdldCwgd2hlbiAoZm9yIGluc3RhbmNlKSB0cnlpbmcgdG8gYXR0YWNo
IGEgZGV2aWNlIHRvIGFuDQo+IChIVk0pIFZNLCBvbiBzdWNoIHN5c3RlbSBpczoNCj4NCj4gIyB4
bCBwY2ktYXR0YWNoIDItZnYtc2xlczE1c3A0YmV0YTIgMDAwMDo1ODowMy4wIA0KPiBsaWJ4bDog
ZXJyb3I6IGxpYnhsX3FtcC5jOjE4Mzg6cW1wX2V2X3BhcnNlX2Vycm9yX21lc3NhZ2VzOiBEb21h
aW4gMTI6RmFpbGVkIHRvIGluaXRpYWxpemUgMTIvMTUsIHR5cGUgPSAweDEsIHJjOiAtMQ0KPiBs
aWJ4bDogZXJyb3I6IGxpYnhsX3BjaS5jOjE3Nzc6ZGV2aWNlX3BjaV9hZGRfZG9uZTogRG9tYWlu
IDEyOmxpYnhsX19kZXZpY2VfcGNpX2FkZCBmYWlsZWQgZm9yIFBDSSBkZXZpY2UgMDo1ODozLjAg
KHJjIC0yOCkNCj4gbGlieGw6IGVycm9yOiBsaWJ4bF9kZXZpY2UuYzoxNDIwOmRldmljZV9hZGRy
bV9hb2NvbXBsZXRlOiB1bmFibGUgdG8gYWRkIGRldmljZQ0KPg0KPiBRRU1VLCBpcyB0ZWxsaW5n
IHVzIHRoZSBmb2xsb3dpbmc6DQo+DQo+IFswMDowNC4wXSB4ZW5fcHRfbXNpeF9pbml0OiBFcnJv
cjogQ2FuJ3Qgb3BlbiAvZGV2L21lbTogT3BlcmF0aW9uIG5vdCBwZXJtaXR0ZWQNCj4gWzAwOjA0
LjBdIHhlbl9wdF9tc2l4X3NpemVfaW5pdDogRXJyb3I6IEludGVybmFsIGVycm9yOiBJbnZhbGlk
IHhlbl9wdF9tc2l4X2luaXQuDQo+DQo+IEFuZCB0aGUga2VybmVsIHJlcG9ydHMgdGhpczoNCj4N
Cj4gSmFuIDI3IDE2OjIwOjUzIG5hcnZpLXNyODYwdjItYnBzLXNsZXMxNXNwNGIyIGtlcm5lbDog
TG9ja2Rvd246IHFlbXUtc3lzdGVtLWkzODogL2Rldi9tZW0sa21lbSxwb3J0IGlzIHJlc3RyaWN0
ZWQ7IHNlZSBtYW4ga2VybmVsX2xvY2tkb3duLjcNCj4NCj4gU28sIGl0J3MgcmVsYXRlZCB0byBs
b2NrZG93bi4gV2hpY2ggQUZBSVVJIGl0J3MgY29uc2lzdGVudCB3aXRoIHRoZQ0KPiBmYWN0IHRo
YXQgdGhlIHByb2JsZW0gb25seSBzaG93cyB1cCB3aGVuIFNlY3VyZUJvb3QgaXMgZW5hYmxlZCwg
YXMNCj4gdGhhdCdzIGltcGxpZXMgbG9ja2Rvd24uIEl0J3MgYWxzbyBjb25zaXN0ZW50IHdpdGgg
dGhlIGZhY3QgdGhhdCB3ZQ0KPiBkb24ndCBzZWVtIHRvIGhhdmUgYW55IHByb2JsZW1zIGRvaW5n
IHRoZSBzYW1lIHdpdGggYSA1LjMueCBkb20wDQo+IGtlcm5lbC4uLiBBcyB0aGVyZSdzIG5vIGxv
Y2tkb3duIHRoZXJlIQ0KPg0KPiBTb21lIGRpZ2dpbmcgcmV2ZWFsZWQgdGhhdCBRRU1VIHRyaWVz
IHRvIG9wZW4gL2Rldi9tZW0gaW4NCj4geGVuX3B0X21zaXhfaW5pdCgpOg0KPg0KPiAgICAgZmQg
PSBvcGVuKCIvZGV2L21lbSIsIE9fUkRXUik7DQo+ICAgICAuLi4NCj4gICAgIG1zaXgtPnBoeXNf
aW9tZW1fYmFzZSA9DQo+ICAgICAgICAgICAgIG1tYXAoTlVMTCwNCj4gICAgICAgICAgICAgICAg
ICB0b3RhbF9lbnRyaWVzICogUENJX01TSVhfRU5UUllfU0laRSArIG1zaXgtPnRhYmxlX29mZnNl
dF9hZGp1c3QsDQo+ICAgICAgICAgICAgICAgICAgUFJPVF9SRUFELA0KPiAgICAgICAgICAgICAg
ICAgIE1BUF9TSEFSRUQgfCBNQVBfTE9DS0VELA0KPiAgICAgICAgICAgICAgICAgIGZkLA0KPiAg
ICAgICAgICAgICAgICAgIG1zaXgtPnRhYmxlX2Jhc2UgKyB0YWJsZV9vZmYgLSBtc2l4LT50YWJs
ZV9vZmZzZXRfYWRqdXN0KTsNCj4gICAgIGNsb3NlKGZkKTsNCg0KWWVzLsKgIFVzZSBvZiAvZGV2
L21lbSBpcyBub3QgcGVybWl0dGVkIGluIGxvY2tkb3duIG1vZGUuwqAgVGhpcyB3YW50cw0KcmV3
b3JraW5nIGludG8gc29tZXRoaW5nIHdoaWNoIGlzIGxvY2tkb3duIGNvbXBhdGlibGUuDQoNClRo
ZSByZWFsIGVsZXBoYW50IGluIHRoZSByb29tIGlzIHRoYXQgcHJpdmNtZCBpcyBub3QgcmVtb3Rl
bHkgc2FmZSB0bw0KdXNlIGluIGEgU2VjdXJlQm9vdCBlbnZpcm9ubWVudCwgYmVjYXVzZSBpdCBs
ZXRzIGFueSByb290IHVzZXJzcGFjZQ0KdHJpdmlhbGx5IGVzY2FsYXRlIHByaXZpbGVnZSBpbnRv
IHRoZSBkb20wIGtlcm5lbCwgYnlwYXNzaW5nIHRoZQ0Kc3BlY2lmaWMgcHJvdGVjdGlvbiB0aGF0
IFNlY3VyZUJvb3QgaXMgdHJ5aW5nIHRvIGFjaGlldmUuDQoNCn5BbmRyZXcNCg==

