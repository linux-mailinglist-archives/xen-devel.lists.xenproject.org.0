Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E104AD9C1
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 14:28:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268309.462108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHQX1-0003tD-U5; Tue, 08 Feb 2022 13:27:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268309.462108; Tue, 08 Feb 2022 13:27:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHQX1-0003rN-Qr; Tue, 08 Feb 2022 13:27:43 +0000
Received: by outflank-mailman (input) for mailman id 268309;
 Tue, 08 Feb 2022 13:27:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mkaY=SX=citrix.com=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nHQWz-0003rH-Jd
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 13:27:41 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e178141e-88e2-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 14:27:39 +0100 (CET)
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
X-Inumbo-ID: e178141e-88e2-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644326858;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Y3vyjGmOZne3/GeAe6z9lN/7bVMLGOOhguo1PRsgLmA=;
  b=Uz5Bc0lys4/HzAK6WqcRSbH/dTkQrT9rTd5mKeoJ6yUHttqP0Fvj68ub
   vgEP5liaafKDSWgx10TFQzt/TmpSNbI4M8geGG6Uxg+zx0bNgZxYRPCTo
   AGH7cb+RUAostSfEqiBs4T3tttbkToMqpFr1HSmN/w25sh3aZ5hPMblV5
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4lE400Ip5bVwgrbuvD9CpygLmbBZWmg1SZ5pveTHLEamln4hSMQPDPzFKw2KzVyLo3i8Fdlpjp
 D9SmfjQL9EuB/6W3kKgpeiWLZYsqpX1onpHQfxM4QQ6O5DUIDvQ+Fw5ufBHnLXvAsTdKdNzWAX
 WjWvpbjmAhL0qDSdyVU9pZJXWEAUdTauI798p8ErgvV9++znpk5SsrItoaLzEDQ8ywANh/Bfun
 N7HH/l5oUdzx3cogriUXNcU6k9+vXPROwgPmxfOU/o3nKgDO9HyzfdddAVS1FcwwdZ68BFpJ9b
 vNl7/OQeqg1o8/XK8n7KjSQK
X-SBRS: 5.1
X-MesageID: 65944017
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:kamsBKBHQasiMRVW/23lw5YqxClBgxIJ4kV8jS/XYbTApDMjgWRWz
 jcaW23TOPiLMTSkc49waYix80IE756DnIcwQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En970UI7wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/tDuisMAr0
 /R3qL/vWwsvHZLPvto7TEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTaOBqi4IGJc3iOIoZt1lrzC3DDOZgSpfGK0nPzYEFjWts3pkRdRrYT
 41ENShWQE7wWBpkOnYMK7Uup+KygXaqJlW0r3rK/PFqsgA/1jdZ3LHzPfLPd9eNRMETmVyXz
 krd5HjwCBweMN2ZyBKG/2iqi+uJmjn0MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN80hQpqa8+5Um6VO7XVhezoGOHlhMEUt8WGOo/gCmSzoLE7gDfAXILJhZDYtE7sM49RRQxy
 0SE2djuAFRHsqCRSH+b3qeZq3W1Iyd9BW0NfygfViMe/sLu5oo0i3ryos1LSfDvyIevQHepn
 m7M/HNWa6gvYdAj6KuQ0kCdmBOWu7uWXAIzxTrUeFyD8VYsDGK6XLCA5V/e5PdGCY+WSFido
 XQJ8/SjAPAy4YKlz3LUHrhUdF29z7PcaWCH3wYzd3U032n1oxaekZZsDCaSzauDGuINYnfXb
 UDaomu9D7cDbSLxPcebj29cYvnGLJQM9/y4DJg4jfIUO/CdkTNrGwk0NCatM5jFyhRErE3GE
 c7znTyQJXgbE7976zG9Wv0Q17Qmrghnmz+PHMGilkr2i+PFDJJwdVviGAHfBt3VEYve+FmFm
 zqhH5fiJ+pjvB3WPXCMrN97waEiJnknH5Hmw/G7hcbYSjeK7FoJUqeLqZt4ItQNt/0Myo/go
 yHsMmcFmQGXrSCWdm2iNCs5AJuxBskXkJ7OFXF1Vbpe8yN4OtjHAWZ2X8ZfQITLA8Q5laEtF
 KReK5zbahmNIxyekwkggVDGhNUKXDyghB6UPjrjZz46fpV6QBfO9MOidQzqnBTixALt3Sfni
 7H/hA7dX7QZQAFuUJTfZP61lgvjtnkBguNiGUDPJ4ALKknr9YFrLQ33j+M2fJ5QeUmSmGPC2
 lbEGwocqMnMv5QxrIvDi5ebotr7COB5BEdbQTXWtO7kKSnA82O/6oZcS+LULyvFXWb59fz6N
 +VYxv3xKtMdm1NOv9YuGrpn1/tmtdDuu6Vb3kJvG3CSNwanDbZpI3+n28hTt/ISmu8F6FXuA
 k/Wo4tUI7SEPs/hAWU9Hgt9Y7TRz+wQlxnT8e8xfBfw6hho8efVSk5VJRSN1nBQdeMnLIM/z
 O49k8cK8Ajj2AEyO9OLgy0IpWSBKnsMD/cuup0AWdK5jwMqzhdJYIDGCz+w65aKMo0ePk4vK
 z6SpazDm7UDmRaSLyttTSDAjbhHmJADmBFW11tTdV2Gl+3MiuIzwBAMoy88SR5Yz0kf3u9+U
 oSx25aZ+UlaE+9UufV+
IronPort-HdrOrdr: A9a23:ipsCPKwmkk6V3KwCBDXfKrPxgeskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9IYgBcpTiBUJPwJE81bfZOkMYs1MSZLXXbUQyTXc9fBOrZsnHd8kjFmNK1up
 0QCpSWZOeAbmSSyPyKmjVQcOxQgeVvkprY/ds2pk0FJWoBCsFdBkVCe32m+yVNNVJ77PECZf
 6hD7981lydkAMsH6OG7xc+Lor+juyOsKijTQ8NBhYh5gXLpyiv8qTGHx+R2Qpbey9TwJ85mF
 K10zDR1+GGibWW2xXc32jc49B9g9360OZOA8SKl4w8NijssAC1f45sMofy/wzd4dvfqmrCou
 O85yvIDP4DrE85uVvF5ycF7jOQlQrGLUWSkGNwz0GT+fARDwhKdPapzbgpDCcxrXBQ5u2UmZ
 g7rl6xpt5ZCwjNkz/64MWNXxZ2llCsqX5niuILiWdDOLFuI4O5gLZvtX+9Kq1wVB4SKbpXZd
 VGHYXZ/rJbYFmaZ3fWsi1mx8GtRG06GlODTlIZssKY3jBKlDQhpnFoifA3jzMF7tYwWpNE7+
 PLPuBhk6xPVNYfaeZ4CP0aScW6B2TRSVbHMX6UI17gCKYbUki94aLf8fEw/qWnaZYIxJw9lN
 DIV05Zr3c7fwb0BciHzPRwg2bwqaWGLEPQI+1llutEU4zHNc7W2He4OSATeuOb0ociPvE=
X-IronPort-AV: E=Sophos;i="5.88,352,1635220800"; 
   d="scan'208";a="65944017"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9o+HWAsIEbk0hkt8LjJHrOxC0/w5L8oUwiEnN7Uj3TbAeG1Qmwsb56XnlvoTipJUUMaV7b6F7VmASgH+2g38u45z1N9H5x6brIKJ6g0Nzf0+ZF1/YEJhIiuFQXWTHd7coWDk29XWK9JLmsgW0kLXuPNTzku2oc5+q2jsqIt1dh27DfWwdJKaNLvMpxs05LTqLIwZzXmx6jv/hyLUcGhrw2Q+D1x0XcX23vj7K1qCh8CHSUfvrwZPPar/w+EKUqPXMH31d8fPusyeLTVQFLg9ZFCs00m5k5NGLRzq7rUM+9Mh237MbkkHCWt/TNXbLGclH6Rl3eC5ioP9a8RKWn1nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y3vyjGmOZne3/GeAe6z9lN/7bVMLGOOhguo1PRsgLmA=;
 b=WQrqUrCFpW/w9Fhy+h+Mvh9sRaN+iDCxsO1+YtOgqaGFRUDDX3+Mr99kWvXXWDmNg7j+Mbu1muK56CbRWsckCRXQ9/8sC+MGej1knyk4X5Bq8yt4rlBAwVTMQKtizqqjRw7HxgaM8Xm0zUMcpKvcQBfWT9SZm942/n9PsMDVvux8S3yO0KhtFdFENMyX7STB1J0GEMBkL6dS72Jm99YUHCllkGJRApY7sWneJHzvA/uOrNwpCLWmn/0zSVRCRymhIP/wL927Hr94iGriYkKDIlZNu4Q8mNnYkKcUbXlAHYdiJxohat7rxJl/YuOX2E0rIIcYuIUMzJrqrWCYZ6448A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y3vyjGmOZne3/GeAe6z9lN/7bVMLGOOhguo1PRsgLmA=;
 b=e2R2PkLx5/TFbjcsqDoFWSVdWDjW6BO1md6A6PVZ6KTqls/+1kYZjvbhShMpwBpxLSfeBNRuSVTPMb9eoW2BGhg+Bzi40pwYNyk9fnR7gaBktDLgCts4veOw1HRwcmkhAm/qkIbce8uHK80Q1WowlJQUai2DMuXaGRbCJJp9Csc=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, "Juergen
 Gross" <jgross@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "George
 Dunlap" <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Thread-Topic: [PATCH 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Thread-Index: AQHYE5eVWWLwfSz8JEi35sISHqV9YKx9DnUAgAypmgA=
Date: Tue, 8 Feb 2022 13:27:33 +0000
Message-ID: <a4af7c49-99af-b66a-a05f-2907fa6d50f1@citrix.com>
References: <20220127160133.11608-1-jane.malalane@citrix.com>
 <20220127160133.11608-3-jane.malalane@citrix.com>
 <8b59b7d7-2d0a-0b8a-f936-1e537dfc4f9a@suse.com>
In-Reply-To: <8b59b7d7-2d0a-0b8a-f936-1e537dfc4f9a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd06a2f2-c8ed-4147-c015-08d9eb06c3b4
x-ms-traffictypediagnostic: DM5PR03MB2540:EE_
x-microsoft-antispam-prvs: <DM5PR03MB25401559309EF2B9CF2C02CC812D9@DM5PR03MB2540.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GyUhCtKWZY8pWGUuW+kkl6esB7age8Yx80FJXQhWQSFZDx+/iZPL2Nfd/uBW/VPoNq1QukMVkU5gG4rdMHOBk1q7UTt1FupXf/q4rP4CUeZfKMpf6qUzq8mQ1JYK1DtP2+dvcwQqgceo/S8RcF/kKHkGqJ0P8HboRZ4Q8ufC2HqRB78lTwzYLzw2d+ZiUBYBLKcFdudh/IxuH+0wfm7pCaGFWDw+TLVRLr0lFHZh9lh/yzobLTZ+1HcOEstXFFCIAdClHG9Q/P0WyK9jb4e7DU17iQ36cXA7HDnath02Nw2ay71R46KTeHT8SrwAlvuzf6NNDXiihH1W8yZXnqvZJRGtNXDvpN5eSz12ZjMYEuFJ+NmS8Xcc7lOa+kZdCkWqWC+mqC8u88haLSQRseyJ9+PIxm4KiMRfMRscrPpZqTOA2N9QceMnwiJ4SIGoHEmPaqIVGVjayN9cuULF8KS7fXa46EpBXM8fPdEKXDY/LoRWbRtSJKAslDcwAOlyV/d6n8ipjuzJ9wCylkBL0t94ah1B3KyQ236z0wyBHhru+lJwKmdX2fo9Hqs8gceoJq4kzRd86B3StIJMv0w1Gi7eG/notErlpmTfoR+7DwdIXCzN1Ozu6fhxcvPZcIf4o7YmkFncxiSqnjVb18pYLNv2lWgMVUWmZxj6avt18YRsBoJw33gvw9TjBFym09AZ1Dt+7sVFBzislrc7K7X1FFLNOTKUb8R9WqX9l55P5WjyUUo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR03MB3386.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(86362001)(31696002)(8936002)(6486002)(6512007)(6506007)(31686004)(66556008)(66446008)(66476007)(8676002)(64756008)(83380400001)(4326008)(53546011)(91956017)(5660300002)(316002)(71200400001)(38070700005)(36756003)(6916009)(122000001)(82960400001)(2616005)(186003)(26005)(76116006)(54906003)(66946007)(2906002)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ODBBOW5Hb1VZZUpwc0xKMU5FTmw0cnBHSTNmSndTK0JSeEM3K0VPTzhlVEZU?=
 =?utf-8?B?R2dmaFJNaFVyQTRMMC9UV09vVDVJejdEWVBXcllsYjJlMzIzUXlWdW9Ub0RO?=
 =?utf-8?B?Qy9pQ3hidjdZTGRyRldBMHZndTFFQWVoQlNQQkdDRlVnVWdqdmpONE5BbzRs?=
 =?utf-8?B?WDkvU3gyU1NoYSt2bjQ0bTh1cVBha0lyRkFhdkcrS2JYZmRFMU1CZHFyblZ5?=
 =?utf-8?B?ZHI4bzhoUENEV1d3VytiUktuR1lSTkpZVDh1NGdoSkk3OU9FVHB3SmRjNjk3?=
 =?utf-8?B?ekN3eU1DV1dEbzVYTmpjSjJoWjN1VURYMzYzQWRyQ1NhYVRDZ1FubTlweHg2?=
 =?utf-8?B?QU5mNU9SQTVXakd4bFdocS8zemxxc0phdW9zUWxlODVIT1p0QzA5aFo4bm40?=
 =?utf-8?B?VHU5L052S3ZKYlBDZyt3clp3bHVDQVhSbkhjTkRob0JmRE9CTTAzYWswcmxs?=
 =?utf-8?B?QVFPcUxncEUwZ0p6ZXhaczdmMU1SZVpKQTN0OW1IdkM3bTVqUGVveFdrQnYy?=
 =?utf-8?B?Qy90WFNrWVJPTk8yV0lRdFBkZDE1cHhyNCt1b1F3Y1ptSTliNndjVDZrZmw5?=
 =?utf-8?B?d01HWWtnWTBRaW9FVEV2WG1ua2Z6ZjRDMmplZWtqVmkzRFBheXJkanlhWnRZ?=
 =?utf-8?B?cTZHa0FBRHVBWTVRbG1KSC9VL29meWJQYVErY3N2UGlMOVg3SlRtdU5VeUdv?=
 =?utf-8?B?b2FyYWZqQ1VqdDBHNVZlMEFWZ0JwbzZ4TWhHU3Fxa0FwOFliajdmT2MwdmFv?=
 =?utf-8?B?K3R4VWh0M3gwSElaVURIUkZML0FlOHJXdW1IQkxCVEhickdQYW0waW0xTmZn?=
 =?utf-8?B?Z0VMb3RxcEN1RkkzRHB4elZzMkh0WkRTbFYya1MwdTlqekd6SVJ4OGNpSHZ4?=
 =?utf-8?B?SGZCbWNKSUlZVitBTThXSHdOL0d5NUJsU2tSY1lRNks0TjdPMVlaVkduSk5K?=
 =?utf-8?B?K21TOVY2YThsZGN1dERWMlBMRW9mcWxnUmkwckZNNEFQaCtVTjRsVkhvRm9h?=
 =?utf-8?B?SU95aWtwREJOeDJwL2U3bEJBRlRBMW9WQ0hCVGNpR0ZGb255bXRNd2lxU2dP?=
 =?utf-8?B?VUZ1S2F0Q3NwZ3NUeDloV0MwUmpsNHo0S0tRM0pFQnVlWE1QeU9HbFpUd3hF?=
 =?utf-8?B?TWYyazhQb09XZXhVcDdzWGJXTmY2SXMyaVRIMzIxbWk1S2IzMGpxNndkYlRx?=
 =?utf-8?B?VlA0NXVURkdkODBOV2xqNEZwSnAvSW04Y0VtNDlpc3RiNmlMaFJuTlJjdkhI?=
 =?utf-8?B?NlE4UVd1bUxrT2lVK3lDS0srVjRlWHVvU0U2OTI1Z05mNEc5Qm5mMFBNbEJv?=
 =?utf-8?B?RGE1S00zaEFURDlwWTJ0WndiMzJzR0ZBT2pWNjZlOGRhWDlFSS9XT2RSU0VG?=
 =?utf-8?B?M0JDT3JSejlCQ1lvbTZ6Zkg4cDd5V1o1b2NnUnhzYngwU1Q1amlpL1RRRXlH?=
 =?utf-8?B?UGt2bzNsODhxQkZHMktkNDVJZi9UcEFaNUk2dXJoMXphNzZOR05jek9WZFlo?=
 =?utf-8?B?NFFUWmZHNjd0cUVIaWJRMzd4dExrSDE2SkE4WnVIU3FRVmx2TC83SVVXQWo3?=
 =?utf-8?B?R21lUEtHWVBQOFNoTjRBSHREM2NmREdPNkNxUGw4WVJFQ0RKRlFVK1c4TGJJ?=
 =?utf-8?B?eWw0ZExmcnYrelREUUJQRmdsbWwxajMrcVFTR2hVM3p6c04vYTFvdDdudHdU?=
 =?utf-8?B?alR3SUx6ampZVEdiVWhjTm1lMTNaV1U1VVFjYitaN0hTT3Bka2FwWkdnSHFK?=
 =?utf-8?B?ZWdFWlh4bk1YWFp1aEdQMFcrYklqT2o4TldjMXRmMlJPR2IzSXE4eGVEZDh6?=
 =?utf-8?B?VzROYVEvelc4aDhhczVUcWcrSmRoeGp1NFVoVHB1amFReUY0b081ZWVGdXZr?=
 =?utf-8?B?K0p6ZnEvTVN0b0xlaUJJK3V4bzREQ0pHRjRJTVh6Z2g2dGhVL3pZcXA5czFJ?=
 =?utf-8?B?dUpsRGU3YStib29ZNERZOHpFYURNTXhZaTh5M0RzL1JTbXU0a05RUnUwVDYz?=
 =?utf-8?B?NjBjaHRvSTB6VDhydnlMYU0yVEg0RCsxakcvZzU5RitobmcvUm5HMlRBNkIy?=
 =?utf-8?B?QWF6bFlNYm9PZXVzTzY0L0l0YlZBVS9LUnN0WGlONlphY0gvTFpuM3ZXd2Ry?=
 =?utf-8?B?c0ltalhIc0xYYzJNVktVVlNqZFhoOXJvblE4UU12WG1TVVV2eGRKdEFTVzVj?=
 =?utf-8?B?Ty9qeC9jdDVFWHI5VlF1SHJjUURHNGZtaTZnTDJaZ0g5ZFp3Q0FSMU5Qd0JS?=
 =?utf-8?Q?OlHkssrI2x7WT0A8vuZ4fABMf3mEiOvdh2O2REU7NA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D310818BFE2F96489D03751F7FC9D8EE@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR03MB3386.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd06a2f2-c8ed-4147-c015-08d9eb06c3b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 13:27:33.4744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yY6zdKjWvbC8EGG5J0qgVmfoqszbqfxwfPu9PzjBxemVhUkUw27QIzyCC75QMDjumnUz7z26Rz03B/6GColnKXCwueIAb08XAgoGRrvuKUY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2540
X-OriginatorOrg: citrix.com

T24gMzEvMDEvMjAyMiAxMjowNSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI3LjAxLjIwMjIg
MTc6MDEsIEphbmUgTWFsYWxhbmUgd3JvdGU6DQo+PiBJbnRyb2R1Y2UgYSBuZXcgcGVyLWRvbWFp
biBjcmVhdGlvbiB4ODYgc3BlY2lmaWMgZmxhZyB0bw0KPj4gc2VsZWN0IHdoZXRoZXIgaGFyZHdh
cmUgYXNzaXN0ZWQgdmlydHVhbGl6YXRpb24gc2hvdWxkIGJlIHVzZWQgZm9yDQo+PiB4ezJ9QVBJ
Qy4NCj4+DQo+PiBBIHBlci1kb21haW4gb3B0aW9uIGlzIGFkZGVkIHRvIHhsIGluIG9yZGVyIHRv
IHNlbGVjdCB0aGUgdXNhZ2Ugb2YNCj4+IHh7Mn1BUElDIGhhcmR3YXJlIGFzc2lzdGVkIHZpdHVh
bGl6YXRpb24sIGFzIHdlbGwgYXMgYSBnbG9iYWwNCj4+IGNvbmZpZ3VyYXRpb24gb3B0aW9uLg0K
Pj4NCj4+IEhhdmluZyBhbGwgQVBJQyBpbnRlcmFjdGlvbiBleGl0IHRvIFhlbiBmb3IgZW11bGF0
aW9uIGlzIHNsb3cgYW5kIGNhbg0KPj4gaW5kdWNlIG11Y2ggb3ZlcmhlYWQuIEhhcmR3YXJlIGNh
biBzcGVlZCB1cCB4ezJ9QVBJQyBieSBydW5uaW5nIEFQSUMNCj4+IHJlYWQvd3JpdGUgYWNjZXNz
ZXMgd2l0aG91dCB0YWtpbmcgYSBWTSBleGl0Lg0KPiANCj4gVGhpcyBpcyBvZGQgdG8gcmVhZCBm
b3IgYSBwYXRjaCB3aGljaCBtYWtlcyBpdCBwb3NzaWJsZSB0byBfdHVybiBvZmZfDQo+IGFjY2Vs
ZXJhdGlvbi4gSW5zdGVhZCBpdCB3b3VsZCBiZSBpbnRlcmVzdGluZyB0byBrbm93IHdoYXQgcHJv
YmxlbXMNCj4geW91IGhhdmUgZW5jb3VudGVyZWQgbWFraW5nIGl0IGRlc2lyYWJsZSB0byBoYXZl
IGEgd2F5IHRvIHR1cm4gdGhpcyBvZmYuDQoNCkhpIEphbiwNCg0KQWZ0ZXIgc3BlYWtpbmcgdG8g
QW5kcmV3IGhlIHRvbGQgbWUgb2YgYSBwZXJmb3JtYW5jZSByZWdyZXNzaW9uIHRoYXQgd2FzIA0K
cmVwb3J0ZWQgc29tZSB0aW1lIGFnbyB3aGVuIGVuYWJsaW5nIGFwaWN2IHJlbGF0ZWQgdG8gdGhl
IHBhc3MtdGhyb3VnaCANCkxBUElDIHRpbWVyIG9mIGEgSFZNIGd1ZXN0IGNhdXNpbmcgWGVuIHRv
IGludGVyY2VwdCB0aGUgTEFQSUMgdGltZXIgTVNSLCANCm1ha2luZyBhbnl0aGluZyB0aGF0IHVz
ZXMgdGhlIExBUElDIHRpbWVyIGVuZCB1cCBzbG93ZXIgdGhhbiBpdCB3YXMgDQpiZWZvcmUuIFNv
LCBhZHJlc3NpbmcgeW91ciBjb21tZW50IGhlcmUsIG90aGVyIHRoYW4gbWVudGlvbmluZyBob3cg
YmVpbmcgDQphYmxlIHRvIGRpc2FibGUgYWNjZWxlcmF0aW9uIGZvciBhcGljdiBjYW4gYmUgdXNl
ZnVsIHdoZW4gdGVzdGluZyBhbmQgDQpkZWJ1Z2dpbmcsIGRvIHlvdSB0aGluayBpdCdzIHdvcnRo
IG1lbnRpb25pbmcgKGluIG1vcmUgZGV0YWlsKSB0aGF0IHRoaXMgDQpwZXJmIHByb2JsZW0gZXhp
c3RzLCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuDQoNClRoYW5rcywNCg0KSmFuZS4NCg0KPiANCj4+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jDQo+PiArKysgYi94ZW4vYXJjaC94ODYv
aHZtL3ZteC92bXguYw0KPj4gQEAgLTMzNDIsMTYgKzMzNDIsMTkgQEAgc3RhdGljIHZvaWQgdm14
X2luc3RhbGxfdmxhcGljX21hcHBpbmcoc3RydWN0IHZjcHUgKnYpDQo+PiAgIA0KPj4gICB2b2lk
IHZteF92bGFwaWNfbXNyX2NoYW5nZWQoc3RydWN0IHZjcHUgKnYpDQo+PiAgIHsNCj4+IC0gICAg
aW50IHZpcnR1YWxpemVfeDJhcGljX21vZGU7DQo+PiArICAgIGludCB2aXJ0dWFsaXplX3hhcGlj
X21vZGUsIHZpcnR1YWxpemVfeDJhcGljX21vZGU7DQo+IA0KPiBQbGVhc2Ugc3dpdGNoIHRvIGJv
b2wgYXMgeW91IHRvdWNoIGFuZCBleHRlbmQgdGhpcy4NCj4gDQo+PiAgICAgICBzdHJ1Y3Qgdmxh
cGljICp2bGFwaWMgPSB2Y3B1X3ZsYXBpYyh2KTsNCj4+ICAgICAgIHVuc2lnbmVkIGludCBtc3I7
DQo+PiAgIA0KPj4gKyAgICB2aXJ0dWFsaXplX3hhcGljX21vZGUgPSAoIGNwdV9oYXNfdm14X3Zp
cnR1YWxpemVfYXBpY19hY2Nlc3NlcyAmJg0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHYtPmRvbWFpbi0+YXJjaC5odm0uYXNzaXN0ZWRfeGFwaWMgKTsNCj4gDQo+IFBsZWFzZSBk
b24ndCBjbG9uZSB0aGUgYmFkIHVzZSBvZiBibGFua3MgaW1tZWRpYXRlbHkgaW5zaWRlIHBhcmVu
dGhlc2VzDQo+IGhlcmU7IGluc3RlYWQsIC4uLg0KPiANCj4+ICAgICAgIHZpcnR1YWxpemVfeDJh
cGljX21vZGUgPSAoIChjcHVfaGFzX3ZteF9hcGljX3JlZ192aXJ0IHx8DQo+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgY3B1X2hhc192bXhfdmlydHVhbF9pbnRyX2RlbGl2ZXJ5
KSAmJg0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjcHVfaGFzX3ZteF92aXJ0
dWFsaXplX3gyYXBpY19tb2RlICk7DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGNwdV9oYXNfdm14X3ZpcnR1YWxpemVfeDJhcGljX21vZGUgJiYNCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdi0+ZG9tYWluLT5hcmNoLmh2bS5hc3Npc3RlZF94MmFwaWMgKTsN
Cj4gDQo+IC4uLiBzaW5jZSB5b3UncmUgdG91Y2hpbmcgdGhpcyBhbnl3YXksIHBsZWFzZSBjb25z
aWRlciBjb3JyZWN0aW5nDQo+IHRoZSBzdHlsZSB2aW9sYXRpb24gaGVyZS4NCj4gDQo+IEhvd2V2
ZXIgLSBkbyB5b3UgbmVlZCB0aGVzZSBleHByZXNzaW9ucyBhbnltb3JlPyBUaGUgcGVyLWRvbWFp
biBmaWVsZHMNCj4gY2FuIG9ubHkgYmUgc2V0IGlmIHRoZSByZXNwZWN0aXZlIENQVSBjYXBhYmls
aXRpZXMgZXhpdC4NCj4gDQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vaHZtL2Rv
bWFpbi5oDQo+PiArKysgYi94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vaHZtL2RvbWFpbi5oDQo+
PiBAQCAtMTE3LDYgKzExNywxMiBAQCBzdHJ1Y3QgaHZtX2RvbWFpbiB7DQo+PiAgIA0KPj4gICAg
ICAgYm9vbCAgICAgICAgICAgICAgICAgICBpc19zM19zdXNwZW5kZWQ7DQo+PiAgIA0KPj4gKyAg
ICAvKiB4QVBJQyBoYXJkd2FyZSBhc3Npc3RlZCBlbXVsYXRpb24uICovDQo+PiArICAgIGJvb2wg
YXNzaXN0ZWRfeGFwaWM7DQo+PiArDQo+PiArICAgIC8qIHgyQVBJQyBoYXJkd2FyZSBhc3Npc3Rl
ZCBlbXVsYXRpb24uICovDQo+PiArICAgIGJvb2wgYXNzaXN0ZWRfeDJhcGljOw0KPj4gKw0KPj4g
ICAgICAgLyogaHlwZXJ2aXNvciBpbnRlcmNlcHRlZCBtc2l4IHRhYmxlICovDQo+PiAgICAgICBz
dHJ1Y3QgbGlzdF9oZWFkICAgICAgIG1zaXh0YmxfbGlzdDsNCj4gDQo+IFBsZWFzZSBmb2xsb3cg
aG93IGFkamFjZW50IGNvZGUgcGFkcyB0eXBlcyAvIG5hbWVzIGhlcmUuDQo+IA0KPj4gLS0tIGEv
eGVuL2FyY2gveDg2L3RyYXBzLmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni90cmFwcy5jDQo+PiBA
QCAtMTExNSw3ICsxMTE1LDggQEAgdm9pZCBjcHVpZF9oeXBlcnZpc29yX2xlYXZlcyhjb25zdCBz
dHJ1Y3QgdmNwdSAqdiwgdWludDMyX3QgbGVhZiwNCj4+ICAgICAgICAgICBpZiAoICFpc19odm1f
ZG9tYWluKGQpIHx8IHN1YmxlYWYgIT0gMCApDQo+PiAgICAgICAgICAgICAgIGJyZWFrOw0KPj4g
ICANCj4+IC0gICAgICAgIGlmICggY3B1X2hhc192bXhfYXBpY19yZWdfdmlydCApDQo+PiArICAg
ICAgICBpZiAoIGNwdV9oYXNfdm14X2FwaWNfcmVnX3ZpcnQgJiYNCj4+ICsgICAgICAgICAgICAg
di0+ZG9tYWluLT5hcmNoLmh2bS5hc3Npc3RlZF94YXBpYyApDQo+PiAgICAgICAgICAgICAgIHJl
cy0+YSB8PSBYRU5fSFZNX0NQVUlEX0FQSUNfQUNDRVNTX1ZJUlQ7DQo+PiAgIA0KPj4gICAgICAg
ICAgIC8qDQo+PiBAQCAtMTEyNiw3ICsxMTI3LDggQEAgdm9pZCBjcHVpZF9oeXBlcnZpc29yX2xl
YXZlcyhjb25zdCBzdHJ1Y3QgdmNwdSAqdiwgdWludDMyX3QgbGVhZiwNCj4+ICAgICAgICAgICAg
Ki8NCj4+ICAgICAgICAgICBpZiAoIGNwdV9oYXNfdm14X3ZpcnR1YWxpemVfeDJhcGljX21vZGUg
JiYNCj4+ICAgICAgICAgICAgICAgIGNwdV9oYXNfdm14X2FwaWNfcmVnX3ZpcnQgJiYNCj4+IC0g
ICAgICAgICAgICAgY3B1X2hhc192bXhfdmlydHVhbF9pbnRyX2RlbGl2ZXJ5ICkNCj4+ICsgICAg
ICAgICAgICAgY3B1X2hhc192bXhfdmlydHVhbF9pbnRyX2RlbGl2ZXJ5ICYmDQo+PiArICAgICAg
ICAgICAgIHYtPmRvbWFpbi0+YXJjaC5odm0uYXNzaXN0ZWRfeDJhcGljICkNCj4+ICAgICAgICAg
ICAgICAgcmVzLT5hIHw9IFhFTl9IVk1fQ1BVSURfWDJBUElDX1ZJUlQ7DQo+IA0KPiBTYW1lIHJl
bWFyayBhcyBhYm92ZSAtIGNhbid0IHlvdSBub3cgdXNlIF9qdXN0XyB0aGUgcGVyLWRvbWFpbiBm
aWVsZD8NCj4gSW4gdGhpcyBsYXR0ZXIgb2YgdGhlIHR3byBjYXNlcyB0aGlzIHdvdWxkIHRoZW4g
YWxzbyBtZWFuIGJyaW5naW5nDQo+IHRoZSBDUFUgZmVhdHVyZSBjaGVja3MgaW4gbGluZSB3aXRo
IHdoYXQgdm14X3ZsYXBpY19tc3JfY2hhbmdlZCgpDQo+IGRvZXMgKGFzIGFsc28gcG9pbnRlZCBv
dXQgZm9yIHBhdGNoIDEpLiBBbGJlaXQgaXQgbWlnaHQgYmUgYmVzdCB0bw0KPiBoYXZlIGEgcHJl
cmVxIHBhdGNoIGZpeGluZyB0aGUgaXNzdWUsIHdoaWNoIGNvdWxkIHRoZW4gYmUgYmFja3BvcnRl
ZC4NCj4gDQo+IEphbg0KPiANCj4gDQo=

