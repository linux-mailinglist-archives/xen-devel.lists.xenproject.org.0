Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBB2546B7E
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 19:14:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346597.572448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nziCt-0004On-EK; Fri, 10 Jun 2022 17:13:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346597.572448; Fri, 10 Jun 2022 17:13:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nziCt-0004MK-BK; Fri, 10 Jun 2022 17:13:59 +0000
Received: by outflank-mailman (input) for mailman id 346597;
 Fri, 10 Jun 2022 17:13:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kdog=WR=citrix.com=prvs=1535499d8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nziCs-0004ME-Kv
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 17:13:58 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b551127b-e8e0-11ec-bd2c-47488cf2e6aa;
 Fri, 10 Jun 2022 19:13:57 +0200 (CEST)
Received: from mail-dm6nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Jun 2022 13:13:37 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6700.namprd03.prod.outlook.com (2603:10b6:a03:403::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 10 Jun
 2022 17:13:35 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb%5]) with mapi id 15.20.5314.019; Fri, 10 Jun 2022
 17:13:35 +0000
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
X-Inumbo-ID: b551127b-e8e0-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654881237;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=kaXn05QMKBXI/ngI0e27T2Wi0MpAUBPr6A+3QMcdK7A=;
  b=WlgOv3nqK1ZHnN7KePM3PdOFZGPMuzqR7Kf4HHwUzAo4baUYh1Lf7IVv
   4S+rFPBFAM/AGs8BYctP4w5tuVmpLoq68t929DjCR3CFEC04YPmVe69wV
   6RpnvZ/fBCoGxSJWNCMZKckfHjEJpHePDiTH2mR+r4WvnGi8D20mDNvnC
   U=;
X-IronPort-RemoteIP: 104.47.58.107
X-IronPort-MID: 75891161
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:BbDja69IrReXZQ+u98SADrUD8n+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 GVNXz2HM6mNMDDzed9xPIW2oxhTvZHSmtE1Ggs++Hw8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ44f5fs7Rh2NQw34HhW1jlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnY2IZypuHZTRo8sceCJSD3hMPaMW9qCSdBBTseTLp6HHW13F5qw2SW0TY8gf8OsxBnxS/
 /sFLjxLdgqEm++93LO8TK9rm9gnK87oeogYvxmMzxmAVapgHc+FHvWMvIcHtNszrpkm8fL2T
 swVczdwKj/HZAVCIAw/A5Mihua4wHL4dlW0rXrK+PpmujGNlWSd1pDuMMDUK4eXHPx5oR/Iu
 n7G/0DWWDMFYYn3JT2ttyjEavX0tTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLp3C
 WYZ5y4vpqga71GwQ5/2WBjQiGGAlg4RXZxXCeJS1e2W4q/d4gLcCm1aSDdEMYQirJVvHWNs0
 UKVldT0AzApqKeSVX+W6raTq3W1JDQRKmgBIyQDSGPp/uXenW36tTqXJv4LLUJ/poSocd0s6
 1hmdBQDuog=
IronPort-HdrOrdr: A9a23:3b4vNqFzyPV9b1JqpLqFsZLXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5Vp2RvnhNJICPoqTM2ftW7dySSVxeBZnMbfKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj3Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWnZ4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlXFtyssHfrWG1SYczHgNkHmpDp1L/sqq
 iLn/4UBbU315oWRBDtnfKi4Xi57N9k0Q6e9bbRuwqenSW+fkN6NyMJv/MmTvOSgXBQw+1Uwe
 ZF2XmUuIFQCg6FlCPh58LQXxUvjUasp2E++NRjx0C3fLFuHoO5l7ZvtX+90a1wbh7S+cQiCq
 1jHcvc7PFZfReTaG3YpHBmxJipUm4oFhmLT0AesojNugIm1kxR3g8d3ogSj30A/JUyR91N4P
 nFKL1hkPVLQtUNZaxwCe8dSY+8C3DLQxjLLGWOSG6XX50vKjbIsdr68b817OaldNgBy4Yzgo
 3IVBdCuWs7ayvVeLqzNV1wg2TwqUmGLETQI5tllulEU5XHNcnWGDzGTkwymM29pPhaCtHHWp
 +ISedrP8M=
X-IronPort-AV: E=Sophos;i="5.91,291,1647316800"; 
   d="scan'208";a="75891161"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mPi9rIWJoFbIu4Gh27RHPKdUcyuCNDqpyfHWCuqLiRhxc9AnnkEfO4EEscB7vvo2qOZjF2uUF3LBUQ0E91HgzIYBYI9e+ztuZg76W1jv1iN3PBGc6KyUQ720dX47IKjgLbFtpUKUKqYz5iidjknMj+u9yHaXwx1v5A2FYsfaXTDHeMih7pmt1vUH1D3m7oVMopW/3xhfNU64mZ9i43EJQBKSB3axo3r3wNvEu00hEvYKi9h/vtXFWdt1ORN+ZZS2rso6ioRoipywbAXZevh6s+ZZ+indOtzGSbkYz2bBc8V4zfxTl2jt3ehlrv+EbN5rsa6DJwYL0msNgx6AWpyR0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kaXn05QMKBXI/ngI0e27T2Wi0MpAUBPr6A+3QMcdK7A=;
 b=KSZmZHeztKBDdjvnLXGSyFLkIp6LQUt3K2PufKu25l8dYhEZNl8EiF3ccXJ2R1/Kzar/6J02alc4YbQZ5OOkmvdt8Kc59TtUMTPYmkqsrtNjAq/qo0IShdR7tieVQUjccFg29ZKKFZP6dv3T4n2sGm8k7wL4QUi/R5djPBciEfnpUkthqCBmcIVvkuYmSZkWy78pNrPOe6B8WkV0QdNj974o3g08VTjKw6j6+L/2KYb0+lJW8sekKb++L2rXzIvj92QIo/NMXqClnqzhZcZYqyhvdT+x7iTlwy2FFga7cclkgwRp/57Whi4MiKCrIXHpT0jCV1jmiUhj2VNaSlw6og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kaXn05QMKBXI/ngI0e27T2Wi0MpAUBPr6A+3QMcdK7A=;
 b=eLdDidxVwdNQOe9F5j9w+N8XE83ZyhSF9BVlG9JJ3Ce+AXPfHlLdDmJZVlO41v1/1y/+5YK4i4y7ao4WNQc5oEU/0vttuqxE7r/8pG/5eZx/MySNeqnWcmrcrIcy2ImzkZktNqlFFBu+As689Uqmcvmxqw5zoQjEImHKaLRcOkM=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/spec-ctrl: More MSR_ARCH_CAPS enumerations
Thread-Topic: [PATCH] x86/spec-ctrl: More MSR_ARCH_CAPS enumerations
Thread-Index: AQHYfONZpKeg248Rt0um2v0bci+Cz61I4Q+A
Date: Fri, 10 Jun 2022 17:13:35 +0000
Message-ID: <46e8251f-6a76-a45a-54db-c15a39b2ff68@citrix.com>
References: <20220610160050.24221-1-andrew.cooper3@citrix.com>
In-Reply-To: <20220610160050.24221-1-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bebd0669-cdcf-440a-9e11-08da4b048daf
x-ms-traffictypediagnostic: SJ0PR03MB6700:EE_
x-microsoft-antispam-prvs:
 <SJ0PR03MB670054367BC12513B2078371BAA69@SJ0PR03MB6700.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 NGRgaZfgg66bHbxD2sddLFKxp+folGd+nJPsPU4Qc7L5vC8QdXrwEem+MeB546++GEqoEEvQfP8aL62ayEBLrRV+tAnheiPCJJY6DDFT8LJUsJ0yUEdt5NCZ5o1xy1Lgk5zBU6bLxhLGAzVwiThJo4WpxnwkVt3cQUH9rJv+fFSSgPzxxu3U7Eq13rOqDR2as84CfgtOojL9BR3o+N/FHvZBjGkWgnR+tt293G1HLoXxzhFAg+F/FAoSUJWw+rf0a2J/YyBEFEWtKMGkyVBEAf7VTmP8xYF84JLLpUqvpim6QmVoSPSaFaW0ZXsz28rVIASFcyxfZrkI0D6zgoxbXpI1spl91EAFDWb5Mx9f8AtOsQodcj+Aj8l4NF/XXvcO2S3y9p3i0sDTmSLkYSpxl7B6SIvljWNNUrI6v2EdlXtwevQamA4zEDDGaqitqQ+Sg1NvVhGmsVYr6OGE9UgwGLjEpvrVrvRngkXaRtNrOPCfsHlrEd+mroLWQwh1pxANJbyFwkmbouvpSn1EXNaKboC7+lB3uqtF9wiewXOAaBTl5JrR18d74Oy2klrbk0AZizZ/rRBlhSNSkbuQ6zg7A2KtymjTMl27ue8Ly9tTp9u6CKC1C1GfT1IaVpqAkVRyF919I//pRwkOrkNchJ1BLwVz+VbESd4v2zZOiJ7IS1bczjqN6tLXPEaO1KPPlM6FMn3ZO0WZduj+BaceRHQXOGmKiP5JmWvnnhLThZkpRPcCfWDriYftrqGHSZ6/fV/Ekn8wCL23sb3dFyMMe+Dg4FqYYQSmXtcYlsxYTUubGtZEdbMhBhMyORhVQD86PgZQu3h5KJhZA0buXr4XbIHlZckWrb744s7lk0Hb3xCO380w6An8iHK6+aPcbd1IY5ouaS118WEYD4Z7g18UsTdxrA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(36756003)(83380400001)(53546011)(31696002)(8936002)(86362001)(6506007)(966005)(6916009)(5660300002)(508600001)(122000001)(6486002)(316002)(6512007)(26005)(4744005)(54906003)(82960400001)(2906002)(38100700002)(186003)(38070700005)(8676002)(4326008)(66476007)(64756008)(91956017)(66556008)(76116006)(31686004)(66446008)(66946007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MlpLbERCcVlXaE5kVFRueHJNcnhPczM1TnJ3RW9ONHl1NnBQTnBzdVRtMHZB?=
 =?utf-8?B?S01VSTR6cGFOcXVrRGRDaFEyWjlQaVlpaXk2ME54RGJxYUxXdXFrbVFlUlhM?=
 =?utf-8?B?aml2Sld6R0tEVk1JdVg2Y0VaQ1M1SHpoWnRFUlF5VUdVMmVpSmxWQUhlRWVM?=
 =?utf-8?B?M2FRYllVT3hZalVqcjR4K1NOek5HNGpWb25UYnYvRTVUaEFlTHArMFhDVHFU?=
 =?utf-8?B?a3pwWG1oVGtUaWdqc0p5bzUvTmNROXVndCtHM3RIUWVXR0thL2RtbXZGV0pn?=
 =?utf-8?B?NFROQzYyRTEvL1Rqd0dIaFZtMUh4YlVmRkFlZzJ4ZGtDYUl1Wkx2N2hFL3lZ?=
 =?utf-8?B?RGxDRmhqQmZEUkdLZUNQRWtQVjR3d3lVa0MyVzhacm1tbDVXTVlsVmNtV2lT?=
 =?utf-8?B?QzBIbkZhRXhYWWxzSDdrNWVGZGM3K3U2SWx0RG4zdWs3dGJrVGZNWHFvUkYv?=
 =?utf-8?B?TWtHa3JucUpXVExoaGV0WmluUFZUWGlSWHNacC9KUnlOZGt1eXduNEUzMENw?=
 =?utf-8?B?d09ldHYzanM2alBZSzJFaUl5ckN5QzllbndvNUViLzFJZE9QV2piOHUrS1Ax?=
 =?utf-8?B?bmpmaVFKNUZxVkRuc2s2bUNBckhjcVRZMWhvUmpaOHJCT3B0eld2NlVGenlX?=
 =?utf-8?B?MVcwMkZEU0pLMTZZU2tuZFlrN1NaL21ybk5yRlJGSW9XWTZPeWFkalpwY2hX?=
 =?utf-8?B?VzBLREVXZ2NvQ0JaN2NWNGNYbWZQRzM4TjM4VWFkd0ZPNmZXZXByb0xyWWZE?=
 =?utf-8?B?WnJFVkdCRzJzczlES0NrOGJGMXRnU2RRdjB2RHMzK2gyMDNnaFl3bG50ZEp1?=
 =?utf-8?B?dis3RjB1T3IyNzVpc1BKWmxKbWlVV3QyS0FoektVbVJJYll4RFU0WlE3Q29w?=
 =?utf-8?B?WEpDcUV4WEM5NlVqdVBtOUdIcjcxZldGcmtvYktMNGVBM1IxcnRvRXhUQVpJ?=
 =?utf-8?B?RzdaUUd2MHhUamxOSERKWU12cDhCTHBCMCtlUnZ1bmVqMVVpOWR3MG45M0tt?=
 =?utf-8?B?UEFxenA2QlJYSmMrRERXcGxYWHVsSkNLbkRTR2R6N3gyUnMxekxTSU54aHJS?=
 =?utf-8?B?b3kzQ3VGb1h3Q2l5YThJSVFFdEt1d001VjlrNklja2ZGcFJMVDBtbk9QOG1C?=
 =?utf-8?B?NG9wc1c3TDNIVmw5UTJkMkxJTWs0Z2xVcXJJdG5TZkFsSkpXWjF0amVLdUsx?=
 =?utf-8?B?clo1ZklNazRibktVUU5XeVZpd3JtOE1NWWFBTEkwd0NyS1BGdEN6TGtQaEVi?=
 =?utf-8?B?L25helVEZjJxa3ZRbm4yenlyUzQ5M2VHSDB4YTRiZXhnWkYyN1gzcVA3WjBa?=
 =?utf-8?B?eHNKSllTb2l3LzhSNjZoditJVFZEUENOZ0Y4VmFSZlJQTzdnMFFqM1RTemFR?=
 =?utf-8?B?VmVGUGtvRkJQSXY4bzV2bWZDUkwzQTlDUXQrVDdyUE8rZVNqUTVoRXJ2alEz?=
 =?utf-8?B?Mlo1SUlpTWMxemxWNWwxeS9tV1ZsUnN5ZUxJcm5USDcvSUdTQ3B1OHI3aGsw?=
 =?utf-8?B?ZHhWd2pSWU1EU3pRaGllam9weENJUFVXbzNzRGRRQWZzL0V0TnNMUmFDaG1Z?=
 =?utf-8?B?TG83T3NSUVN6TEFjWlpwNzg1YXAyY0dGMnM2KzBSejBUTWFlMnJBZHhxanVH?=
 =?utf-8?B?bTFNZU5wRkd2aXJ2QjJpUk5oMEdXRWgxZER1ZmJEQ0NsOXdqR3J3UExmR1RL?=
 =?utf-8?B?aWFFSU1BcTVxQU41TVFTaHNYcmE1cHZZeEY1OHVVOC9hb2p4UFZCYUhSWmJh?=
 =?utf-8?B?Wmo3M1Z3RzkvbTZrK2YvZGxBekNrL1U3YmVpYlpibkV3Y1dHMlhmTlJZanFm?=
 =?utf-8?B?eE5wNy9FTWpXRnhsQ3BteEduMlY1WGRXUXZhY0FucFhnTmlRU3hDZXdIeW9P?=
 =?utf-8?B?WkVZakJraktxeVVNZ1ZIR05xSE9oMmpjcjRhMWpWaCtLeWF5SmJZMmNDNlc1?=
 =?utf-8?B?NnZDRVBubWZjRGpiQ05tSXY2dUtjWXlZY21PQTdrOCtKVTZkWkEzZTgwOVpt?=
 =?utf-8?B?RWZSUXZ0ZnRXVmdIU2lxMUlCTVluNy9wazRrbDhsV3pxMTFmMWw1RlR3RC92?=
 =?utf-8?B?ZlJqUGtQMzVHSEsrZ2dkeHAwK0VkcTFOdCtSRUZXZWxCTThRWVVkZXBnUmpr?=
 =?utf-8?B?c0N1N0R6QlNLcUF1Q044TFFmQnlLNDFNSzRNMWgrbFVMcXVsS1lMWmRIUG9G?=
 =?utf-8?B?MlBROUk2MDhPYkxkMnVRT2h4bzBZbG1oa3laQllvWGpYdjhTL1VDVXp3SGZm?=
 =?utf-8?B?dkVZeEdaZ0hlelRndFVmYlV3SGpkczRqWW9yMzFhcUNWKzZuQm5tMWR6dmhn?=
 =?utf-8?B?UDcyK3ZKSENHdHNOMkRabVZZTndzK1dObWgvMzliY01LMGJSVVpsNkhCanh3?=
 =?utf-8?Q?De+aY1I8HgYlpWB8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C8E50B8EF1BA974E87742C216155CA0D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bebd0669-cdcf-440a-9e11-08da4b048daf
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2022 17:13:35.5239
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vVsME6Q3ZK82mntx/l+j/A1NCzK75DfMm89xX9/gmYda5KHquWoJwHGaSLf690gB4Igr5RNaAgTA1lBNFpkciUfGcmEcSjymXRC8cr1jrl4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6700

T24gMTAvMDYvMjAyMiAxNzowMCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gaHR0cHM6Ly93d3cu
aW50ZWwuY29tL2NvbnRlbnQvd3d3L3VzL2VuL2RldmVsb3Blci9hcnRpY2xlcy90ZWNobmljYWwv
c29mdHdhcmUtc2VjdXJpdHktZ3VpZGFuY2UvYmVzdC1wcmFjdGljZXMvZGF0YS1vcGVyYW5kLWlu
ZGVwZW5kZW50LXRpbWluZy1pc2EtZ3VpZGFuY2UuaHRtbA0KPiBodHRwczovL3d3dy5pbnRlbC5j
b20vY29udGVudC93d3cvdXMvZW4vZGV2ZWxvcGVyL2FydGljbGVzL3RlY2huaWNhbC9zb2Z0d2Fy
ZS1zZWN1cml0eS1ndWlkYW5jZS9hZHZpc29yeS1ndWlkYW5jZS9ydW5uaW5nLWF2ZXJhZ2UtcG93
ZXItbGltaXQtZW5lcmd5LXJlcG9ydGluZy5odG1sDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+IC0tLQ0KPiBDQzogSmFuIEJl
dWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPg0KPiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+DQo+IENDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPg0KPiBUaGUgU0RN
IGFsc28gbGlzdHMNCj4NCj4gICAjZGVmaW5lICBBUkNIX0NBUFNfT1ZFUkNMT0NLSU5HX1NUQVRV
UyAgICAgIChfQUMoMSwgVUxMKSA8PCAyMykNCj4NCj4gYnV0IEkndmUgZ290IG5vIGlkZWEgd2hh
dCB0aGlzIGlzLCBub3IgdGhlIGluZGV4IG9mIE1TUl9PVkVSQ0xPQ0tJTkdfU1RBVFVTDQo+IHdo
aWNoIGlzIHRoZSB0aGluZyBhbGxlZ2VkbHkgZW51bWVyYXRlZCBieSB0aGlzLg0KDQoNCkZvdW5k
IGl0LsKgIFRoZXJlJ3MgYW4gT1ZFUntDfUNMT0NLSU5HIHR5cG8gaW4gdGhlIFNETS7CoCBJdCdz
IE1TUiAweDE5NQ0KYW5kIG5ldyBpbiBBbGRlckxha2UgaXQgc2VlbXMuDQoNCn5BbmRyZXcNCg==

