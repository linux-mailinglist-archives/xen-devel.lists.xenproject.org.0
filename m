Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CF6575180
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 17:13:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367704.598811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oC0WW-0001yn-Ht; Thu, 14 Jul 2022 15:13:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367704.598811; Thu, 14 Jul 2022 15:13:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oC0WW-0001wz-EN; Thu, 14 Jul 2022 15:13:04 +0000
Received: by outflank-mailman (input) for mailman id 367704;
 Thu, 14 Jul 2022 15:13:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4joA=XT=citrix.com=prvs=1872ec3d0=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oC0WV-0001wt-0H
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 15:13:03 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71e97a22-0387-11ed-924f-1f966e50362f;
 Thu, 14 Jul 2022 17:13:00 +0200 (CEST)
Received: from mail-dm6nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Jul 2022 11:12:44 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB6345.namprd03.prod.outlook.com (2603:10b6:303:11c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Thu, 14 Jul
 2022 15:12:42 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5417.026; Thu, 14 Jul 2022
 15:12:42 +0000
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
X-Inumbo-ID: 71e97a22-0387-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657811580;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ejx7DBOsXgOaWVhhUyyVAc+3MJQWQ8erEiFWaoGlSKA=;
  b=ICjwn0SvQ+wS+XLOezPdcpuX7KRm7inQPcC+ly1evxJo9iKFW6wgiU22
   PJ7a/SJDdb1CLt+//D5tHr1Ttu171ynQZtIQHPwHbgZ47h3Uak+VhAFme
   nEduV9slylDV2qeLEDrj6o6HwoRqqWYxr9Oc+AthkWA0xY15hXJ66Slng
   Q=;
X-IronPort-RemoteIP: 104.47.57.176
X-IronPort-MID: 75805300
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:KVFyq6vjBq3/6bnpKhlSOj9ZQ+fnVBdeMUV32f8akzHdYApBsoF/q
 tZmKTyPMqzcZjSjL98lO42yp0JUv5bSz95gG1Br/ChnQ35D+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYzh8B56r8ks15qyt4W9A5DTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05FYoY9+FuAVBUz
 O4FDQ5QTgmOtcCJxr3uH4GAhux7RCXqFKU2nyg5iB38U7MhS52FRLjW79hF2jt2ntpJAfvVe
 8seb3xocQjEZBpMfFwQDfrSns/x3iW5L2Ie9Q3T/PVpi4TQ5FUZPLzFGdzZYNGVA+5SmV6Vv
 Dnu9GXlGBAKcteYzFJp91rz27+XwHijAOr+EpWX//5gn0OV1FUpDU01WkeJudSyg2uHDoc3x
 0s8v3BGQbIJ3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsaiNKYZoIvck9SDguy
 3eAhdavDjtq2JWQQG6d97qJ6y+7IzIcKUcafygYSg0A6tjn5oo0i3rnTNxuDaq0hd3dAizrz
 naBqy1Wr7cOic8G0Y2r8FaBhCijzrDSVRI87AjTWmOj7yt6aZSjaoju7kLUhd5fKK6JQ1/Hu
 2IL8+C04foSF5iLmGqoSf8UAbCyz/+fNXvXhlsHN7ks8S68vUGqe4946St7YkxuN64sfDbza
 wnOvwxc/5RTPXi2dodpap68EIIk18Dd+c/NU/nVap9CZ8Z3fQrepSV2PxfPgSbqjVQmlrw5N
 dGDa8GwAH0GCKNhij2rW+Ma1rxtzSc7rY/Oea3GI92c+eL2TBaopX0taQTmgjwRhE9cnDjoz
 g==
IronPort-HdrOrdr: A9a23:fiktPq0DPIJdnc3CjeE6AQqjBRFyeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4uxpOMG7MBDhHQYc2/hdAV7QZnidhILOFvAv0WKC+UyrJ8SazIJgPM
 hbAs9D4bHLbGSSyPyKmDVQcOxQj+VvkprY49s2pk0FJW4FV0gj1XYBNu/xKDwVeOAyP+tcKH
 Pq3Lsjm9PPQxQqR/X+IkNAc/nIptXNmp6jSwUBHQQb5A6Hii7twKLmEjCDty1uEg9n8PMHyy
 zoggb57qKsv7WQ0RnHzVLe6JxQhZ/I1sZDPsqRkcIYQw+cyjpAJb4RGIFqjgpF5d1H22xa1O
 UkZC1QePib3kmhPF1dZyGdnTUIngxeskMKgmXo/EcL6faJOA7STfAxy76xOyGplXbJ9rtHod
 129nPcuJxNARzamiPho9DOShFxj0Kx5WEviOgJkhVkIMIjgZJq3PsiFXluYeE9NTO/7JpiHP
 hlDcna6voTeVSGb2rBtm0qxNC3RHw8EhqPX0BH46WuonNrtWE8y1FdyN0Un38G+p54Q55Y5/
 7cOqAtkL1VVMcZYa90Ge9ES8qqDW7GRw7KLQupUBzaPbBCP2iIp4/84b0z6u3vcJsUzIEqkJ
 CES19cvX5aQTObNSRP5uw/zvngehTMYd228LAu23FQgMyOeJP7dSueVVspj8ys5/0CH8yzYY
 fABK5r
X-IronPort-AV: E=Sophos;i="5.92,271,1650945600"; 
   d="scan'208";a="75805300"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AX+Qp8bxuHBvrAEOBrFYfNDTG3bfkCW5PAym2T08d7xp5gFuk0/Sd6cXdYJxMeiHYfXpOnusVyDSUKo0WaBcdNI07XqeSs7noRrV927vBur5OmadAqtQlwsm3k9qxmbueHKCO6LCtS9Gb/kgh26KTDHQTGZhZ+YpSg+iVqabJGqzqdMLRy2CB4Kwkui5FgUv+qIox2reofIzkDSXVGpXmrlaGuM0Wue4hAPlzpykFiNmZRt4ahsXjaxjXWPF2Lli8gmn9ajJQtyHCCsklvJqFKxLM1wJFd8ZnxiTKlCPMujwhVIssMzMO5iLMndjG7W57i3xdUTKf0j3gseEME5HSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ejx7DBOsXgOaWVhhUyyVAc+3MJQWQ8erEiFWaoGlSKA=;
 b=BdWg+8OKJvKlq748QbI0db6xOwK1qVMDl0pcdULa1Qz84JDYVQt9SebL+9w4gAbxWHWBAjoXfyAxSjnSHcCHYn0xVYfnfXb4UPo3b6y8b3a7FLw0k25nw7Awue6OG4/KZRPpgtYP7wCj5E76jEZq6BvUdBkHxCVfJJ3ltkUmP5L38SiUoAs+pArbj1J7W/hyKtyOf0GB7os6bkGASeFcYKYJMKbpW0I3UjlQ6DR5j28D5T4eSQaCBpPTFuDh6CqNbo46b4Z0oUTdCD6T6YODFP2tI/FzmNvGbw+LUMHnxZkSh36E8joa59xryodbo3Fp7tA5i2qXkXQEQw4BNfSw5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejx7DBOsXgOaWVhhUyyVAc+3MJQWQ8erEiFWaoGlSKA=;
 b=XsJJlaC6G1aZZPJ+TuTbD4xByYhc+tHyBFnvOQUh+tgpomllakuj1Csodru5wErp2izD0op2tFGUh7HCxsGVvQg0CEkpm8akFUw4MWI+TxQql1zdznB2h2j2XChCMpxMDpWrmX/LTomBpQeis2V+8OjyA58KRjXs0JjReEGSNj4=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Mathieu Tarral
	<mathieu.tarral@protonmail.com>, George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Henry Wang <Henry.Wang@arm.com>,
	"marc.ungeschikts@vates.fr" <marc.ungeschikts@vates.fr>
Subject: Re: [XEN PATCH 1/2] xen: Fix check-endbr with mawk
Thread-Topic: [XEN PATCH 1/2] xen: Fix check-endbr with mawk
Thread-Index: AQHYl4+Dg7FHxwiGFEGkNOu8rM/Cw619+TQA
Date: Thu, 14 Jul 2022 15:12:42 +0000
Message-ID: <c62efff7-7817-9d17-ac30-04957f14d4a2@citrix.com>
References: <20220714143907.25938-1-anthony.perard@citrix.com>
 <20220714143907.25938-2-anthony.perard@citrix.com>
In-Reply-To: <20220714143907.25938-2-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e5fd53e8-279e-4008-2f0c-08da65ab4c7b
x-ms-traffictypediagnostic: MW4PR03MB6345:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 GL1F9n1oboE6eEJo02+blVNhQ/doApM+IObKhBN9XmebHszymft5VR6lICruArgz9JBLIkgRhr6fJVb8Y9FdE+giadJuGKWa1dZiIc1+ydC/0AvOsF7i24y1rLGMDiIQLZLPtQ9QdRDdJjuyy1jQRns3C2Yez7M2D24DdGymEgr3pYoF5CnjpkWJuIpqGHoszdN20slwt8nR5gVH+UZGUK3g242SMRpSHdDn2PqK1JO4zFnZbjA4h5eoGmxw0g9hnbieR1tni+xma0D+Lg3TF1mob30/gSrLKzR0y2tkEG+IctH4CDh+3/J/UgBbYteSyovAVXzFOFI/Fx68cHeNI20Z9ZcyX2InxscYNGu8UIdNRcJEfK7iJQHcXM8wpIOp79BK6h2p3kOOxW3wMEitBjErqjIgYMgCx0WmIMD4WrA3H29uT+P6Pvk88+PbUnAgo+N11+VAovPIVhBjMw0XhNELfPj0E2BGSqnvTl8gyGuuDERYRC+Sl2KURaGALRf/PClJ7B7PO1lKPnH0d+kuefQY9jPShOAN8Bb7xbFq+hFQnm204Zd2DmB+hxN1ai3z4gNSTOt/OJ9hO52KxVtpnKW8nH3If0IBVUwhpoemHem6pNT3v6ZPMI7BoXEnwQnuraYnM40Xv+Fyy9Hdhzg+eFDZK25inVMPk7KzgNS8IgJgrQ5wQzQHxHpwc570pchAnELN6bozadVeaSvin+CUEAas6kOFThxbaZtyw7GQbbVRIgNbj2MjP/biuaxM6sEUXFpyzzm+Gv4mxT6rWp4FfSz5w2Rs0DpAFw3cLBVGwitNUXtCLgNtI9A3Hg9hODvwvrv8Wq6Pbigku3eH+wKis5iXnG/eOnJAtiJ3m2JyCiaXr7H0ABeuLU0hTH0VgbrwIaxJVy7grlaptMYuFqtwE1h07dwVkIvVyncVdQ7hLKY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(478600001)(64756008)(41300700001)(2906002)(4326008)(66556008)(966005)(110136005)(38100700002)(71200400001)(8676002)(66946007)(54906003)(31696002)(6512007)(316002)(6506007)(36756003)(76116006)(91956017)(26005)(6486002)(66476007)(66446008)(38070700005)(53546011)(2616005)(7416002)(31686004)(82960400001)(5660300002)(122000001)(186003)(86362001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YmNGdlZZUzY3Y3Z3VklxVEJqOGFONzRITFhucGwydHBJL1I5d1Z0MWNjZkMy?=
 =?utf-8?B?NmpXcWpLcXVySDJlQTkvTGpuV25kVldFYmMyTkc4SEhiUWFZTUplVTA2YUll?=
 =?utf-8?B?dnNjbDNIWExzdXBvVm5mNXlWS01QZVRpZWtBa2RhbUVlSmxEcHJMMHhGRUlP?=
 =?utf-8?B?aHd4d0NjUTNwaWhuUWRFNGtuUDc3dlFKNGZZWm0vWHFKOTBDTDFIOHVyOTRP?=
 =?utf-8?B?YjdwczZuOENjN2JtQXpScDMrdmhldVhoOC9HRVVvTEtvbGhHQ1FuV3BqOVgr?=
 =?utf-8?B?Uk9ZUXF0dmJXZnIwSlJ1K0VidGZ0OFZXTTdDYUdPTm02K2F3V0Z2eEhod1FI?=
 =?utf-8?B?SGJwNVp4UXAxcUMxZFFob3pOWTM3c2t2VHFXTlQ0YkpwUzV5UDdQMldqQWFG?=
 =?utf-8?B?MjM0cXEybmUxd1V0dFFkblN4NGNHaTJTRVZnaWU5Z0t1SFZ5cHkyMmxTR1RR?=
 =?utf-8?B?QUlHbU5mckpHZzJXUjBBTXNhQ29hWFlvWnphVURPeTUwNWlmZkFGUEhjRnZi?=
 =?utf-8?B?dk4wRU14V1IxYk1kQ3lWK2xnWmtNWXRhbHlsOWxDeWJmTStOaW9CR05MUWFo?=
 =?utf-8?B?Njk0dlZkaHZEY3BHWkgxVSsyc0g5eCtFcjdPWU1KNjNISmZjQ3p6U1U0MDR2?=
 =?utf-8?B?ZjNMckZlZmwySy9MYzB0YVVJY2xlTHdzZ2oxUGdsV2hWRzRZSGFCN041OWRJ?=
 =?utf-8?B?Tm84MVBXSm9GZ0M2Z1cxek5sWXc4ZkNEVzViOEVvbnNlbEMrMGhoRk9Tb3Fh?=
 =?utf-8?B?L3J6S2hKMFhQMC9UNmVic1Y3TmNmbEQreGlERW9qcFdzK3kwSG5FVmJYbUhG?=
 =?utf-8?B?VFBZLzFMd1hSOWFjSityWWZGdlQ0cFVRYk10RU1kNFZIdjRISFJ4czh6d3Fq?=
 =?utf-8?B?Q1hjbGVhZVBQOXRDYkFJOU56OExtSzNJS2lpam9TR3FlWEVjUGFlSlJxZllt?=
 =?utf-8?B?Ym8vb1UvejduNDd2Q0FFc0RXU2l3NlNnRW4yUUJhZDcxdFUxQUNsUHZrMDIr?=
 =?utf-8?B?aEdTbXcyYjlkaW12OFZtNFA0cTNNb0VDa1dnT3Voa2VvZi82ZFF1dG5sNktv?=
 =?utf-8?B?citMQzl4NXhDbkhWc2FBSEswYlJ4VjJ2UmkzOGF3WURPa2V4TnMwYlJrWEFV?=
 =?utf-8?B?K0RpaVJpOFFkTUxtVjdmQ2ZGa3BXajJtc1hMUXlHNjd0ZTh2OFUxQ2F0ZWhX?=
 =?utf-8?B?UVdYMWtOOGhpTENxdm51Yldva05JWmYwWDlnKy9EK3FPQW80M3BSRm9oNS9o?=
 =?utf-8?B?bnh2aCtpL0JaTTVvSkZaZVNESkpOLzBsTGprdjV5bWNtSS9ySlZuenRKOU9M?=
 =?utf-8?B?YzI2WE41bnp3SkxtSCtzOU9jQXhwNnJlcEpTeUhXaUZGVEZqN2dSWnpzaUcw?=
 =?utf-8?B?dGlsVnNGUklSdlFvd2RmeEVVRFFURVMxZWhSV3ZiaGVKVjlDNGt2WFUvUlFH?=
 =?utf-8?B?N05odlppcGlCeG96TVc0bkNUdVBabXh4Zis2NXgrWFBPOGt0UUxiUXdTWUNO?=
 =?utf-8?B?TXZETU12TXRXM2Mwc1U3a3loZDV0ckNEUmZsTlQwN09mbHRuMXlTcFE2VUxr?=
 =?utf-8?B?dmhJbmlvSFliRUJwL09xSWpydmQ4ZUxuMEJNZVZlWXFVd2p5MEZ3R3grZ0xr?=
 =?utf-8?B?b2JrSThLS1kyMWR3TGVyazRKZVRLZWdtT3hiQURhZkNuV2FTK3JuTEpqdDFN?=
 =?utf-8?B?bS9PY2RFZ2xKM3VPVlFNbE5pc1B2UTM5ZmQreXRvRENCNFVldGs4eFFHb09s?=
 =?utf-8?B?SFVnRlVkamNJVWdlRHpqYldWQnptTTVUWFNSaEhhQlpxb0pWWEhKNWZ0cFRY?=
 =?utf-8?B?cWc2cFlIR2xDazlTdFlsbHFLaG1lMml3Uy91NGJ4c3h2cVorYVJqemttczBH?=
 =?utf-8?B?R1NzMkRkc2lLamovdGRLUEltejRhOE41dWlIa2M2dEFiWEF4MjFaM1NiSy96?=
 =?utf-8?B?Y3RlSGRsQ3RGMGRJaFI0RDNOQkU5VGJvU1FhLzB6Tk1IRHlTT0g0eXJTOHhL?=
 =?utf-8?B?VU5SSk02cmlKQ2REVzQyVjhENFNubE42dk1hY01tMUx3NWd4U1lYYXFWOVlC?=
 =?utf-8?B?bktoQ2dCVmptbjJWK0lmY1NXWTJjc0NmRHphTVY0ejZBby9JKy95U0E1dkhU?=
 =?utf-8?Q?bSG+Q4j4iOFVQ/dFS1GmAKbt/?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F65576C17E37B64584328F539EA5758C@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5fd53e8-279e-4008-2f0c-08da65ab4c7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2022 15:12:42.3144
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Dwlqr5s+rfhSf83NYN1EEvkvd5JLAQc92ThImy0cjRcXj0jznJrEVs0PBaoboWm5lL1c5OLVRnem+LQGVpeWLh6eKsQ2HIQabwMBx9H8oA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6345

T24gMTQvMDcvMjAyMiAxNTozOSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+IGNoZWNrLWVuZGJy
LnNoIHdvcmtzIHdlbGwgd2l0aCBnYXdrLCBidXQgZmFpbHMgd2l0aCBtYXdrLiBUaGUgcHJvZHVj
ZWQNCj4gJEFMTCBmaWxlIGlzIHNtYWxsZXIsIGl0IGlzIG1pc3NpbmcgMHgkdm1hX2xvIG9uIGV2
ZXJ5IGxpbmUuIE9uIG1hd2ssDQo+IGludCgweDJBKSBqdXN0IHByb2R1Y2UgMCwgaW5zdGVhZCBv
ZiB0aGUgZXhwZWN0ZWQgdmFsdWUuDQo+DQo+IFRoZSB1c2Ugb2YgaGV4YWRlY2ltYWwtY29uc3Rh
bnQgaW4gYXdrIGlzIGFuIG9wdGlvbmFsIHBhcnQgb2YgdGhlDQo+IHBvc2l4IHNwZWMsIGFuZCBt
YXdrIGRvZXNuJ3Qgc2VlbXMgdG8gaW1wbGVtZW50ZWQuDQo+DQo+IFRoZXJlIGlzIGEgd2F5IHRv
IGNvbnZlcnQgYW4gaGV4YWRlY2ltYWwgdG8gYSBudW1iZXIgYmUgcHV0dGluZyBpdCBpbg0KPiBh
IHN0cmluZywgYW5kIGF3ayBhcyBJIHVuZGVyc3RhbmQgaXMgc3VwcG9zZWQgdG8gdXNlIHN0cnRv
ZCgpIHRvDQo+IGNvbnZlcnQgdGhlIHN0cmluZyB0byBhIG51bWJlciB3aGVuIG5lZWRlZC4gVGhl
IGV4cHJlc3Npb24NCj4gJ2ludCgiMHgxNSIpICsgMjEnIHdvdWxkIHByb2R1Y2UgdGhlIGV4cGVj
dGVkIHZhbHVlIGluIGBtYXdrYCBidXQgbm93DQo+IGBnYXdrYCB3b24ndCBjb252ZXJ0IHRoZSBz
dHJpbmcgdG8gYSBudW1iZXIgdW5sZXNzIHdlIHVzZSB0aGUgb3B0aW9uDQo+ICItLW5vbi1kZWNp
bWFsLWRhdGEiLg0KPg0KPiBTbyBsZXQncyBjb252ZXJ0IHRoZSBoZXhhZGVjaW1hbCBudW1iZXIg
YmVmb3JlIHVzaW5nIGl0IGluIHRoZSBhd2sNCj4gc2NyaXB0LiBUaGUgc2hlbGwgYXMgbm8gaXNz
dWUgd2l0aCBkZWFsaW5nIHdpdGggaGV4YWRlY2ltYWwtY29uc3RhbnQNCj4gc28gd2UnbGwgc2lt
cGx5IHVzZSB0aGUgZXhwcmVzc2lvbiAiJCgoIDB4MTUgKSkiIHRvIGNvbnZlcnQgdGhlIHZhbHVl
DQo+IGJlZm9yZSB1c2luZyBpdCBpbiBhd2suDQo+DQo+IEZpeGVzOiA0ZDAzNzQyNWRjICgieDg2
OiBCdWlsZCBjaGVjayBmb3IgZW1iZWRkZWQgZW5kYnI2NCBpbnN0cnVjdGlvbnMiKQ0KPiBSZXBv
cnRlZC1ieTogTHVjYSBGYW5jZWxsdSA8THVjYS5GYW5jZWxsdUBhcm0uY29tPg0KPiBSZXBvcnRl
ZC1ieTogTWF0aGlldSBUYXJyYWwgPG1hdGhpZXUudGFycmFsQHByb3Rvbm1haWwuY29tPg0KPiBT
aWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4N
Cg0KVGhhbmtzIGZvciBkb2luZyB0aGlzLsKgIFlvdSBiZWF0IG1lIHRvIGl0Lg0KDQpPbiBwb2xp
Y3kgZmlyc3QsIHdlIGhhdmUgaHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0L3hlbi8tL2lz
c3Vlcy8yNg0Kb3BlbiBmb3IgdHJhY2tpbmcgdGhpcyBidWcuDQoNCldlIHNob3VsZCBjb25zaWRl
ciBoYXZpbmcNCg0KUmVzb2x2ZXMgeGVuLXByb2plY3QveGVuIzI2DQoNCmluIG91ciBsaXN0IG9m
IHRhZ3MsIHNvIEdpdGxhYiBjYW4gcHJvcGVybHkgY3Jvc3MtcmVmZXJlbmNlIHRoaXMgZml4LsKg
DQooSSB3b25kZXIgaWYgUmVzb2x2ZXM6IHdvcmtzLi4uKQ0KDQpodHRwczovL2RvY3MuZ2l0bGFi
LmNvbS9lZS91c2VyL3Byb2plY3QvaXNzdWVzL21hbmFnaW5nX2lzc3Vlcy5odG1sI2Nsb3Npbmct
aXNzdWVzLWF1dG9tYXRpY2FsbHkNCmlzIHRoZSBmdWxsIGxpc3Qgb2YgcGF0dGVybnMgYXZhaWxh
YmxlLCBidXQgSSB0aGluayB3ZSB3YW50IHRvIGtlZXANCkZpeGVzOiBmb3IgaXQncyBjdXJyZW50
IG1lYW5pbmcuDQoNCg0KSSBhbHNvIHdhbnQgdG8gd2FpdCBmb3IgdGhlIHBhdGNoZXcgQ0kgcnVu
IHRvIGNvbXBsZXRlIGJlY2F1c2Ugd2UndmUgZ290DQpzZXZlcmFsIGJ1aWxkIGVudmlyb25tZW50
cyB3aGljaCBoYXZlIGJlZW4gYSBmZXJ0aWxlIHNvdXJjZSBvZiBzaGVsbA0KcmVsYXRlZCBidWdz
Lg0KDQp+QW5kcmV3DQo=

