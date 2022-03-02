Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C9A4CAF3E
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 20:59:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282553.481296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPV6Z-0000ls-4s; Wed, 02 Mar 2022 19:57:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282553.481296; Wed, 02 Mar 2022 19:57:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPV6Z-0000iq-1L; Wed, 02 Mar 2022 19:57:47 +0000
Received: by outflank-mailman (input) for mailman id 282553;
 Wed, 02 Mar 2022 19:57:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5HSw=TN=citrix.com=prvs=05368ea7b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nPV6W-0000ik-DE
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 19:57:44 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03933411-9a63-11ec-8539-5f4723681683;
 Wed, 02 Mar 2022 20:57:41 +0100 (CET)
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
X-Inumbo-ID: 03933411-9a63-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646251061;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=5HBJfX/YI4/vonTzojph5TRBFlUVz4e8zsRbbwbPR6Q=;
  b=U8EPnKQKGarEYwcrbdx7rwza2nEa6n1lkmf7dC+woBt301O2SXmT73hD
   iwWlfa7A7IUhPOkCmk1qU3E43o8AY9YwZeCXlMa2lSsTD97k1bXcDhVNg
   aGmxXb55CuX/9+BqdryiBKwv9f2rIKT5Ws7H2aMQ/kCBKdZpRQpOptZ/G
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64794685
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:LF8u6K4sr3evZ9a//ldKsAxRtCXHchMFZxGqfqrLsTDasY5as4F+v
 moeWz2BOquKYTb3eYpzao7g804Oup+AzNRjQVNrr31jHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YPhWVvR0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurShTT8xP7/Uod0MCUdFCnh0PJxcoK3IdC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKs2vH16wC6fJvEhWZ3ZGI3B5MNC3Sd2jcdLdRrbT
 5RFNmszMkSdC/FJEkYaN64/ntuDv3/YdjxkkBWQnYgY22eGmWSd15CyaYGIK7RmX/59jkue4
 27L4Wn9KhUbL8CEjyqI9Gq2ge3Clj+9X5gdfJWn8tZ6jVvVwXYcYDUUX1ampfiyimalRslSb
 UcT/0ITQbMarRLxCIOnBlvh/SDC7kV0t8ds//MS+QW10qvG+z+gFzJaUycYYt0XrpckSml/v
 rOWpO/BCTtqubyTbHuS8LaIsD+/URQowX8+iTwsFlVcvYS6yG0npleWF4s4Tvbp5jHgMWyom
 1i3QD4Ca6L/ZCLh/4Gy5hj5jj2lvfAlpSZlt1yMDgpJAu6UDbNJhrBEC3CGtZ6sz67DFzFtW
 UTofeDEtoji6rnXyUSwrB0lRu3B2hp8GGS0baRTN5cg7S+x3HWoYJpd5jpzTG8wbJpaIGGxO
 B6N4FILjHO2AJdMRfUtC25WI553pZUM6Py/DqyEBjawSsIZmPC7ENFGOhfLgjGFfLkEmqAjI
 5aLGftA/l5BYZmLOAGeHr9HuZdyn3hW7TqKGfjTkkT2uZLDNSX9YepUbzOzghURsfrsTPP9q
 I0EaaNnCnx3DYXDX8Ug2dVLfABScCNiXsieRg4+XrfrHzeK0VoJUpf56bggZ5Zkj+JSkOLJ9
 Wu6QUhW1Bz0gnivFOlAQikLhG/HNXqnkU8GAA==
IronPort-HdrOrdr: A9a23:15tRM6Dycq/OoBLlHegCsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPEfP+UsssHFJo6HkBEEZKUmsuqKdkrNhQYtKOzOW9ldATbsSobcKpgePJ8SQzJ8l6U
 4NSdkcNDS0NykBsS+Y2nj4Lz9D+qj+zEnAv463pB0NLT2CKZsQlDuRYjzrSXGeLzM2YabRYa
 DsgPav0ADQHkj/AP7LZEUtbqzmnZnmhZjmaRkJC1oM8w+Vlw6l77b8Dlyxwgoeeykn+8ZjzU
 H11yjCoomzufCyzRHRk0XJ6Y5NpdfnwtxfQOSRl8kuLCn2gArAXvUjZ1TChkF2nAic0idvrD
 D+mWZmAy210QKWQoiBm2qp5+An6kd215at8y7BvZKpm72HeNtzMbs+uWseSGqC16NohqAN7E
 oAtVjpxqZ/HFfOmj/w6MPPUAwvnk2ooWA6mepWlHBHV5ACAYUh5rD30XklWavoJhiKoLzP0d
 MeeP309bJTaxeXfnrZtm5gzJilWWkyBA6PRgwHttaO2zZbkXhlxw9ArfZv00so5dY4Ud1J9u
 7EOqNnmPVHSdIXd7t0AKMETdGsAmLATBrQOCaZIEjhFqsAJ3XRwqSHqokd9aWvYtgF3ZEykJ
 POXBdRsnMzYVvnDYmU0JhC4nn2MROAtPTWu7ZjDrRCy8/BreDQQF6+oXgV4r6dn8k=
X-IronPort-AV: E=Sophos;i="5.90,150,1643691600"; 
   d="scan'208";a="64794685"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FqFFYSfXJ2RTFFVgjwgPt8jHwTEc+YJHxlV+YLRCITtiq8FngBgcrRAa74KvN8R7CSWTVDhC8AtPcjRy4HWA/SPMhy01a08uer/jeD2ck5MNRm0cFDBwJ4vOfRnqcdneHgur0BNAd+aUk7ZcUqztgF7s9xSX+BeiTdQs+wWdyWg+CT3x5LxMV1qg3yhLXpXTjVAbN20qmq/RHMqCHkPWDAezQmHCD974RA6Do/lJ6ng2BN6fM/lNTr0NbbqhV4ygCDeoGWOqYcv5UXugtPFHUJmw5HOH+WiODirwymHSugG4GWYHnUHQvgckXYQnTYv36kC93pGBi2qIMjDKvrWcyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5HBJfX/YI4/vonTzojph5TRBFlUVz4e8zsRbbwbPR6Q=;
 b=oXRRmP6McKywJlMhD1HWcRlhxhAPHe3HygErfK8AgC7yK+gn4JQFhnDaz5IgY4Vb9Yv0Rlfsk9v3yfbDx6vIncRVoWnKqK2mhSuiQz098vSMZM5Sm/0/K3MAamdFfyYQVXZtVHpJ1rBwQduwCWTgzIhxNPzFwaVf2927ilW9QsT6x+W+brw8ptzH26GVhpXkxDAMW0N7pWf1sEG5yXRO/7iwscClXFc4U/WVK1ni6RhnY/Ppw1/qGrsjqC5QabkLALlv3V+LghZGSA4PkH6+vT654LrDyGSt/WrLw3KrposUlveKHzjlYdWMi4LWYHX+hDHPrrk+5KprrkHpFdoYcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5HBJfX/YI4/vonTzojph5TRBFlUVz4e8zsRbbwbPR6Q=;
 b=Opxd6GWn4Zauuge8NiY0Ri7jv/sifdaAeB1ZPAo+GvjgMTp05u+fTLTuguL+fV+ImH4pj5O3bii8YDcZdeSpOBjt1yu6qiY49tUdqYa5qwrq9ayXPg67u5Gkh0JYKR5tm+8klLsKTsd8Hey9Y3un9isPoPky4bhgviq0bCWVtsA=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2.2 8/7] x86/IOMMU: Use altcall, and
 __initconst_cf_clobber
Thread-Topic: [PATCH v2.2 8/7] x86/IOMMU: Use altcall, and
 __initconst_cf_clobber
Thread-Index: AQHYJ+IV6PtRJY8p5U2wBnUH9jKzdqyj8n0AgAa3aoCAASBXAIAAIhyAgAAGJQCAADOGgIAAabgA
Date: Wed, 2 Mar 2022 19:57:33 +0000
Message-ID: <160eb824-fc30-6d0c-a03f-dda2951aa930@citrix.com>
References: <20220214125632.24563-1-andrew.cooper3@citrix.com>
 <20220222114711.19209-1-andrew.cooper3@citrix.com>
 <e8b71b3a-55a0-31a2-b2ab-3b2470680709@suse.com>
 <5fae516a-17c1-0ce4-c46e-909a83c0e273@citrix.com>
 <60f3c942-3822-87dd-df6e-8b64ed4d17c4@suse.com>
 <e41848a6-9aaa-f0d3-0c81-2e0e4e96a6a4@citrix.com>
 <67ff91f4-e5fe-47d5-fdb8-9a302beb6e2a@suse.com>
 <15868475-0702-c884-143f-366b9d79a255@citrix.com>
In-Reply-To: <15868475-0702-c884-143f-366b9d79a255@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4364fbb7-6541-4156-38cc-08d9fc86e460
x-ms-traffictypediagnostic: BN6PR03MB3202:EE_
x-microsoft-antispam-prvs: <BN6PR03MB3202B3294D9BD01AE253A041BA039@BN6PR03MB3202.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3u0i+42OjFk5JwyOHCbJdR5O01uSeFJPHTzH0qi1/CS2Tc4cK5Cu3Dkd4AueXNaXqXKpm/0zADk63TkNe4cjLz4DUoUj3K7GKFEP3ipBeSUPMGfPAtsn0vJORpiHBogz3a/WEzuU/fmxsov4Daty+JChqds2TPuh+s9eko9M2XGayt+mTj87RgebjZye8OkwSIKi37p8R55eHMruj69Lpr+QlzQTSonLblzn+dGOMf0CINXigkyvF2oFEv2NpzCCNQ/qLFOyfSDSGJvO1g7JUesz0uOXqeOHO9lbyp6QdpqAcekmxd/zDMgQ5fCtc52lEKPPZT5nh0qq+qM6HzWKfigwNTeeh4gNSXHQTVL7XrTf+kqmXwX/wbRMX3o0s8plBcGbb36Q9YIMSQvhG71SSPxrhW2jQDREfSZCBMiooSNlFsDqnC+CpMYmSnMVdcXgaUuibbLZzuKbUl8GZimGTgCP6XvTf1sNmQyx/hAeAAUnEPSydWcTim3v8/Z5ynx0wt1oz65cPpKkTKW20hyjkVitX6w7X0EOGvjsJSBvxWpDJpZaIlJd09sZ/57gJBXyOooz2JhAnLa1FFcjhnXl4voBBT/lG0SKbjb8K1opULzzng0V+Wa687G0zwHkqtQAIiQUvqktyfoElUGhK2C/ib7ZIe9KTcq8VaX6yAsj1T49wIUkPLMM/U5sLCizgH3paHQQOtlUBQmfQ+RithgNOylfWFb2RcqjBSdvv+cALpXdZBb+7x0g4fnxJQhse5up5+QCJCU94TNW3mBBVFDemQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(316002)(82960400001)(122000001)(31686004)(2906002)(8936002)(38100700002)(5660300002)(83380400001)(2616005)(508600001)(38070700005)(6486002)(4326008)(91956017)(66556008)(26005)(6506007)(186003)(31696002)(76116006)(8676002)(86362001)(71200400001)(6512007)(6916009)(53546011)(54906003)(66476007)(66446008)(64756008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1pCdFMyWkdZNXp6dk1RREZVOG9UOUFtbkZNaTFYYXJzSEVpanoycDNLWE1q?=
 =?utf-8?B?WlM1UUpmaThtK3M5KzRFZExod2N3VXVpTnZWMjU4cHJPZFoxRHpDUUlmQ21M?=
 =?utf-8?B?cHBvaUhZbHcrc0IxRHRkaG5hakRlNUJTNzdMYjFuVEFqSlNuSFh6aHVxREtu?=
 =?utf-8?B?S3l6bnd3eGVGSnF2Ym9vVzYrUE1KWG1wY3ZpRGV5dEYyakg4VjJLZG5MSFFI?=
 =?utf-8?B?ODQvYTVQM1gzTHFzOGNsV012OERYaklGRU1JKysrdHJQRHBZRFNsVkovaklC?=
 =?utf-8?B?WmFybTYybmRSREYrc08yaitRRkNPVjB0YWFSZTRJdEpocDI4QlNPMktnZ0N6?=
 =?utf-8?B?ODcxcjhzTWZNeW9Zdjk5ZE91cElvMEZIb0xsQlZEY0hyeVBQUC9JZDBOWWYy?=
 =?utf-8?B?WDJPOVpaMGp1bFdTV2NoYW1tUGdrZGl1OVpvVVdDayswTWxWMWZ5WGhyWUgx?=
 =?utf-8?B?cTZiRWNHZjRabkJ4ZmxKeWZua1lFbHF5M0IzYUVRaGFQSjRnZ2gzbXJJR3F1?=
 =?utf-8?B?bjFkUXZSMUdkd0FqbDN6bjNYM1JRSDAxUG82WkpmYWRZMmxJaWlKMThwK3dR?=
 =?utf-8?B?QjNUc2tMM2pMd0NTTW1EVGMrbnJ2Mnd3TUt3YjF5Mjk3RkpMeE5JTVVHNkU3?=
 =?utf-8?B?bURDMzVNZ0pqYnVBSnNNMzh2b0lHby8xcDZwekhmbTdNZ2tYZGU3SWVvK01M?=
 =?utf-8?B?Z1FtTDIybU9Pb1VGeHVqMHlGbVltajRWS0tSRnhvbnBkUnNTeU9SZHd4eU54?=
 =?utf-8?B?blUzSzVIaFpSUmNMdVROS0ZySlVJdHZFcFBKZHBjaEQyT1dUK3YwdnFCQVpW?=
 =?utf-8?B?ZmVCdU1lcytMalp3R1F4VzU1SDZ1bmc5ZEJMY3JzLzdqNjdXSEc1bmNzaHFV?=
 =?utf-8?B?TUp0VGVaQWpLWHRZSWVrcVhicWdVRE5Vbk1WRzJwT001aUZldlJOU0RXdHp5?=
 =?utf-8?B?azZsQWhpc2had1hFV2FaZWg3REd1VGUzU1kzRkkxalBvaHIxOUJWM1VBZEs2?=
 =?utf-8?B?a2J0THBKVjdxLzNENWprT3JIMGVRamtSVkF5RkJHOGd6Q1FzYmFRSi83MkFN?=
 =?utf-8?B?bUJIby9yU2wwQ2E5RFZDbkY0UVgweU5wVTUraExvTTlNem5GdUdDWlM5cVB6?=
 =?utf-8?B?TWlCR2NVdlF0ZXBuaUxOeG9CMm51UERKTmhPRnNwYXFJYlZEOThXREo5WkRy?=
 =?utf-8?B?RGlVVW9kenIvMmdYeVBJeFg0R1JteGFiRXQzYjdsR1ROVjBkRWxCaWo4UE84?=
 =?utf-8?B?Mi80Q3l3NFNZUVdRVkRIb29uZDFvc2duL0tvUXk1NmVoZ2FkdWl3K0hFdDJt?=
 =?utf-8?B?RnRPL00yNFlyaklhaHE0ditJK0swMTJXUVNaRGJvdGhlWWRvYXJPUGZvZVln?=
 =?utf-8?B?VlJvejZnM2QvVFFZZERZYWpqeGFHV2hlV2JvODE4QjJ6a3RoVnhGZzN3dFpU?=
 =?utf-8?B?V1MxWGc1VE9wamo3TTVzZFdwNFdveERtWXl3WmQxMG5xUDNUeXFjaVBiajY2?=
 =?utf-8?B?RzRzYXBlYkprbEs3WnBPbXIzd2FaMUgrRHhLZVZHclNkRkk0TmtoVE1sMTV2?=
 =?utf-8?B?OWl0UjVOZ0ZlOHhaRHUxRi9rY0NJYmNLVkFkQ1c1b0UvalhUaW51aGZTRERx?=
 =?utf-8?B?Z1ptOHI0UGF1YU50RTZvNXBRc290a0RVWkdFKzVMZC9wSFpTLzV0ZitRSWJl?=
 =?utf-8?B?UVh6WWxjYVA4aHZzcVNac3NoQUFJUFd6b093SDJoRnpjMW4vSDBYUGRtOTI1?=
 =?utf-8?B?MnRDbm1qbDIvVHU4a2t6c0JzbFVuSGtnZUlTRVg3WW11c3dyNktobkEwMVJS?=
 =?utf-8?B?dVgxQzBadWdnTVljZHVXY1dETVkvc1dYQlFoK01BU3dHZkxDcHlDTmNlb3Vi?=
 =?utf-8?B?K3l2TzlCRDZIczNPRVFZQkl3Q0J6VWtaQ2VmRFd0S2laRVhTNUg4K2FYWUR4?=
 =?utf-8?B?TkNZd0xDbFhDb3VlRnJRT2dkMlljMkhra3dLOUlLZzJ0T1gxK0wyZUNXMVRJ?=
 =?utf-8?B?YzhTOGRBcHVnOHpTN0NFZ2dGdnppNndGN2E5TmQ3bEE1Yk1zRXhWNjQraEpS?=
 =?utf-8?B?TFZDdXcyL08zR1BEOS95bGM4cnJUL3crMjRiVVNBS254aTY4eDdVRElzdlF0?=
 =?utf-8?B?dnZ5WlBtWEd0SmxwTDBSV1VwZVFreUtVSzlGc1ZLOVJOL3JldjJuUEJhRjJK?=
 =?utf-8?B?Z210ak1GRWtiWXFYbWhPUFV1dzV6QnBSbElNeDZNQm1LWFhsTmVURFV4U3pq?=
 =?utf-8?B?eVRpWnBHczhEa1hoemVlbFN0RUp3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <93236820C34A00458C8CE349781DBEF8@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4364fbb7-6541-4156-38cc-08d9fc86e460
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2022 19:57:33.4933
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 21L8zkkc+Cf35Pk0XDZn5k66TfmzKfNr8B2DEu8y9AdkGaJ+ibnaTnvDBq5yNHIPYanYMcmsLYet3EfYQgGUUT5SjT/Xp0Sn+fwQUf1k2Kc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB3202
X-OriginatorOrg: citrix.com

T24gMDIvMDMvMjAyMiAxMzozOSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMDIvMDMvMjAy
MiAxMDozNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAwMi4wMy4yMDIyIDExOjEyLCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOg0KPj4+IE9uIDAyLzAzLzIwMjIgMDg6MTAsIEphbiBCZXVsaWNoIHdy
b3RlOg0KPj4+PiBPbiAwMS4wMy4yMDIyIDE1OjU4LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4+
Pj4gT24gMjUvMDIvMjAyMiAwODoyNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4gT24gMjIu
MDIuMjAyMiAxMjo0NywgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+Pj4+Pj4gLS0tIGEveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUuYw0KPj4+Pj4+PiArKysgYi94ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvcGNpX2FtZF9pb21tdS5jDQo+Pj4+Pj4+IEBAIC02Mjgs
NyArNjI4LDcgQEAgc3RhdGljIHZvaWQgY2ZfY2hlY2sgYW1kX2R1bXBfcGFnZV90YWJsZXMoc3Ry
dWN0IGRvbWFpbiAqZCkNCj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGhk
LT5hcmNoLmFtZC5wYWdpbmdfbW9kZSwgMCwgMCk7DQo+Pj4+Pj4+ICB9DQo+Pj4+Pj4+ICANCj4+
Pj4+Pj4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgaW9tbXVfb3BzIF9faW5pdGNvbnN0cmVsIF9pb21t
dV9vcHMgPSB7DQo+Pj4+Pj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGlvbW11X29wcyBfX2luaXRj
b25zdF9jZl9jbG9iYmVyIF9pb21tdV9vcHMgPSB7DQo+Pj4+Pj4gRm9sbG93aW5nIG15IGluaXRj
YWxsIHJlbGF0ZWQgcmVtYXJrIG9uIHg4NidlcyB0aW1lLmMgSSdtIGFmcmFpZCBJIGRvbid0DQo+
Pj4+Pj4gc2VlIGhvdyB0aGlzIGFuZCAuLi4NCj4+Pj4+Pg0KPj4+Pj4+PiBAQCAtMjc5NCw3ICsy
NzkzLDcgQEAgc3RhdGljIGludCBfX2luaXQgY2ZfY2hlY2sgaW50ZWxfaW9tbXVfcXVhcmFudGlu
ZV9pbml0KHN0cnVjdCBkb21haW4gKmQpDQo+Pj4+Pj4+ICAgICAgcmV0dXJuIHJjOw0KPj4+Pj4+
PiAgfQ0KPj4+Pj4+PiAgDQo+Pj4+Pj4+IC1zdGF0aWMgc3RydWN0IGlvbW11X29wcyBfX2luaXRk
YXRhIHZ0ZF9vcHMgPSB7DQo+Pj4+Pj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGlvbW11X29wcyBf
X2luaXRjb25zdF9jZl9jbG9iYmVyIHZ0ZF9vcHMgPSB7DQo+Pj4+Pj4gLi4uIHRoaXMgYWN0dWFs
bHkgd29ya3MuIEJ1dCBJIGd1ZXNzIEkgbXVzdCBiZSBvdmVybG9va2luZyBzb21ldGhpbmcsIGFz
DQo+Pj4+Pj4gSSdtIHN1cmUgdGhhdCB5b3UgZGlkIHRlc3QgdGhlIGNoYW5nZS4NCj4+Pj4+Pg0K
Pj4+Pj4+IEJvdGggb3BzIHN0cnVjdHVyZXMgcmVmZXJlbmNlIGEgZnVuY3Rpb24sIHRocm91Z2gg
LmFkanVzdF9pcnFfYWZmaW5pdGllcywNCj4+Pj4+PiB3aGljaCBpc24ndCBfX2luaXQgYnV0IHdo
aWNoIGlzIHVzZWQgKGJlc2lkZXMgaGVyZSkgZm9yIGFuIGluaXRjYWxsLiBXaXRoDQo+Pj4+Pj4g
dGhlIEVOREJSIHJlbW92ZWQgYnkgdGhlIHRpbWUgaW5pdGNhbGxzIGFyZSBydW4sIHRoZXNlIHNo
b3VsZCBjYXVzZSAjQ1AuDQo+Pj4+PiBUaGlzIGRvZXNuJ3QgZXhwbG9kZSBiZWNhdXNlIHRoZSBp
bmRpcmVjdCBjYWxscyBhcmUgcmVzb2x2ZWQgdG8gZGlyZWN0DQo+Pj4+PiBjYWxscyBiZWZvcmUg
dGhlIEVOREJSJ3MgYXJlIGNsb2JiZXJlZCB0byBOT1A0Lg0KPj4+PiBJJ20gYWZyYWlkIEkgZG9u
J3QgdW5kZXJzdGFuZDogVGhlIHByb2JsZW1hdGljIGNhbGwgaXMgaW4gZG9faW5pdGNhbGxzKCk6
DQo+Pj4+DQo+Pj4+ICAgICBmb3IgKCBjYWxsID0gX19wcmVzbXBfaW5pdGNhbGxfZW5kOyBjYWxs
IDwgX19pbml0Y2FsbF9lbmQ7IGNhbGwrKyApDQo+Pj4+ICAgICAgICAgKCpjYWxsKSgpOw0KPj4+
Pg0KPj4+PiBJIGRvbid0IHNlZSBob3cgdGhpcyBjb3VsZCBiZSBjb252ZXJ0ZWQgdG8gYSBkaXJl
Y3QgY2FsbC4NCj4+PiBPaC7CoCBpb3ZfYWRqdXN0X2lycV9hZmZpbml0aWVzKCkncyBkb3VibGUg
dXNlIGlzIGhpZGluZyBoZXJlLg0KPj4+DQo+Pj4gVGhlIHNhZmV0eSBydWxlIGZvciBjZl9jbG9i
YmVyIGlzIHRoYXQgdGhlcmUgbXVzdCBub3QgYmUgYW55DQo+Pj4gbm9uLWFsdC1jYWxsZWQgY2Fs
bGVycy7CoCBXZSBuZWVkIHRvIGZpeCBpdDoNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jDQo+Pj4gYi94ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jDQo+Pj4gaW5kZXggNjU3YzdmNjE5YTUxLi5iMWFmNTA4
NWVmZGEgMTAwNjQ0DQo+Pj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11
X2luaXQuYw0KPj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0
LmMNCj4+PiBAQCAtODMxLDcgKzgzMSwxMiBAQCBpbnQgY2ZfY2hlY2sgaW92X2FkanVzdF9pcnFf
YWZmaW5pdGllcyh2b2lkKQ0KPj4+IMKgDQo+Pj4gwqDCoMKgwqAgcmV0dXJuIDA7DQo+Pj4gwqB9
DQo+Pj4gLV9faW5pdGNhbGwoaW92X2FkanVzdF9pcnFfYWZmaW5pdGllcyk7DQo+Pj4gKw0KPj4+
ICtpbnQgY2ZfY2hlY2sgX19pbml0IGluaXRjYWxsX2lvdl9hZGp1c3RfaXJxX2FmZmluaXRpZXMo
dm9pZCkNCj4+PiArew0KPj4+ICvCoMKgwqAgcmV0dXJuIGlvbW11X2NhbGwoJmlvbW11X29wcywg
YWRqdXN0X2lycV9hZmZpbml0aWVzKTsNCj4+PiArfQ0KPj4+ICtfX2luaXRjYWxsKGluaXRjYWxs
X2lvdl9hZGp1c3RfaXJxX2FmZmluaXRpZXMpOw0KPj4+IMKgDQo+Pj4gwqAvKg0KPj4+IMKgICog
RmFtaWx5MTVoIE1vZGVsIDEwaC0xZmggZXJyYXR1bSA3NDYgKElPTU1VIExvZ2dpbmcgTWF5IFN0
YWxsDQo+Pj4gVHJhbnNsYXRpb25zKQ0KPj4+DQo+Pj4NCj4+Pj4gQWZhaWNzIG9ubHkgcHJlLVNN
UCBpbml0Y2FsbHMgYXJlIHNhZmUgaW4gdGhpcyByZWdhcmQ6IGRvX3ByZXNtcF9pbml0Y2FsbHMo
KQ0KPj4+PiBpcyBjYWxsZWQgaW1tZWRpYXRlbHkgYWhlYWQgb2YgYWx0ZXJuYXRpdmVfYnJhbmNo
ZXMoKS4NCj4+Pj4NCj4+Pj4gSXNuJ3QgdGhpcyAocHJldmlvdXNseT8pIHdvcmtpbmcgcmVsYXRl
ZCB0byB5b3VyICJ4ODYvc3BlYy1jdHJsOiBEaXNhYmxlDQo+Pj4+IHJldHBvbGluZXMgd2l0aCBD
RVQtSUJUIj8NCj4+PiBOby7CoCBJdCdzIGJlY2F1c2UgQU1EIENQVXMgZG9uJ3QgaGF2ZSBDRVQt
SUJUIGF0IHRoaXMganVuY3R1cmUsIGFuZCB3aWxsDQo+Pj4gbmV2ZXIgZW5jb3VudGVyIGEgZmF1
bHRpbmcgc2l0dWF0aW9uLg0KPj4gSSdtIHN0aWxsIGxvc3QuIEFuIGV4YWN0bHkgbWF0Y2hpbmcg
Y29uc3RydWN0IGV4aXN0cyBpbiBWVC1kIGNvZGUgKGFuZA0KPj4gbXkgaW5pdGlhbCBjb21tZW50
IGFsc28gd2FzIG9uIFZULWQpLiBUaGUgQU1EIG9uZSBpcyBhY3R1YWxseSBhIGNsb25lDQo+PiBv
ZiB0aGF0IG11Y2ggb2xkZXIgb25lLiBUaGUgaW5pdGNhbGwgcmVhbGx5IHdhbnRzIHRvIG1vdmUg
dG8gdmVuZG9yDQo+PiBpbmRlcGVuZGVudCBjb2RlLCBidXQgSSdkIHN0aWxsIGxpa2UgdG8gdW5k
ZXJzdGFuZCB3aHkgbm8gZmF1bHQgd2FzDQo+PiBldmVyIG9ic2VydmVkLg0KPiBMb3ZlbHkuwqAg
SXQncyBnb3QgYSB2dGQgaW5maXggd2hpY2ggaXMgd2h5IGl0IGVzY2FwZWQgbXkgZ3JlcC4NCj4N
Cj4gQW5kIHllcywgSSByZWFsbHkgd291bGQgZXhwZWN0IHRoYXQgdG8gZXhwbG9kZSBvbiBteSB0
ZXN0IHN5c3RlbS4uLg0KDQpBbmQgdGhlIGFuc3dlciBpcyB0aGF0IHRoZSBsaW5rZXIgc2NyaXB0
IGNvbGxlY3RzIC5pbml0LnJvZGF0YS4qIGFoZWFkDQpvZiB0aGUgZGVkaWNhdGVkIC5pbml0LnJv
ZGF0YS5jZl9jbG9iYmVyIHNlY3Rpb24uDQoNCk1lYW5pbmcgdGhhdCBfX2luaXRkYXRhX2NmX2Ns
b2JiZXIgd29ya3MgYXMgZXhwZWN0ZWQgYnV0DQpfX2luaXRjb25zdF9jZl9jbG9iYmVyIGlzIGEg
bm8tb3AuDQoNCn5BbmRyZXcNCg==

