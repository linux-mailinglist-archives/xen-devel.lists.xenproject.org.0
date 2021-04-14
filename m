Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB1935F509
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 15:41:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110639.211184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWflh-0004u7-Dd; Wed, 14 Apr 2021 13:41:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110639.211184; Wed, 14 Apr 2021 13:41:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWflh-0004ti-A4; Wed, 14 Apr 2021 13:41:21 +0000
Received: by outflank-mailman (input) for mailman id 110639;
 Wed, 14 Apr 2021 13:41:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UoOq=JL=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lWflg-0004td-7a
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 13:41:20 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9c2eea6-c43a-4c8e-a600-b9dd8353b2ed;
 Wed, 14 Apr 2021 13:41:19 +0000 (UTC)
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
X-Inumbo-ID: d9c2eea6-c43a-4c8e-a600-b9dd8353b2ed
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618407679;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=CuW4GChSy3K0inls+sGXpEmVhpze0Q8Itp50UrHtW+4=;
  b=E1eNU17gy0NR06SZc8CKsodxD/4KeNqhgQ8v2j7xBcPucCDrkY/bLPxZ
   wJFOIVhUB7/hcaPMiQDU8ApudwpO4bWX0VWqxbg/cvppIp5iHWdCOD2jI
   xNLyo8jex3dJnGQ4D+pLgKfbjk0MNXMsFBvRmjWsG2uLCJjUZUUalIPr9
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7Vbzq3/NvzhaMz4EpoN7aiFGUi3uCmgNlmU7+Loj6N43WWG98VW+5bX3OOeeV4nenURCzDecPv
 fje8JMXHN5W51Su9/O92YwaTQz6sK5NCf0i8DyXU40K1IbfezNrsB+BmOiB0sWC/FIWaHQ2AKo
 3NZXf8vSJ7THqd2Kxqnbt6glarL4s4E6/o+N9fbKZbcendN4a6T8GsBt+wnPVrqVb2dkAx/Q0D
 GOIM0Jqy27EAkiPYpXAL5HhGiz3ta4J6GSOwaRt7amTRD8ek0N5xmC6rYU90/iHGMfyt3ViD88
 VKg=
X-SBRS: 5.2
X-MesageID: 41570510
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:HrZFgaOjpgB/H8BcT0jw55DYdL4zR+YMi2QD/3taDTRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAsS9aFvm39pQ7ZMKNbmvGDPntmyhMZ144eLZqQHIMxbVstRQ3a
 IIScNDIfX7B1RikILe6A63D94vzLC8gduVrM31pk0dLj1CQadm8gt/F0K/Gkp5WAFJCfMCZe
 Chz+BAoCetfmlSU9SjChA+LqL+jvDotLajWx4JABY79BKD5AnF1JfWGwWVty1uNA9n7qwl9Q
 H+8jDRxqLmiP2jzw+Z6mm71eUvpPLE6v9uQPOBkdIULDKEsHfkWK1EV6eZtD445MGDgWxa9u
 XkmBsrM8Rt5365RAjcznXQ8jLt3zo053jpxUXwuwqbneXCWDk4B8Bd7LgpECfx1ks6sNlwlI
 JN0m6J3qAnaS/ooSXn69DEEyxtj0q/yEBS9NI7sno3a+sjQY4UibZa0FJeEZ8GEi6/wpsgCv
 NSAMbV4+sTWU+GbljC11Mfj+CEbzAWJFOrU0ICssua33x9h3Zi1XYVw8QZgzMp6I89cZ9Z/O
 7JW54Y2o1mf4szV+ZQFe0BScy4BijmWhTXKl+fJlzhCeUhN2/SrYX0pJE4/vujdpBN7JZaou
 WBbHpo8UoJP27+A8yH25NGtjrXRn+mYDjrwsZCo5djvLnxQ6fqLD2DRFgin9DImYRdPuTrH9
 KIfL5GCf7qKmXjXaxT2RflZpVUIX4CFM0Z0+xLGW6mk4buEMnHp+bbePHcKP7GCjA/QF7yBX
 MFQXz2LMVE5Ua7R2/gjHHqKjbQU3262ag1PLnR/uAVxoRIHJZLqBIphVOw4dzOLyZDvKwwdE
 53O6jmjau/uGmz8Q/zniVUEysYKnwQzKTrUntMqwNPGVjza6w/t9KWfn0XwGGKPQZlT8TdEB
 dWolN+/a7fFe3V+QkST/acdk6KhXoao3yHC6oGkqqY/MH/Z9cTFZA9QpF8Eg3NCj14kQtns3
 14dQcBX0PTfwmezpmNvdgxPqX/f8M5qBq3KcRUwEivyHm0lIUKfD8neBKAFeSQmh0jQjJIgE
 YZyd5ivJOw3RC1KWU+h+wkNkZrc2r/OsMLMC2MeJhUlrf3eAt5UGeNgniAhwsuf3fxnn9i+V
 DJPGmaf+rGDUFavW0d2qH28ElsfmHYZE5obGtm2LcNXFjuqzJ20eWRYLC03HbUYlwewvsFOD
 WtW0pkHip+g9S23gWSgjCMCDEvwYgvJPXUCPAmf6vI0n2gbI2OmqduJY4jwL91cNTvuPQMS+
 SRZkucKy75Efog30iNvWk+URME2kUMgLftwlno/WK41HkwDb7bJ0lnXagSJ5WZ43L/T/iF3Z
 1lhbsOzKONG3S0bsTDxbDcbjZFJB+Wu2KwQu0yoZ1fvK45ttJIbu3meCqN0GsC0AQ1Lc/ymk
 9bXb9y56rZPJRzO8MVYCBU8zMS5Z+yBVputhazBOAwfVsg1SCGe9yI5qfFsropDAmKohDqNV
 yW7i1a+LPEUkK4pM4nIrN1JX4Tbk42rGlm9qeFcYbbDQ2xbeFN/FagKBaGAcpgYbnAHa9Vtw
 pw5tGDgvSeeCX50h3BpDcTGNM+z0+3BcepRB+WEeFG89amKU2Bj6uj7sm0lir2Q1KAGjclrJ
 wAc1cRYMRFgiQji4Ny0jHacN2Inn4Y
X-IronPort-AV: E=Sophos;i="5.82,222,1613451600"; 
   d="scan'208";a="41570510"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+XQo6Ac+dtLHQcSDk1MiAuHyOlN/Iz5Q0RbuK9V3A2M+mXgTv0sdcTXIY6FgJZ66PSRmlGRO7caILbAjAxfi0083l1RT7UmjeuCifgDRQZcPOO4aq8fXOFgRTj9PDWhrZJyR2e6fOjB2cE49TYy3Y3JLShiuQhuuIoFFFMIg5I/Mm2v6iGc4tYhAmJ0OKqrbGZP0N0GvDI9N50DFsZduGUtPEj6WhdYg2k5pQ3axob3tXqEMk1+M63jpPkU4KKHglwzr5WUPa051PI3X6nhSwZ3DsDTTa4ZWQWc4uMOo7ypUl9n2K/0yyMLCUy6WyRnX1WrHmdwptV2YoMFQledaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dqtg7qa7mTbcV8PXzy13ZVTCs6LATias4ge66MlhjOk=;
 b=RtTARlLLoT7C3vJBYJVf19vyPLf3Rq862psqWFTptCxTADM0R4CkUqg5qaQQJKydna6Gg6VECwWuLCcI1oDuZgi7V33TUT9okSKTgIDJ5/U+0tMASf706KmB1mAKgUAmHT5KmRLKID7H4uBONNffuAxoYBL3HLUkeFJ/1qftXpQhnjLdwmnOarh5ZBwuLJyanHQIxQdTjrKlhu2GX1/98V52aTO+o+Zvjoo7vnLN9tdjqI7SSJawP1dlMK44JzHStoUvHRU42CpFHcR6D+plaCab6gvg1PYPY4zkO/TrzdqtM3PIxopiszgMsk4Sz/79RaaeqGACvbpOw6BxS62O6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dqtg7qa7mTbcV8PXzy13ZVTCs6LATias4ge66MlhjOk=;
 b=BUTiOjFUSBs05wVd5WDEXRqR3UeX1zg8hLMRBClsT97u+4u8MjvrSbu4+6ON25+KuPztRRU3NNdQs4q++TU+Bc9w+f1ne/NLLCJYK5Uh2WSkkxGuWPV6saP6/tnry2lPnp/725fnIh8J4v8VxZwKKrLW5ycbKGus7J75Wdl3SEI=
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
	<xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
References: <20210414110433.83084-1-roger.pau@citrix.com>
 <20210414110433.83084-3-roger.pau@citrix.com>
 <29e8e2a4-3489-17b9-849b-ddfeed76451d@suse.com>
 <5fa30ed1-967e-dcd1-b9cf-110708f2c069@citrix.com>
 <6f9ef9fe-4e1e-ea1a-53f8-7c98e6bfdf24@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] x86/cpuid: support LFENCE always serializing CPUID
 bit
Message-ID: <6bb29b7c-6918-6b2d-aedd-bcdc1bec2613@citrix.com>
Date: Wed, 14 Apr 2021 14:41:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <6f9ef9fe-4e1e-ea1a-53f8-7c98e6bfdf24@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0020.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::32) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a08b542-ddaa-4c9d-3590-08d8ff4af87c
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5438:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5438D03558BF81D153A8CC5FBA4E9@SJ0PR03MB5438.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8D6q+SHpOrjSxrUzOaBE/w3ZG+eKSB9gYBzauhubivHRMQl8eVemNAyVtRUvX8jxe2SWZhMWW4Lgg9wtKWz8vsxC1cfKZjcDRwcXnt4F+qPOHyXqBgIqbSNnDU1V69TqzwTI6YkAQmCrOE7hV5sgvFEm8xFBputeTfpwYI3gE31kUl614T1tqdnKvzZFertcT7oLUY7V2PihWQ7/XI2digq4cycSlCvAfOPBACyaRWUyaDFK0kOMDuzuoL3SbPG48KKTpRd6rL5tQu4FMwg4ZPcA88P6gyy3bCtqJDuWyWUuiX1OKPaffpXpjXhLbHvnsWRH7X8m1ZN5uebC2CGyhD9WuLq3+Uq+w33o6G4lQeqYox+TWz4XmjpYklM+GaxbN/7RsG32yBUorLTUKh6NZtp0gvmXgyXf9dSIgvbuzxnzDsoedCehQjK5jvdSmuoVbR/gLqYy3B5dP8gn6zawRQXfA+8dzwY6XiTS0Ag24iqZzOKQVAPOmPmEsk9pacwczb2BKWlnM0eS4TW6PCDV1S/p9nIQhlZ1DTuSOQe0SF2fsEGohQr79H9Gef1UpLCkIU9rLLE4mACsSYQ9I3kFePF3+l1WinYsTS3Qfr8saqGcGnZ2S/MS3yPHItnNKWFbs/FY8srTxLERkuXme8pIFEQjwSD10D1VB63G5QylEXEVSPK+SuY/CsXAZweaswEP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39860400002)(136003)(396003)(376002)(2906002)(6916009)(26005)(31696002)(66476007)(66556008)(66946007)(53546011)(36756003)(38100700002)(8676002)(31686004)(956004)(2616005)(16576012)(86362001)(8936002)(107886003)(83380400001)(5660300002)(6486002)(316002)(4326008)(6666004)(54906003)(16526019)(186003)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bFJ0Rlk0b3BpWm1BS1F2ekVJMWRlK0xzMTRob3NLcE1MTmU3VUhUV3R4dEYw?=
 =?utf-8?B?d3VtaHJpWGR2T0w1T2o5aWRDa25LL0pNUFJRekhVVGh3a1NNS2tqTG9Td3Ba?=
 =?utf-8?B?Q1Z4WVNrUWYxVnVyNWNDdVEwaktrMEFSc3U0S2RuUmZEOHRRdjczZnQxVDdv?=
 =?utf-8?B?MVIvdEo4M241NWR2djU5RDg1bXoyRnB5S1NOSGtFR0prRUNuZU9DY24vajcx?=
 =?utf-8?B?c3ptbDVlVEVPRlFNZm1ZTWJ2ZE9neVBBeVVFTFNtcXdKUmQzRU5CT0ZDdkdR?=
 =?utf-8?B?SjVyTjhRRmdWL05KQUxva1ZoTU9CbTBXN3FHR0YwSmpqRWVvbEhpWG9uYkhL?=
 =?utf-8?B?RGZsNTNCaUpBa3Y5ZDhlRU94b1FDM3ZHQVptdzhYL3QyalprWG96bUJXSzRa?=
 =?utf-8?B?bmNob01BMU5HVU5rRXdNbklhMGo2dSsyNGtWRWJsMEhXRFU4YWQ1eUJmbzlv?=
 =?utf-8?B?QkNqQjlrTEVtL3lZRW8wMCtIckF1cVl2QmNYUFZNeGdOc2x6UEwrcHFEZUNo?=
 =?utf-8?B?NzBacXRnSUZFUTNYY0xjeW8zL2tKVUNhYUY5Sjlmc2pDM0oydTZjRThJdDdp?=
 =?utf-8?B?MUR4UHcyYjl4UFZMSUhrUG5yNGRuSWIzNnNkVGMvWUNqWVZtN3VzMVV2V29o?=
 =?utf-8?B?azJoaEdIdk5qWUtBeVFRWEZPQ2lwQU9NSTcycWVQdHpQandWZ1ZPakF5OVRi?=
 =?utf-8?B?Mm1hMS9wcWM0TUw4R0ljNHQ5bVlXT0NHZ1BUNTRxWGRhS24wYis1ZGFSZkR0?=
 =?utf-8?B?SmYwT0c2T0ZhNEpLSFdSVFFlQnEvOVZmdDAvYm0reTcvdkc2YVpUdWxwR00z?=
 =?utf-8?B?RU5zekRXQ05NTjB2Y20vU1NxcW00TEp6YmQrblp2dE5EcXNSd0s3Q2JMV2N0?=
 =?utf-8?B?aWUvdmJEZ1JYdmllT3g5VXlxWlhLdjhnOUFmVVEvbEw2b2ROdy9admVuOXgz?=
 =?utf-8?B?cTZNTmxwOU5OWGltR2NCTmlEUG82Y0J0NHNQekxBakJFcHlOU3B6aXNlZVVj?=
 =?utf-8?B?T1pPYmtaME5DVXBhNVhrUkJtWUEyWnlrV1cwaHR4bW1ERzF3a0h4ZUJER2tu?=
 =?utf-8?B?N1g2REVSM0pxWi9NbUhhMXJwTlNydzRUMTFYRTVlUGhlTTNhRGRtcVlTNTlh?=
 =?utf-8?B?Tk93czU1RWU5Y2tqeXd0bU1RMjhZeXBKVjRFcDhOL1JScDQzVmVNbUJHSXA5?=
 =?utf-8?B?QmM1RjF1QStrNzhoMFJzMnp0M1hVTDB5VVZSWFU5WGpjZGlYeW9DKzJQc2lN?=
 =?utf-8?B?dEV0cyttK3pmanp1Q3UxOUdET2EvMDNGS2hYYmF1SnVuemJlSFlSUlF3cS84?=
 =?utf-8?B?TWgxUmpvaFFZazlieWdtOTVVS1VhV2gxVjVsc1lXSVhkMVNjWTVPYmNVZlhT?=
 =?utf-8?B?QXoxTS9IZ25SNmdMWS85cVdWWUpjRjZyRE1GdmJ4cEFWamZwZU5MYmxTUU9z?=
 =?utf-8?B?ZXBEOEc1eDA1Z0FQN3N5NkZXeTlxeWhjTU5ZM1lHN0dwNEY0cUg3ZWdHa3d0?=
 =?utf-8?B?MHRhYVEyb2hsN01TUFJueTJoR2ZEakVHL1lveHE1V1FxWFp4N3BaQVdiU2pj?=
 =?utf-8?B?eXpFWHMxUStyVElYa2U4ZFRTNHRmMHVPc3VGN1Q0ejBQVjNaWXhwZGZUKzh2?=
 =?utf-8?B?YjcyVzlUNFh4STdlRndyNTZ0bDRueFBoY0VoRk8wSWJ6UFJIdytWLzhYbGho?=
 =?utf-8?B?dlpkSW1lUGZrSnFpbCtscjhuQUNLRlFuTGRobGFmNGkwV2pyc2trN1lvU0F6?=
 =?utf-8?Q?AeXPPsmhzcqnB5szb1Zay2L1GxTvT88vx1gBGjn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a08b542-ddaa-4c9d-3590-08d8ff4af87c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 13:41:13.6106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hDgCyPBl6rhhW8n8tBQXINMi7yQORkipZ9sVGepFARki77q0MVNObHcKaSTcA2cMyDmF22F29S35aAZ6QdfEx61CW42hsy5v2GOUPfq1dw4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5438
X-OriginatorOrg: citrix.com

On 14/04/2021 14:24, Jan Beulich wrote:
> On 14.04.2021 15:05, Andrew Cooper wrote:
>> On 14/04/2021 13:57, Jan Beulich wrote:
>>> On 14.04.2021 13:04, Roger Pau Monne wrote:
>>>> @@ -264,6 +265,38 @@ struct cpuid_policy
>>>>              };
>>>>              uint32_t nc:8, :4, apic_id_size:4, :16;
>>>>              uint32_t /* d */:32;
>>>> +
>>>> +            uint64_t :64, :64; /* Leaf 0x80000009. */
>>>> +            uint64_t :64, :64; /* Leaf 0x8000000a - SVM rev and featu=
res. */
>>>> +            uint64_t :64, :64; /* Leaf 0x8000000b. */
>>>> +            uint64_t :64, :64; /* Leaf 0x8000000c. */
>>>> +            uint64_t :64, :64; /* Leaf 0x8000000d. */
>>>> +            uint64_t :64, :64; /* Leaf 0x8000000e. */
>>>> +            uint64_t :64, :64; /* Leaf 0x8000000f. */
>>>> +            uint64_t :64, :64; /* Leaf 0x80000010. */
>>>> +            uint64_t :64, :64; /* Leaf 0x80000011. */
>>>> +            uint64_t :64, :64; /* Leaf 0x80000012. */
>>>> +            uint64_t :64, :64; /* Leaf 0x80000013. */
>>>> +            uint64_t :64, :64; /* Leaf 0x80000014. */
>>>> +            uint64_t :64, :64; /* Leaf 0x80000015. */
>>>> +            uint64_t :64, :64; /* Leaf 0x80000016. */
>>>> +            uint64_t :64, :64; /* Leaf 0x80000017. */
>>>> +            uint64_t :64, :64; /* Leaf 0x80000018. */
>>>> +            uint64_t :64, :64; /* Leaf 0x80000019 - TLB 1GB Identifie=
rs. */
>>>> +            uint64_t :64, :64; /* Leaf 0x8000001a - Performance relat=
ed info. */
>>>> +            uint64_t :64, :64; /* Leaf 0x8000001b - IBS feature infor=
mation. */
>>>> +            uint64_t :64, :64; /* Leaf 0x8000001c. */
>>>> +            uint64_t :64, :64; /* Leaf 0x8000001d - Cache properties.=
 */
>>>> +            uint64_t :64, :64; /* Leaf 0x8000001e - Extd APIC/Core/No=
de IDs. */
>>>> +            uint64_t :64, :64; /* Leaf 0x8000001f - AMD Secure Encryp=
tion. */
>>>> +            uint64_t :64, :64; /* Leaf 0x80000020 - Platform QoS. */
>>>> +
>>>> +            /* Leaf 0x80000021 - Extended Feature 2 */
>>>> +            union {
>>>> +                uint32_t e21a;
>>>> +                struct { DECL_BITFIELD(e21a); };
>>>> +            };
>>>> +            uint32_t /* b */:32, /* c */:32, /* d */:32;
>>>>          };
>>>>      } extd;
>>> Due to the effect of this on what guests get to see, I think this
>>> wants to take my "x86/CPUID: shrink max_{,sub}leaf fields according
>>> to actual leaf contents" as a prereq, which in turn may better
>>> remain on top of "x86/CPUID: adjust extended leaves out of range
>>> clearing" (both are neighbors in that over 4 months old series,
>>> fair parts of which could imo go in irrespective of the unsettled
>>> dispute on xvmalloc() - unfortunately I had made that patch 2 of
>>> the series, not expecting it to be blocked for so long, and then
>>> presumably signaling to others that the rest of the series is also
>>> blocked).
>> There is no shrinking to be done in this case.=C2=A0 The bit is set acro=
ss
>> the board on AMD/Hygon hardware, even on older parts.
>>
>> What does need changing however is the logic to trim max_extd_leaf down
>> to what hardware supports, so the bit is visible on Rome/older
>> hardware.=C2=A0 I.e. after this change, all VMs should get 0x80000021 by
>> default on AMD hardware.
> As to this last sentence - not really. Only if we managed to set the
> flag (if it needs setting).

... or we find it already set.=C2=A0 Remember that we don't even offer an
option to let the user avoid this behaviour.

The only case where we'll boot with lfence not being dispatch
serialising is when we're virutalised under a pre-2018 hypervisor with
has no Spectre knowledge.=C2=A0 There are more important things in life, th=
an
to worry about this case.

> It's a two-way thing really: If the flag ends up set, I agree there's
> no need to shrink max_extd_leaf. But if the flag ends up clear, the
> issue we have today (hence my patch) becomes worse: Trailing all zero
> leaves would result because we don't properly reduce the maximum from
> what hardware reports to what is actually populated. In any event - I
> think I'd much rather see issues with my patch pointed out, if any.

I don't have a problem with the shrinking change in principle, but it is
definitely not a prereq to this change.

Trailing zeroes aren't going to cause guests to malfunction, even if
we'd ideally be neater about the result.

~Andrew


