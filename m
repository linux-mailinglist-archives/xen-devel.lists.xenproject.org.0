Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42385431A1B
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 14:53:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212193.369973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcS8I-00044L-Gg; Mon, 18 Oct 2021 12:52:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212193.369973; Mon, 18 Oct 2021 12:52:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcS8I-00041G-DL; Mon, 18 Oct 2021 12:52:50 +0000
Received: by outflank-mailman (input) for mailman id 212193;
 Mon, 18 Oct 2021 12:52:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3tpC=PG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mcS8G-000418-HK
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 12:52:48 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d9946a3-3473-4763-93f2-68bd088492e5;
 Mon, 18 Oct 2021 12:52:47 +0000 (UTC)
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
X-Inumbo-ID: 0d9946a3-3473-4763-93f2-68bd088492e5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634561567;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=lHiTrZDdt1r7yV9z+cION0Uu9OUEbBn0dRS67XA0JXw=;
  b=hYGM4q8ucm+wlLGoKb9j5alSmc0CxLNWumzTo6i2Bx67nMeFiBb5//W4
   6LZR/8pKVcnC0tx32aY3JgAXFTWW+9SODVTfJoaKbvDw3Jtx8CDVAqBRb
   Bn12fNt6tCLwWcvdjfQpwGByIn3V2MOj2NV5a5OhD9SvM5xtgQdFftDbp
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: TfFC3RXOjTaeYtaGwovoWzwQqZYigTtcaLj1Jv9zH9ia5lpEMdpslwE9Lwxi4f3hfzHJEAQv3i
 QfoM0S6NiiUKZV8fdXW4flM0QUunmv+olKhiiJViFVbp5dmJYVfQVTOzlEvuC8AC1cXhznMl74
 vdQIiOB3pOnwiY86iajaanoJYAvZS3lxcSdjOqn0jNf75wVKQiFnla3ei7OwjbuI/+sSlKxn0m
 cKumWjnOv1iWDKqfAQS9ss70cLg3+gjDFjprn+rM1NFgcpSi7AEzt1burPA/9rfeDPbxKJdvAv
 /C4hmPZUwt5SFalb+B13wb2F
X-SBRS: 5.1
X-MesageID: 55417946
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Rceh6qDliJ+j6RVW//Lkw5YqxClBgxIJ4kV8jS/XYbTApDJx32AAm
 mNOXj3UPfiJYWWjL41xb4rjoBgE7cOEyoJqQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLOs1hxZH1c+EX550EI7wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/lwiJs4h46
 NJ3kd+UdwMZA4Kdgv44akwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHviWvIAJgGlYasZmHNDaW
 ucpdGJUZ0rrYR5IGwgMEKo5g7L97pX4W2IB8w/EzUYt2EDMyCRh3b6rN8DaEvSaSMMQkkuGq
 2bu+2XiHgpcJNGZ0SCC8H+nmqnIhyyTcIAYGaC89/VqqEaO3WFVAxoTPWZXutHg1BT4AYgGb
 RVJpGx+9sDe6XBHUPHhYh2U+HekuSQ4GP5uF90Hx1CX0I/ttlPx6nc/chZNb9kvtckTTDMs1
 0OUk96BOQGDoIF5WlrGqe/K9WLa1Tw9aDZYP3ddHFRtD8zL+dlr1nryosBf/LlZZzEfMQr7x
 CyWt2AAjrEXgN9jO06TrA2f3WzESnQkSGcICuTrsoCNs1sRiG2NPdXABb3nARBodtfxor6p5
 yBspiRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiD4IdwBvWAkeBszY67onAMFh
 meJ6Gu9A7cIZBOXgVJfOdrtW6zGM4CxfTgaahwkRoUXOcUgHON21CpveVSRzwjQfLsEyskC1
 WOgWZ/0Vx4yUP0/pBLvHrt1+eJ7l0gWmDKILbimnkvP7FZrTCPMIVvzGADVNb5RAWLtiFi9z
 uuzwOPRl0wADbGjO3SOmWPRRHhTRUUG6VnNg5U/XsaIIxZ8GXFnDPnUwLg7fJdikbgTneDNl
 kxRkGcFoLYmrXGYewiMdF55b7bjAcR2oX4hZHR+Nle0wXkzJ42o6f5HJZcweLAm8s1lzOJ1E
 KZZK5nRXKwXR2SV4SkZYLn8sJdmKEahizWRMnf3ezM4ZZNhGVDEo4e2Ygv1+SASJSOrrs9i8
 aa43wbWTMNbFQRvBcrbcty1yFa1sSRPke5+RRKQcNJSZF/t4M5hLCmo1q07JMQFKBPiwDqG1
 lnJXUdE9LeV+4JsqYvHn6GJqYutAtBSJEsCEjmJ96uyOAnb4nGnnd1KXtGXcG2PT2jz4qijO
 7lYlqmuLP0dkV9WmINgCLI3n7km7t7iqrIGnARpGHLHMwaiBr96eyTU2MBOsutGx6NDuBvwU
 UWKo4EINbKMMcLjMVgQOAt6MbjTiaBKwmHfvaYvPUH3xC5r577WA0xdMi6FhDFZMLYoYpgux
 v0suZJO5gGy4vbw3g1qUsyAG7ywE0E9
IronPort-HdrOrdr: A9a23:g104haly0fvcZnNBK10rpYEdoM3pDfO/imdD5ihNYBxZY6Wkfp
 +V8sjzhCWatN9OYh0dcLC7WJVpQRvnhPhICK0qTMqftW7dyReVxeBZnPHfKljbehEWmdQtsJ
 uIH5IObOEYSGIK8voSgzPIY+rIouP3iJxA7N22pxwGIHAIGsMQnDuRSDzraXGeLDM2dKbRf6
 Dsn/avyQDQHkj+Oa+Adwc4tqX41pH2vaOjRSRDKw8s6QGIgz/twLnmEyKA1hNbdz9U278t/U
 XMjgS8v8yYwr+G4y6Z81WWw4VdmdPnxNcGLMuQivINIjGprgqzfoxuV5CLoThwiuCy71QBls
 XKvn4bTotOwkKUWlvwjQrm2gHm3jprw3j+yWWAiX+mmsD9TCJSMbsLuatpNj/ir2YwttB116
 xGm0iDsYBMMB/GlCPho/DVShBDjCOP0DkfuN9Wq0YafZoVabdXo4Ba1lhSCo08ECXz751iOP
 VyDfvb+O1dfTqhHjDkV1FUsZmRt0kIb1O7qhBogL3T79EWpgE586Ig/r1cop9an6hNDaWt5I
 z/Q+xVff91P5YrhQ8UPpZ3fSKNMB25ffv7ChPaHb3WLtB0B5vzke+C3FwU3pDhRHVa9up+pH
 z+OGkow1LaPXieUfGz4A==
X-IronPort-AV: E=Sophos;i="5.85,382,1624334400"; 
   d="scan'208";a="55417946"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jq569W/rMWF290iCsK0z1pyO0OZzuZCPRVkYtm0Dk7madeda1BQeFjj8rND6dp8c/MWDZdhX5TbEd+nO+Z8W6HcmcJwKDmGm5N76xfG7K7SNUOF7PM3hucpl8loUKIzTW4mxhAl5YhUQBNH+uvR6x59N/++eEA4NDoigvZ0flD9yZCnCfveLwDQXQ8VWzAODyAnY9SzImh5vNxFKrxfAcGWQjZYdLSVMgNGdd2u/r1EkERpGCO4AqPsVsen0Khgd5ny0UDqZod/5NsKaDzk4zuwwyT9z/s02KSYTv3EfxbQKm+hPf4paL8iwailZ1KKA/ieYT0wcLZ43VDD1PIrIhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nINN8uLBn/KX27mhSapKsCS5RQcml78jX28DdteYTB8=;
 b=UCMBZigOqnaTbRojbgm6te6DmtCxDUeEC7CcAWvjX7Zn/aUoZOJE63k8h8iLxW55eZ9nzvtjGECkX6aDaXGx6TpKq91Gy1+wrzhBcuPcLQMc8T2kg+gx3ZLQ7CJwu09A2Id+zae32xefClrzIDyLrIObON5KzIokxRXG01SXvf5JOgrjfKbopTqLLl8zWAkvX5EWxt0M608KrHM6/0ukJpZWrUIXuwrZiog/CgJR+zjfdVeH8fpMzaj2BXoe92SCNAHS9dSWx/UIiufNXlvoH5qgL9muPX43SgvZddWzCbCp6SpcI1+ecEie+1KYQF9NRvAfGPBu4DfLzByeq6/bIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nINN8uLBn/KX27mhSapKsCS5RQcml78jX28DdteYTB8=;
 b=gizxa8e/Kr8uvOdhDYiJ4qolNUttvLAhc4bawx6CEcaBGfWXlqlwsA7hgGBPAKxroire2N/d63oi2IntB2uHpXZ/rwKdcNXyDZZLcvKEvEJpUt2UYlEkwxVvOemVBTnQ0SpKadAGIaHL0If289KKVFk8S7tkPPezGSuxWALFZkY=
Date: Mon, 18 Oct 2021 14:52:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] x86emul: de-duplicate scatters to the same linear
 address
Message-ID: <YW1uDKPt4OLS4v4a@MacBook-Air-de-Roger.local>
References: <cf935e11-27c8-969f-9fb2-a5c0e85ccff1@suse.com>
 <YW1YW8HJr6ttyd84@MacBook-Air-de-Roger.local>
 <a35c7be1-db42-9f7e-fc36-6b6abfd9e9a4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a35c7be1-db42-9f7e-fc36-6b6abfd9e9a4@suse.com>
X-ClientProxiedBy: LO4P123CA0288.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfc07811-8f3a-454c-6894-08d9923627dd
X-MS-TrafficTypeDiagnostic: DM6PR03MB4058:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB40585BEEBBAD5CA057585C6E8FBC9@DM6PR03MB4058.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SQDbZPnQuQMHLKMdbt7nls5ni+A4xy/g4Y8ZXLMyDb6q6zbRk+w/BpwlmR0a52cylsBjWtQjKhhip8C7jwuSJlwLnjjjMOaIZfHKaez/x3fo+jlZds7iaT8nyXYsxStI+GJ3WLoDvkse5iEmZvgM1I2McDMN/voHY4XInAW6BUN4gxy77mpx6tXtlYVrGLc3R5k6yC0YlYfi0PSDEFPDY5EbtfjK4mVkR/KJK/yNkpCXPhNI/AZAcoRkvm1g8Rz78W1+XQJeu0fQK5New+qr9Va5NcXuCsnUmufqY9uTevDQyU5M0R/MbA9GZKCPj+NnBHxLALMbvqjMQZPiCO9zvB9tqh7XG09c+ZHjGi7nJ7BK8pf0/9Ydwg/vmvstTdgcqR/CvqW0vvYe2A7ptXPdgMSYSEVxXV3q72fPz+EvnrxR9JGDU+/+Rd+AmOPS2qR7Jxsg9igdyH66pqmuBdyJDCENptLwqnrpbgUnBgbsv8FfPa/J5P7bc4uI4mx0cK4/cbvaz9mvS4MXvsJCxncN3dlnVGo9VgK9ySVH62outQ6iSILmSP6GQumgaHmclBV/ii1d8Izvsk7FB/EvZ7vXEa8f86oXn9tlPtpaYO1A7WHgD2hWo+KYR+OVCVpPZhhV4S/AL9QwiwwfU9opRwIhdg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(54906003)(82960400001)(8936002)(508600001)(2906002)(8676002)(85182001)(6496006)(38100700002)(6486002)(6666004)(316002)(53546011)(5660300002)(26005)(86362001)(4326008)(186003)(66476007)(83380400001)(956004)(66946007)(9686003)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUJ4a2c1UVZKSFV1SmE5eXBENWI4cGlTSnlySGhOSncrVytMVEg3RGtvbVFB?=
 =?utf-8?B?b01QTmJTV1AxanVtZVBsenB3N2hOMDlEQ2tZY0FUenJTUXBRWWtGeUd1cyt6?=
 =?utf-8?B?Rmh4NEIwM090ZnhlWlN6MjVwb0JyU3gzTzlVa3Bpa2RMeEtSMDVOWVNFOVNQ?=
 =?utf-8?B?SlJhcnh2MlptOVlnRWNMYnk2SjhxUlJPbC85a0J5aGlVTk1XQ2ovOEdsWklQ?=
 =?utf-8?B?U09HUll1YXdSUytQekpFdjFWS3lOditEanlpbndteEhNdHc4WitXVjVEQmw4?=
 =?utf-8?B?VTU0K1pXV2R6bjhraGVWTzVwdnBYSzFtQ2R6bEF0NU5EN0ttTFJ4QyttVTBO?=
 =?utf-8?B?aFZLL25YYWI0dklqZVNleDV4d2FxK3JvUjNZbk9ITXdhcVREWEx4WmVQdGd3?=
 =?utf-8?B?T0pUTU9PZEwzaEhxUVFnQjFmRW9YSWpMOWp2WFBZTUIyaGpISkIxL05uc2xU?=
 =?utf-8?B?cGZWOHlRSFRJcU1sbzd4NnlWK2x6TjJCd2pmVEFVKzdzMlVLb0NrcFdlS0Jr?=
 =?utf-8?B?N0Q3Nm9YaHZyaE95WjhxMmRCTzVoNitnVVRmblJVN3RzRlBvZUtKenhkUXdY?=
 =?utf-8?B?aGl0eTFDTXdteW5iOUVYdDhBQ3hpZktiN1loTjhqaDl3akJwZkhDRXNBRGNX?=
 =?utf-8?B?NTNGNStUamNOc29GaVdtZFl5WVlUUzFiSFI3a3F1T2U1TElhYjQ4QW1vbzY5?=
 =?utf-8?B?aXhDZFhTeWM4UXJOK3hIRjdaRi9nckx5RjZPb2NyWHdlWDVYUEZwQU1jWlVK?=
 =?utf-8?B?Ty9yTWovT0RwcDNqTnZhMytBc1pHS1NqY2JDSklyWk0wZTR6TnFzcGtaNWd3?=
 =?utf-8?B?NUhEd2xDRm52ZDVNOU5PelcwdVR0UGFvVXN6c2kybGpOVlhsdGhHSEVOYWZs?=
 =?utf-8?B?cWJ6MmZMTllnd3BKUlpYT2Z5alVkblk3ZzZheXRtV01SRGJ1ZnNLZStyTytp?=
 =?utf-8?B?bGRiSzlrWmdIR0lHckVRWk1rVzFJR3J6MlpxS0lPc0h1UUhDWTIvandwZFRx?=
 =?utf-8?B?RjJBTFQzZnluRVRSc0JjalF3RDIrNVIycnZHTlNWM2hFdkR3WUZEVFRtM0V3?=
 =?utf-8?B?YkFaVlJZQ2VBUXR5cUpQOVl3Mm9Jd0M5ZWNnSDJ0elJWbHlhUkM3WGx5MGov?=
 =?utf-8?B?YUh2RVhSMGcyTTFEL0ZkQ0dXUnhNZTNtRHkzYkJVMlV0SnZsL3c4TWpnZ0h0?=
 =?utf-8?B?YTFwdysxczYxUGNPZkJlVjhFL2puTEhZNm9qMnZvMVZiblV5eEIyY0s0VTB5?=
 =?utf-8?B?b0tiaG1NUGZ1ZUpXd3luaWd0S2IzYUxHV3dOcXFKUjM1NUFsdVN4NDZOOWJp?=
 =?utf-8?B?QWpJc201UHZyZDNaamRUVUp6WWlvSzlHT3dZY0dBZDM5Zkh3a05IdFhPb2ZR?=
 =?utf-8?B?blpyczQ5d25BRjZGUEJWUHdZYXRBVE1qNWZOL3h0TW5tYkZnaGtsWjhhY3BH?=
 =?utf-8?B?alJ6RVBpTkpKVTNkbnFLR0NpNVYxVTIwRy9GZTRvNWJFVFdnbkZHd3NEMUwv?=
 =?utf-8?B?azVsQVJjaE9KUjRxMnR5T0FhaC9WamowWW1hTjc5cXk4VXNiOTB5UjRoVktS?=
 =?utf-8?B?ZDNLY2dPYnVYYXY5ZWk4V0FRcGU0Snl5NWFvcDhURTlZL3ZRVVhxQ1Q5dnp5?=
 =?utf-8?B?bHBEdmxnREVqYUJOcERVamY5NGYyRm1WM0o4NmhRd3BmTVJ1akhPVXczR21x?=
 =?utf-8?B?TWE4cVhmODZOYnZKVkwyRThzM0dJblpxZHZpUlI0S0hWbnl1K05SSkYyb2lP?=
 =?utf-8?Q?JmaGqr90PE5UiHTqxIMzfNJ4uku7saBM6UGGJ0/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dfc07811-8f3a-454c-6894-08d9923627dd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 12:52:34.6497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wMsJfOo6Cpf8386vTxQg89rTm/zbU5bX3GounF4JBWXS6/S0YwaG7UTUyU+8jEB9dcBiA3A4YXV+YbqdESEcgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4058
X-OriginatorOrg: citrix.com

On Mon, Oct 18, 2021 at 02:17:39PM +0200, Jan Beulich wrote:
> On 18.10.2021 13:19, Roger Pau Monné wrote:
> > On Thu, May 20, 2021 at 03:34:28PM +0200, Jan Beulich wrote:
> >> The SDM specifically allows for earlier writes to fully overlapping
> >> ranges to be dropped. If a guest did so, hvmemul_phys_mmio_access()
> >> would crash it if varying data was written to the same address. Detect
> >> overlaps early, as doing so in hvmemul_{linear,phys}_mmio_access() would
> >> be quite a bit more difficult. To maintain proper faulting behavior,
> >> instead of dropping earlier write instances of fully overlapping slots
> >> altogether, write the data of the final of these slots multiple times.
> > 
> > Is it possible for a later (non duplicated slot) to cause a fault
> > ending the instruction without reaching that final slot that contains
> > the written data?
> 
> Yes, but that's not a problem: Only faults are required to be ordered,
> and when a fault occurs guarantees are made only towards lower indices
> (read: all lower index writes would have completed, while nothing can
> be said about higher indices). All non-faulting writes can go out in
> any order (unless there are [partial] overlaps, but afaict that case
> still gets dealt with within spec by the proposed new logic).

Oh, OK, so it's fine for a later write to be 'completed' even if one
of the previous ones faulted. In that case:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

