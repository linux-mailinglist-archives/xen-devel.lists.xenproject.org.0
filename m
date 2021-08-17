Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB593EF0D5
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 19:22:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167986.306704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mG2nE-0004rW-9l; Tue, 17 Aug 2021 17:22:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167986.306704; Tue, 17 Aug 2021 17:22:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mG2nE-0004oh-4g; Tue, 17 Aug 2021 17:22:28 +0000
Received: by outflank-mailman (input) for mailman id 167986;
 Tue, 17 Aug 2021 17:22:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cSHW=NI=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mG2nD-0004oV-1S
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 17:22:27 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 827b50d6-651f-468d-9a8c-4f60400b05ad;
 Tue, 17 Aug 2021 17:22:26 +0000 (UTC)
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
X-Inumbo-ID: 827b50d6-651f-468d-9a8c-4f60400b05ad
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629220945;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FmJyJnUsRGr1TOh58oMFGKf47AtCL4r9ew5RJrM251U=;
  b=Cq/ijak3qtgah2VCAsJQrkvnreWC8+YMYJ05ZawwyY4KDBtd4pwxvkEe
   Iyq9rwIXy+J4DL8h1t4ZyBWo/zv2ZZpsqG7rndSFDCXE8PUdjIfXF9x4N
   AsMKDlWFhffw8tSW8gYmNUtGti1HsLYOQVO/3Jt9gdv4gBAnRVlDsVltS
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: JjRT9r+MRYH6904uSjMLWWnGAeRTlDJmfch70W5keQPNsaa2QI5o+xyUMP5mI5TU4Jug9WTpTe
 4o0FphhVkkdnUYLXFhnVzKi5+i23NZ6GqWFxFvYvou87HcRx4O21n3GUiIw7NyaXpRAe5NIvf4
 disos8GbtE5bjMuktklsDRVdFLkoWlipkLyVdpdbFNbeUBX5US566TglzKzL5wICYZQ6Eg9/2Q
 pWwL9+MLoD2EeyPEUqQ92jC6mM1zOZdd/qNt52aD6IvSRCF9IVthpSg3jPqs765XbVMxYBYDCa
 iF8mSnbZ/UJyHdQ9WksBpOea
X-SBRS: 5.1
X-MesageID: 50643792
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:QF+AZaxWUeowC49a+XEpKrPxrOskLtp133Aq2lEZdPULSKKlfp
 GV88jziyWZtN9wYhEdcdDpAtjmfZquz+8K3WB3B8bcYOCGghrVEGgG1+rfKlLbalbDH4JmpN
 5dmu1FeaDN5DtB/LXHCWuDYq4dKbC8mcjC74qurAYOPHRXguNbnmFE426gYz1LrWJ9dP8E/f
 Snl656TnabCA4qhpPRPAh1YwGPnayEqLvWJTo9QzI34giHij2lrJb8Dhijxx8bFxdC260r/2
 TpmxHwovzLiYD69jbsk0voq7hGktrozdVOQOSKl8guMz3pziKlfp5oVbGutC085Muv9FEput
 /RpApIBbUz11rhOkWO5Tf90Qjp1zgjr1fk1F+jmHPm5ff0QTorYvAxyL5xQ1/80Q4Nrdt82K
 VE0yayrJxMFy7Nmyz7+pzhSwxqvlDcmwtmrccjy1hkFacOYr5YqoISuGlPFo0bIS784Ic7VM
 FzEcDn4upMe1/yVQGagoBW+q3qYp0PJGbBfqBb0fbligS+3UoJjHfw/fZv2kvpr/kGOsF5D4
 2uCNUbqFlMJvVmJ56VSt1xGvdepwT2MFvx2VmpUCPa/Zc8SjnwQq7MkcEIDd6RCeo1JbsJ6d
 j8uQBjxCEPk3yHM7zH4HQMyGGWfFmA
X-IronPort-AV: E=Sophos;i="5.84,329,1620705600"; 
   d="scan'208";a="50643792"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAZ52w3l4DNdPZUL61hgbPN+BCssIQXnVmqtzTHmCaylv2ce0rj4EgZo1JsLT/UDvM1B1ZLALn+A0MGFR9Ax4cS3/wiKypUqfhPkbQkM+hUcyTjFHX8m1r6pCOosOavGzdESbo65tGjHUajui7oxX7REqZ7EEdNuOxfiZ81LecCB5T4SgbqfMGa81XGVj7N3YdiAKdsyzydOsT0zQoI4BFWXw3npq0EncB8wEiUKXnobzViJqGo/wzGJfJF0p/MJ4rgV4AkbJh28N6PlmZomJQ3uo8+UReH5yD7BTx9DF8m82VOX+owLyLNv+MXhS0skbhUvt5B7sYt0mnteHSatsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FmJyJnUsRGr1TOh58oMFGKf47AtCL4r9ew5RJrM251U=;
 b=LaBhXuVNLYXTsxVV8/Yc8qM9uRHIiH2/FmZuzS0KHPH9UbRKAoam3p7MyxjapRzWEs3ojFQXlgtgxw0t+BVHXw/sSR1zkBSehNiHz+d4laUHgfoTBBxU1XfloPpjKU3LCB5vXMrrAq8AEzcamahElfI0UZnPGSMA2xWIw5IFOzSQO0P571dDwDCpenY2wFsrXdSfsCC3di7AOnIXUT+YCid/ByE5Yp8grp00XAIz0P2D1WNbSZ8o78ToMk8ikMtsJbyUEjYwGZLEUZkEPwz7WkpYPLHs8BcKlsJgRyJG3IgD529ceb7JVaiFfapIYPvUD3Bn4JsAgOyKUa5pCZtCRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FmJyJnUsRGr1TOh58oMFGKf47AtCL4r9ew5RJrM251U=;
 b=cen9zYwW0YgxSU2jHe6gViryxpIn/8zYg6hSGB+eq2vqmjM6jDOTttksLrg+zIEMfTiKGFsR6WBuNTUShwLGEajinRUGDCoRH0Ifh3YN1t2GBVmGwe4v9S9NG+74M9ffJzwRj1nSu0fyi4m3BPFVMk+COtJG0u0ayTYQxkLzBvQ=
Subject: Re: [PATCH v2] x86/PV: suppress unnecessary Dom0 construction output
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <39b949ad-4052-c577-a726-e1b8fd97f099@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <fe938f1e-c993-5911-64ba-2e7b36f11576@citrix.com>
Date: Tue, 17 Aug 2021 18:22:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <39b949ad-4052-c577-a726-e1b8fd97f099@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0157.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a12276fe-2c0a-47cb-0fc6-08d961a392ea
X-MS-TrafficTypeDiagnostic: BYAPR03MB4358:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4358DF2AF706818CF66BE07ABAFE9@BYAPR03MB4358.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tl6XdDWDpiroQ5jwOG4H2J3eUlhddIQIC6Uyb+67Y/7Bj/k9DLl+R1sro+qBSHlcaqwGBOUGiBlRInuhDhQD0jzuJ6GDIkI/1jCRIvRUegye9vH3YwOGFT1bh0Vj83sVrTbslItOYwv0knPM8xG/XI5shZdYTH0TjeSRDacbM9kGmx5nooGnJ5muUkhSU/jy6ITjZK786sVFEPYRH6WSeDVOEdSyNZOXE35tabuiI12JON2np/y5GsSmfdgXwQEm2kIJgxu7RDiCp9tDyFYYQblL7/LgpWE5XKoog60abK9MEnfOmPwH1CgThid1OICS7VciGTtQuU8NYqXjKTyYi4q0WLe3wPN9Hmr9yNCNgbzuhZ9L450SUTLmL2Acf3MpBb2IfbsKhB60TgJIqZma7w6Aoyb7ig8xVO95awMQWaZe6kK5LifSry689dKWPJwrNGWJv2rW2OtbysKD1+BT6gs24ZXH4+ZM+ujEy8wO2cV3JW3uvDQpbp60g4kU0JWPRJzF2CpGfZJ1jopVu9euG1fhNg+OZtvdkwTcuelyORaDSx2OqqCA+d3V9JDKJjHQtcuvlPmvwxWwLO8BzKuDKv/qyXmVTp3iaeWe/sTesSXblJW/z/HT6Z1wACoHmVQU236If3FZ9W36dHHAZ3JPw4IWQGiMpM5Fs7EEAgobaevnFJQOUpPM5NfwK1gAwx1gNJh2n+F1DzJVEzXlJk+qFK3YWPB0jgd5QCQvKIPVSwg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(110136005)(31696002)(26005)(36756003)(8676002)(186003)(8936002)(31686004)(54906003)(86362001)(956004)(2616005)(53546011)(107886003)(4326008)(2906002)(66556008)(66476007)(4744005)(6666004)(508600001)(38100700002)(66946007)(16576012)(6486002)(316002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1IrZFk3M2xQZFFPelRuSGlZTDNFN1dsbHo3MFJIaFlhNVRzak9FaWlEbEUx?=
 =?utf-8?B?L1hhYXJBMkNGc1RUYWd2U2JpVWZDYjQyMmJEUEwzWTJTaVlaelpYakFJOUtm?=
 =?utf-8?B?cE5IVTdjZWluVGd6bzBuVWpMYnRuMFJhVitLVnZmSFFLNUIzeGVaNnkydkJH?=
 =?utf-8?B?SkVFQml5QjkyT2hSWWhvM0Y0TUlXOXNuaUgwdkVOS2hDbW5TM1Z6RVdnVFNj?=
 =?utf-8?B?THhzV2poVHRHR2lRa3p0Qmxud0ROcW85SlM3SlBreWcyYVZmOVlwaTNkVG9j?=
 =?utf-8?B?MXBSVzlVTm1lL0gyeStMeUk3SmNOdVoxVk54bjZYdUpJYUc0djNCcmhVT0pJ?=
 =?utf-8?B?NWEyM1lqK04wazlqTVFZTS9kYzBzU0J0VmJsLy9nT0ZncFZrM0VudTh1TFB1?=
 =?utf-8?B?ekxuMzlDcm4xMGhyRWQ1S0hKK3NFRWJBcWsrWUhBTWtYZHhYaEJhVkFHREw4?=
 =?utf-8?B?dHhoTXluczB0SlVXNGtESHZVSWdwNmNkZ1lrd1l2OFlPZmxNczExNit0VUt4?=
 =?utf-8?B?WXlRR3RmamRrbWc5d1ZrRGZvYTdIYjgyWGhrU3dSZWZLNVpJbmxWWUs2dHBm?=
 =?utf-8?B?b3hxZEltSnYvNCsrQ1JhY052MHR0RTIxMW9NbXIwOW9vMkFNTXBiOHpPQUc5?=
 =?utf-8?B?YmhDR0kyZWJ6OHN3Q3dPRE5FSlUvOThzdGpSbmFkY0tabml6bCs4bFkvRFhU?=
 =?utf-8?B?OTVjRzNDd1BIYXF4a1dTeExWSXdidTdORHBxWkF1YTdmZjJsNE93MisxYTZv?=
 =?utf-8?B?dGpxY0VqdjJhL1haMHJnQWZSWkVFVkZLUTBrc1NQVkVxZmJQZnJ3TnpOcFhB?=
 =?utf-8?B?MVE1clVTYW5VMlB5TmxWYS9jVmlhNjdxTitHQklnZXpreGV2Q1BPOGtZcjhL?=
 =?utf-8?B?c1E5Y05PbjBaSzZCOU5DVHR3aXh6dzlyS2JNdHhlRGZUU3BWdG53eno3c21z?=
 =?utf-8?B?RzMwcDQrVEo1a1k5ZGdzc1ZRc2U2Q2Z6K3pnb2hVNVZncS9LODN6aEl4RTJo?=
 =?utf-8?B?Z3pUeGdxNUVmZlAzcS9zVTZ1Ri8rZkpoUXdCcExQMVhucXNHb016VXhHWGkw?=
 =?utf-8?B?U0IzZkNjeEUwN1ZRTUJmZFNxSllENndtL1ZZL1Z1NGdsWXEzajNHM2taWTVS?=
 =?utf-8?B?eHhEaHpZWEY4eGo0WW5uUG05cm9NM1ZXSXEwNmRuZzMwU29iSG9DVktrWVg5?=
 =?utf-8?B?WDZodDhEUHd2cHpNN0dLWkJTY0ZHYUkyM2VmWWJKc01MbmRCNnZtYnVWOFYw?=
 =?utf-8?B?REsrSldtTGI4dEVLcFMyblpRNitYcmh3cjB2ZmYzT3gzZkdReFdVQU1mdDFh?=
 =?utf-8?B?K0RlUEh6K2JFYWN6a3A0QlhwdldtdmgyU1BhWHNSYWdoVzg5VnNYTGxCT0pZ?=
 =?utf-8?B?blp5VGFqME0xU3ovaUs4L1VCaUFjdUpCdDZVRlBXVEx1NVkxY3VXd01XSWVi?=
 =?utf-8?B?RlA0dkdDcUNDV0cvUnVjRXZoZklCL0RKRjZKNUdybUFncHBQTXNvRUFmb1dk?=
 =?utf-8?B?NFpPODdlV3lDcWFvdldqZDMxMGQ0aUEyS2d2N0FUNXJTMHM2WTZvT0FMMkNE?=
 =?utf-8?B?dFFGZ21Ta2ZpK2RJMmw4Tm91NGxSR21oRmdnTnlvOUZsUXl1SWh0d0I4dHlx?=
 =?utf-8?B?dlV2bkVNVmZmc2lZbVloWlZQd3d5ckZZSXZ4R3RCWWM1eFl4TmdDa25va2dv?=
 =?utf-8?B?RmNNVCthYVZqNWpvWTJuSXhGQWx2ek4rV2lrZXdXeWxmVHFMdmcxek13aEkr?=
 =?utf-8?Q?Jq+p0mYHisA7IDIbfNadURIWwJsHDmr+GxBajwl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a12276fe-2c0a-47cb-0fc6-08d961a392ea
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 17:22:22.6369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0KXnobdkKs350V6T3sUwfmm/LTp1oN7romc4S4DhNUYSn9romg3/ScDs7ylEsiW9PoI2/RVlUeVB+fitfhUWLIsbxuvT38rp5x9bh6+YmKw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4358
X-OriginatorOrg: citrix.com

On 17/08/2021 15:27, Jan Beulich wrote:
> v{xenstore,console}_{start,end} can only ever be zero in PV shim
> configurations. Similarly reporting just zeros for an unmapped (or
> absent) initrd is not useful. Particularly in case video is the only
> output configured, space is scarce: Split the printk() and omit lines
> carrying no information at all.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> v2: Split printk() and replace / extend #ifdef by if().

Much better, thanks.

~Andrew

