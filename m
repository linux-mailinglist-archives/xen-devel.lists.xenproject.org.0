Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF4E5337A7
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 09:47:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336920.561365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntlja-00089V-8E; Wed, 25 May 2022 07:47:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336920.561365; Wed, 25 May 2022 07:47:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntlja-00087Z-49; Wed, 25 May 2022 07:47:10 +0000
Received: by outflank-mailman (input) for mailman id 336920;
 Wed, 25 May 2022 07:47:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x7Hr=WB=citrix.com=prvs=137588b7b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ntljZ-0007Wh-6n
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 07:47:09 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfd6fda8-dbfe-11ec-837f-e5687231ffcc;
 Wed, 25 May 2022 09:47:08 +0200 (CEST)
Received: from mail-mw2nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 May 2022 03:47:05 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BYAPR03MB4597.namprd03.prod.outlook.com (2603:10b6:a03:12c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.18; Wed, 25 May
 2022 07:47:04 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.023; Wed, 25 May 2022
 07:47:03 +0000
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
X-Inumbo-ID: dfd6fda8-dbfe-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653464827;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=hS4YLAXu/RTpGVjZ78b7M85S0/0+iBOSG3LpdXZWH7s=;
  b=YNy0xZ7iSCEd45TUVgHgy+EiZmzDnhLqcqvfLjsximH9admKXZjABqIV
   fF8rkHB8mBXhmcbxgbqE06BcRHX1iZXOwhkFwsX7AQcTfTFmPeL2orInB
   cfmXrZ+YOSoPUn5AYPejAlCkhK0B07OavSK/VXJgDy3NeeKCGNAx0dr3F
   Q=;
X-IronPort-RemoteIP: 104.47.55.105
X-IronPort-MID: 72130438
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:NeODuKuUUcLiY4p1FWZoqijfA+fnVCJfMUV32f8akzHdYApBsoF/q
 tZmKTiPOqyCNGWkfdAja4218kkH75HWyNNjHAFupCAxEHwa+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywobVvqYy2YLjW17X5
 IuryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8DMfaXiM1AayB3KDAiEqR214btLUGG5Jn7I03uKxMAwt1IJWRvZcg9xbwyBmtDs
 /sFNDoKcxaPwfqsx662QfVtgcJlK9T3OIQYuTdryjSx4fQOGMifBfmVo4IFmm5o26iiHt6HD
 yYdQSBoYxnaJQVGJ38cCY4knffujX76G9FdgA3P/PFvvzODpOB3+JzrHsLJaOy7f8JMx2WAi
 ljexFyjWx5PYbRzzhLAqBpAnNTnnyn2RYYTH72Q7eNxjRuYwWl7IAISfUu2p7++kEHWc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUHBBqlz6PV50OcGTICRzsYMNg+7pZuGHoty
 0ODmM7vCXp3qrqJRHmB97CS6zSvJSwSKmxEbigBJecY3+TeTEgIpkqnZr5e/GSd1bUZxRmYL
 +i2kRUD
IronPort-HdrOrdr: A9a23:ERyDt61d3RbFxeY08pv7oAqjBSByeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjkfZr5z+8M3WB3B8bYYOCGghrQEGgG1+ffKlLbexEWmtQttp
 uINpIOcuEYbmIK8voSgjPIdOrIqePvmM7IuQ6d9QYKcegDUdAd0+4TMHf+LqQZfnglOXJvf6
 Dsm/av6gDQMEg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/iosKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF6N2H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCulqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0xjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXXN
 WGNPuspcq+TGnqL0ww5gJUsZ+RtzUIb1q7q3E5y4KoO2M8pgE686MarPZv60vouqhNDqWs3N
 60Q5iApIs+MPP+UpgNdNvpYfHHfVAlEii8Rl57HzzcZdI6EkOIjaLLy5MIw8zvUKA07fIJ6e
 b8uRVjxCQPR34=
X-IronPort-AV: E=Sophos;i="5.91,250,1647316800"; 
   d="scan'208";a="72130438"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SUClUZ29/zg4Hd7cz+20JW/1swBFdsvof49VRL98VwkncPE18oK6nFW1wL817rqzCkQxmnHm4+Av4z6mIWO17xYGSBKLchHQXH2R/MuCV8adT2bFkS4pRxDQ6PDkhf3fZpkdifnn7J1AhFGxfZwwxu+Ybxu49wOj+rzHapy8qDAXaXA79t04Cp4Gw6kaYLDSD92RfZeNIXkIdcWuRiNP6VVsC4CDTJExF6L7Xo3jwU1kMQSYzzx2DlzAw7bmqEUH7gVCioW6JF41avWKwvIH1GPXUXjZCoD4tAtt43p67mVGDBY5dX52TmlpoDdrugKbJVuRVVZADXYDTUnYwy+11w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yk7BwE3MJDhX0p2WgrTH4mJUB7QRY2Mq8AnPr34qITg=;
 b=guHqXRbJqB20NtSnnqReLC3whbXo0opNThyjFssXvl0JrFiKheWZRHHUaskQxOj+BIeZvelMh8lrDoHVwcm96YCD2EyIA3uvhB1CgHKTfgzS0OEBTN5PuFq+36CKZsezDPKcpilLhdtwYq+VHIXmXXXgZIcX7HUDLKh/v0PCjMoOXDd6/JPPLJHYYszml5VnvKzwC1hyOmfta1jhtiFLfwpk9uzYItMuI685TWi9YjGp5uK2OCr3eLo4ZbabHx/kAMGU7iiKhPdLZM/Aq1TAicUlz7OPTMwXsVhZ8a8SzyAa2EiXMG1YXZxDosQjNnWEsiv8PNg3ySsQfcO+JU2ybg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yk7BwE3MJDhX0p2WgrTH4mJUB7QRY2Mq8AnPr34qITg=;
 b=poWjuEkvzUbi8VefKaVz6AVVlKUnBdbVZYHfyCjhP6CyzxYhKoyz+oUsnpwXuBUESNWz6Or5D7GEbUCXwQXqGvJFnry4v1mlhBXid88G6GLKmtQSYWmQC0JlYDVzISIBO07G8UeFQBJCKvZi6q+QS0cSY5alP2Jb1cce6cQjfTU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 25 May 2022 09:46:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/flushtlb: remove flush_area check on system state
Message-ID: <Yo3e87RdD0/wXn6M@Air-de-Roger>
References: <20220524105052.5210-1-roger.pau@citrix.com>
 <1b0b643b-a906-13ba-d414-feedc98428d3@suse.com>
 <Yo0L+mp5kP1zMU/d@Air-de-Roger>
 <dcbcb8a1-547e-d8d8-6e69-768533d24957@suse.com>
 <Yo3Y4l5ybrJA7VC8@Air-de-Roger>
 <cd186f75-88b1-714d-2c53-951e778fa5d9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd186f75-88b1-714d-2c53-951e778fa5d9@suse.com>
X-ClientProxiedBy: LO4P123CA0252.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24da7932-9147-4342-49e9-08da3e22c248
X-MS-TrafficTypeDiagnostic: BYAPR03MB4597:EE_
X-Microsoft-Antispam-PRVS:
	<BYAPR03MB4597642978EABE64A524BC6B8FD69@BYAPR03MB4597.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qHdlQ25sc705+cB4xbhj9Jj8XQ36QWtMyKy/VTWSMW9uZxKWl+9pAKBNVsbmeA40zQpVNftyMBsWJVkzu0LJGAKUYpDXdT5B/vWyMVFAgfVH6Q2aq9gfhP4AzZQxJ6JSXE2eSB6CE6IBAglrDjVusnIUkOUdX1OMbpQwSthCxvyLb4Gk66Hk+IyiIJgoWQBtvZBkeahy8th6LSw5GOqOqdf4vR/z48PDr/eIknshGxEEodzcgsgdMcZ4aRAb2VXJwQ3z/ySsTFfB247XunHRIXS3T6A/jBF1oaBiaxlViL/ciavQ7L0SbWK/jlauFvK4L9peG4wdJMQeSQ6LSzKXLFgNuV4Ux4YuXS/RnyerninKJRyt5zQeIRJFl7NHZz1E62cTiV/owx2sf9b7hAX5nrD7DtEVzzIt65t+O5NFCSu/Q6VCD3mXBklsDC18tEjuPJdFUiVXCzCs/gJ+m+ShKawZagvDis0siLxmUGupREi7SA6m9Lu1LHE7b988QQXWRzhPQThBchiQmrEYZ9D94bd/3JDTlLK7UsO2j4wU9asEmbPpiUkrq/gnNNPrAvasRMajeuiz7Igoi1Wu9J5b4B0PVQ1nFjunOCZNMkIS578wVqnFTBTFEBKbd2uqzt1NHSL3e9QXjq7wEZsmDTh2WQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(8676002)(38100700002)(66476007)(66556008)(66946007)(4326008)(53546011)(2906002)(82960400001)(86362001)(26005)(5660300002)(6916009)(6506007)(8936002)(85182001)(9686003)(6512007)(54906003)(33716001)(6486002)(6666004)(508600001)(186003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGJrNXNkNTkxMXJFaEdvRXJjdXRDQkwvS3ZYV0pFQTY2M2R0Zk9NbGJETkFx?=
 =?utf-8?B?cXBVMmN3OEMrTDlDeGRlN3dLT1hMVEljYktzUXhhQ2dFV3daMlVUcyttY0lU?=
 =?utf-8?B?d1VhK2cyNkdtd1F3bTF2TlFkRXJxRm80WWVETEZ4eTNjVWQ2b1Q0a0MyUkEy?=
 =?utf-8?B?N3hucllaaFdkZGljdEFuVkFzdm9IeGJoeTVyajZ3RVNuYzBpczlZZ1UrbUhp?=
 =?utf-8?B?UVR3bSs5a2JlVXZTSnRqSUp1eGovVU4yZDFZVUNFZ2lvck5zRkJWRFViQUpY?=
 =?utf-8?B?MmgrVjRmSDBiZEpUdyszS3ZnZ0FIdGdySzZqNWJJNzVQUVgvNzJwUm9YSDRR?=
 =?utf-8?B?UnlNb0JpVklvZzU2WkRscFhGVVBhcytTbFlSS1JKRmJVaVRwTms5MnZHN2tH?=
 =?utf-8?B?ODBnc1pDVThvTFdUT0lVeU9SSEJYRlpMOTNDdVJZV0JkVjVzUE9VMEx5R1FT?=
 =?utf-8?B?V1N3Wkh1U2VLeG4xYktNMkFBY21GQm96eGNFdHUyaldzT0pLRU15aVF3QU85?=
 =?utf-8?B?YnVhV1RtajJDS1pKTDdjcmg4dk51TWtNWnNteHRFWjZoMkx0VVdyZTJrcEts?=
 =?utf-8?B?TWQwREx3cHNid0NpVDZTT2Q4UXBlQmZFMTBNREtzQUV4K0JpbTY2V0o1ZVVV?=
 =?utf-8?B?eWU4K1UxQnpuWkpmcnFaMGM2Ynhqazhxdmw4MWRHRjgzUjBNU3U1bE81a0Y2?=
 =?utf-8?B?VC9KQ3NWVGp3T3ZFOWpkMU5sZWRreTIwV3dvWk1ZUGRWTWxRQ1VXZlBHRWhr?=
 =?utf-8?B?ODdNdDkrRzdBZU83RjU4bmdhWXlSSkdwMkUyRjU3LzFKUVdycE11cEViOEZJ?=
 =?utf-8?B?K3VpUW8wWlc2YWR6MUxUMlBXMFkvVGhBZi9jSzdhNnNyR1grY2prWXV4WkNp?=
 =?utf-8?B?a1hmMXYyTnZLMmZ1VTFxYVc2Z3V3NFJZZUx3Vm9HNm96Nkk5UmU0dy9zSmpq?=
 =?utf-8?B?eG1yWXRtRkl4K0ZlcHlQalpjV0RLSE5oU1E5OHc1WFRmWGJWUHJFYm03a1Q4?=
 =?utf-8?B?eE00MzJ1ZE1ZTUZ3MlJCdmhhZmh1Rm13a0VIZVdPbWU4RGQ0Z29pcStTNHhl?=
 =?utf-8?B?QnZmcmVmekw5eHlRQlJuV0p0V2d4citzNWZQeTVDRFZPZFBYYWxiS2xORlVW?=
 =?utf-8?B?MFEvRHZ4NDBDeWpZV055TVBEczV6Wlh0NnRsME1IYmg3dm1WaXYwUEYxUS9z?=
 =?utf-8?B?VjI2aFlDRTNjNTFDcnZ3eWFDd2xjK1NoOXEzWCt1Mk5DejlMd0xjQ3Y3Zmxw?=
 =?utf-8?B?aUJVUTVxdGs5V3BjR0lvclRoV1FaRWFVT0dTckI1ckdQRDl3YXM3aEFwSDMx?=
 =?utf-8?B?b0N6OTB2ekJJUGdTYVp0YXNMYzZxYXhJZUxvelJqcWZXUEUyQ0M1d2dmMDVU?=
 =?utf-8?B?RGlqaFBJSkVzZHJJVUtyWUh4TVpTSnlnQW5RaUhOMGJXMUo0eDkzTEtUV2x6?=
 =?utf-8?B?WmhmM1pOdWdZUzlmdE9aOWs0WDRaQ280dlQ1T2NzRkRoaUxTZnhiRlhEMmtz?=
 =?utf-8?B?eUE2MWtaYWhRL0JPUlNjcFQ0VjhQNmdWWnBWbWlVcGFPRWJMbGF4ajFyUnF6?=
 =?utf-8?B?bGFhZ25BSlNma05TTnVUTG04d3RPK2w1a2xXTWdFYzdhV3VJdkFzVDlFeGRa?=
 =?utf-8?B?OWlycmJtN1ZzNHN2WGYrb0xUQmxhVmVHU21tNUZ2M09XNFgzTjNtNjBaWnAv?=
 =?utf-8?B?WWJQVmlTNXIxMGR5V3BUQXcwTDdXVWEydy9yUmlkNEJqMWhwdFY0V1ZyQXN4?=
 =?utf-8?B?TmlkaFo1b2tWMkF6c1JrelJHREF0ZURMMzhXb3dGVm45aGZEa1B0WUFjbERH?=
 =?utf-8?B?bytyUVE1THcxSm5SdnlnUU1PQUhkTkNmc2FoeGVPSHZKTWpuWE4yU3diNlRq?=
 =?utf-8?B?Q0xVVllvbndtVDhzbFFqS2dEcGF4OHcwZTd0dk5vOGowc2tuNGVSWVVqL004?=
 =?utf-8?B?SkcyRUhFM250TkNCSXJTSjRGOEFSMytBbjZyd3E2WG5RbWtJcS90OEVrVTJZ?=
 =?utf-8?B?WFY5a0ZPQmdJNm5ibWNzczNOQktETXN1cDUyazZDa1JMeFFHY1JKcXR0ZExR?=
 =?utf-8?B?ODR3SG93Y3dLZWZwNUxla3lKWDhkVitnVURaRUsvcFdmYzZvUFZndjRUVUdP?=
 =?utf-8?B?TkM2SDNxcEw5RjNBWkxDZDVlREcxNVFucXVHUGxqVzlZL25zbE92YlpRTTZ3?=
 =?utf-8?B?MUJDKy91bXhRUEtDS0g3djFvMVErNmJxdm1VVmxpVytDa1JaZ0d5cDNqUzNy?=
 =?utf-8?B?ZHdTajh3V3ptNm5kMG1EVDd0Qzh2L1BWVU1IZndSaGtxRGdhSi8xaDNiZ2FK?=
 =?utf-8?B?YkFPZllNWnk3cDRuZDZWcmFyUlNXWlVPa0ZxY28xWU9zelZ4YlEzRitERFdC?=
 =?utf-8?Q?7ykHKe0qyp1UahLQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24da7932-9147-4342-49e9-08da3e22c248
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 07:47:03.8173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2G6eqTAYV4hSSeUrbjOQAxh5i66P65qmZMulwv1ydLU9piBYYCbDhcN0Wq5pTb7N14D2wuSI8J5UumkwvV0b6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4597

On Wed, May 25, 2022 at 09:34:32AM +0200, Jan Beulich wrote:
> On 25.05.2022 09:21, Roger Pau Monné wrote:
> > On Wed, May 25, 2022 at 08:02:17AM +0200, Jan Beulich wrote:
> >> On 24.05.2022 18:46, Roger Pau Monné wrote:
> >>> Would you be fine with adding:
> >>>
> >>> Note that FLUSH_FORCE_IPI doesn't need to be handled explicitly, as
> >>> it's main purpose is to prevent the usage of the hypervisor assisted
> >>> flush if available, not to force the sending of an IPI even for cases
> >>> where it won't be sent.
> >>
> >> Hmm, yes, that's even more verbose than I would have expected it to
> >> be. Just one point: I'm not sure about "main" there. Is there really
> >> another purpose?
> > 
> > Right, I should remove main.
> > 
> >> Of course an alternative would be to rename the flag to properly
> >> express what it's for (e.g. FLUSH_NO_HV_ASSIST). This would then
> >> eliminate the need for a comment, afaic at least.
> > 
> > I think it's likely that we also require this flag if we make use of
> > hardware assisted flushes in the future, and hence it would better
> > stay with the current name to avoid renaming in the future.
> > 
> > Whether the avoidance of sending the IPI is due to hardware or
> > hypervisor assistance is of no interest to the caller, it only cares
> > to force a real IPI to be sent to remote processors.
> 
> Well, then it could still be named FLUSH_NO_ASSIST, since as said
> (and as you look to agree with) there's no IPI being forced in the
> general case.

That would be fine but I don't think it's OK to do in this patch.

Could do as a prereq if you want, but we should keep in mind the patch
under discussion is fixing a boot regression, the fact that it
doesn't trigger in osstest is just because there's no hardware with
CET Shadow Stacks support in the colo.

Thanks, Roger.

