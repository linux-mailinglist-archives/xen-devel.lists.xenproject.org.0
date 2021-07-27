Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BD53D7487
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jul 2021 13:46:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161131.295866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8LWp-0001us-Me; Tue, 27 Jul 2021 11:45:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161131.295866; Tue, 27 Jul 2021 11:45:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8LWp-0001sJ-It; Tue, 27 Jul 2021 11:45:43 +0000
Received: by outflank-mailman (input) for mailman id 161131;
 Tue, 27 Jul 2021 11:45:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ggmi=MT=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m8LWn-0001sD-F8
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 11:45:41 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35fa39da-c7ab-4d07-83d9-40aa2a2dd26e;
 Tue, 27 Jul 2021 11:45:39 +0000 (UTC)
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
X-Inumbo-ID: 35fa39da-c7ab-4d07-83d9-40aa2a2dd26e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1627386339;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9XNQWT+1+fdTr5URNJvlMXkkbeBP2ClmameIKCKllqs=;
  b=Vk9+hCzCkLW0TMaH4xROSwwemdCogse5slaS9P4D5kZ5Woxo2DI7/3cs
   hFkinKSVTuevGja4akP92ptBTToWB823sgpm7HMsf1V0YtdY/fileqtUM
   kMGi78Ln6Tr/MBGkP+uUfSSYlQ5GvZWxuR1BBvjuFu2jAJeM6LvkVJtdu
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: MMO3QKG2rNe5HNGm99oN4o5hHF/SpN5GYFYB9UTSDx2gQxTNJ8Lej6CbeVg9PNdjgzKUnvYtnY
 Vu7CCGbmEbQtNF/Wano3U6YAK/rZdB8P7Gr26Avy0BtAYBLDG42gloJMd4NQDpPclcABVeXFbw
 DmDx7rXn95KEtkNL76nKm4oYEyfnyM/I/4ZrMrR2SbQoj1//tNiq766Xyhlqg9pDm+9HKtQnOj
 HMusLG0tDqNAwia6vS7IZXIFao87Iaz1YQjthTIk9Xr0XAkLG9BZI/KGLCJvfRA4wKWsTVsJ/D
 oGx3oQ3VdK0x3ePDTXRIBY5r
X-SBRS: 5.1
X-MesageID: 49172018
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:DjVs+6pqysdn29Gau7b69jwaV5ulL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBbhHO1OkPYs1NCZLXXbUQqTXfxfBO7ZrQEIdBeOjtK1uZ
 0QFJSWTeeAd2SS7vyKkDVQcexQueVvmZrA7Yy1rwYPPHNXguNbnmNE426gYzxLrWJ9dPwE/f
 Snl6h6TnabCA8qhpPRPAh6YwGPnayFqLvWJTo9QzI34giHij2lrJb8Dhijxx8bFxdC260r/2
 TpmxHwovzLiYD79jbsk0voq7hGktrozdVOQOSKl8guMz3pziKlfp5oVbGutC085Muv9FEput
 /RpApIBbU811rhOkWO5Tf90Qjp1zgjr1fk1F+jmHPm5ff0QTorYvAxz75xQ1/80Q4Nrdt82K
 VE0yayrJxMFy7Nmyz7+pzhSwxqvlDcmwthrccjy1hkFacOYr5YqoISuGlPFo0bIS784Ic7VM
 FzEcDn4upMe1/yVQGbgoBW+q3pYp0PJGbAfqBb0fbllQS+3UoJj3fw/fZv20vpr/kGOsB5D4
 2uCNUaqFlMJvVmJp6VSt1xGfdepwT2MGTx2VmpUCDa/Zc8SjrwQq7MkcAIDd6RCes1JbsJ6d
 n8uQBjxCIPk3yHM7zG4HQMyGGXfFmA
X-IronPort-AV: E=Sophos;i="5.84,273,1620705600"; 
   d="scan'208";a="49172018"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XGpQzwM4KEa7Shzjqg4KEFUujl1zfhgjr3Pyc/2XIKPo5I5eVuDEvIlCP6763KfU0BhJes8saUESUeHWn3EO8gWsxzgcMRSv5+OC54F9vShFt4e5SJWgacQT8vnRpbq4gFAb+1mZOFu9Fbs6sJZVcMSoRSqjiqgKgHRLEBCoNJEyJyGxOrcp4ZYXb9e5+RSraZnRZyDjjXD1Gqi3Rq+GhbfGwdJtcmAl8Kuom0PEFqitmXqV1oFDAQRSQtbXRFIeRygXTisEW//MnmewV76vTCX06c6tuwBLiqqZnYZDRT35yY8s6eS/fXrT7k7xclcZxbNSHoQ7OsnM9TIX7qmzXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+HcPvatENNCggjaKhyQcvrTaMvXj6YAD0XWzhc5THaA=;
 b=QbachIiJCQFIRArT/i8rkemjJQfbTmKwz3GlNYr2JWxonS0WyJnDGmJ0+lwqEVXjgWLu7Oeoc6KRtS1YgwNsdb6vqJVfJQT87HmyIvd39MM0EwPPqum/JAtVFkroSZScy7Wa2Lhv9XEds49KMct8cT/DWVPPw9hKSLUMVyIcf3Iqd+3juIQ1f3wQmhf7Mc69zxegqcpUI0GsGajGTcXyG8pl/8uVwGrbu2eYyDacktrDs4blh99zlbMFzlwk4DRGZHxoa+jX62DfOb5+RU7sVX5oFX5t0ElDVmt/Ze0FQOCzwLN8s/FATGlWNeEkZ7g5PU+fMI5Jda9WYKJCIArOig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+HcPvatENNCggjaKhyQcvrTaMvXj6YAD0XWzhc5THaA=;
 b=r9C3Kqyg2lLNv8wX5NEeWwqaQcjSXzwlGhCZ+ioPFiUOHm4SKROpOWfbOO6zwU0gqJBrIGuoYRicnSMIZN+d3gESEQSbxdui/inDgw2D8hm/Xq8VeRGSRA0J2dBC7Futoz+ja2wOd8p3AAHcJLDEXqFFOw5RocO7xVsSM3vfngM=
To: Scott Davis <scottwd@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Scott Davis <scott.davis@starlab.io>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook
	<rosbrookn@ainfosec.com>, Anthony PERARD <anthony.perard@citrix.com>, Juergen
 Gross <jgross@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel P .
 Smith" <dpsmith@apertussolutions.com>
References: <8ee22fab0731347dd7f998c5f336eac804785c28.1627014699.git.scott.davis@starlab.io>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] tools/xl: Add device_model_stubdomain_init_seclabel
 option to xl.cfg
Message-ID: <dfc8bc88-ccab-bc6b-704d-c8ef95182311@citrix.com>
Date: Tue, 27 Jul 2021 12:45:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <8ee22fab0731347dd7f998c5f336eac804785c28.1627014699.git.scott.davis@starlab.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0168.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47ce139c-e271-4f08-b61f-08d950f40bf5
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5533:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5533450AD39499A187C9D5BABAE99@SJ0PR03MB5533.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RAsGRfTfzlZlHPA7JRU6G3+GX8XkoZJPraJ2REVZw2lOKJ86jDfx6ILmMv62htHjsh0QrxXuUbpX25e39xijXk2AXBA1OFG/pbwD6eFmUQKKQwdz/8iwClBHP8eOTeOLeONPNjnd7iLnghY+xyPtRIEYy7mGUvKh2Vpjc5KOhULMrojUJaFe0XKhR6PqLJi/rWZVdaUBqB9lCbO4GTK0izbUi1B4B/hoHNlMytYCDr+cgmzCO6E3T3SJSh9h4ybwbrURsVYOKSLsVq7Yx+9hHvscljeUjl54dEkrxGT00dL36JzqkS006UFMK6WYiVy+AJWqiJFpyl1zgi8abjjhZDCzRu5Fz/KCwJDiU5+I4OwYPcti+yi4jyai5LxgHfuzhRdai7TOZGUHI9346tPvKN/nAOBUiXhReMA/Xu11enTEYkAXtHtoNVQpzDs2f+dD85/E0ye+gd02/pZXvoPr6q0i5ztaEHpKg4zcoJV2vv5ogMxIhdYPz2jR2ZgVWcxfYM53WMYlmOFox0iQBDYorHr/n6z0CVgi0lDpB3vk103RSiFVRSUzJKBnnBYwRsNtuRNzf+r0kee/UciCZ99RSw3yhI35nOW7swwj3OCw3LWXjTVVVIe/9Q1PcVeIH+FFcrUvsSFXhwbkThD/Mig3Lfg6VG11bJtNLyz0rEo/mzO/o70R2MPM9/cblcUdupUrIaPgevRcZocXwoy+fn3inHJS6/KQUijVxYV9vTp6Vh0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(366004)(396003)(346002)(376002)(54906003)(31686004)(8936002)(86362001)(8676002)(186003)(36756003)(2616005)(956004)(4326008)(316002)(26005)(53546011)(5660300002)(6486002)(16576012)(66556008)(478600001)(2906002)(6666004)(38100700002)(83380400001)(66476007)(66946007)(4744005)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wjc2MjNOWDFhN0hqY2NlYjJReVJ1RjRsQW1JOUkrVmVJaEJlN1JNZENaYnZE?=
 =?utf-8?B?VTNjdHU5WWhhQUdRSCtjRHFsWFg1bEdIay9HWUJSRG5HZnkrT1A3aVdTb1Za?=
 =?utf-8?B?RUU1cmVWeWNDeldNTGFzYU9RSTV6Q3hDOEhKODg0SnVtK1ZTS21vRXBKdHRt?=
 =?utf-8?B?UkIyd1U1dnh5NXByeUREbWhUNno3eVBacUJoQ01xTEU3dk1FcFFuZUhPRFRW?=
 =?utf-8?B?WGpPa0xxRExyc2NCNnNjaTJ0RFBPS0M2clphSEZiSXlIZFRzNnRlbXhHTlgw?=
 =?utf-8?B?OEJjYkdxRjZRREN0L1NNN1hxT3JDTnpSeE12QkI3S3hoZHU0eXBMY09YNHI2?=
 =?utf-8?B?Tlg2RzBsZk5QVUpFMWRqanJkY255WEU0dk10T1crRDZnWC9nNzA4MkVnRHdr?=
 =?utf-8?B?dHh4dm45Y1VzWmdsU3FCKzVUYVBEZHZVYnBVbnBMVDVBYTR6cmN4cTI5VTQ2?=
 =?utf-8?B?V1NtY1JYQVJPZGlodzYwMzhzYXpQc3B6RFNxbS9uT29GTkZOYjEyVUtVRWZK?=
 =?utf-8?B?dytFdCs5a28rZy9xSmdRWnJwb1pYUlVpdTNCZEt1aXFXbHRVYlpBaWdQcnFv?=
 =?utf-8?B?L0s3clFwTzhpZndERW0zVk8vdmRZdnRTbEpaZkJmNFV2ZG5UelYyUU03REYr?=
 =?utf-8?B?UWlBWjY4SjJVMDV5NS9RTG5ya1gzR2IxUHRXNFdHVXlPUnF2MGRUVU8zT2Nh?=
 =?utf-8?B?MmRURkVoOFBBN00xR3Z4Q1E3bmlheXdnN0FjSHVaUm92TTlaU0trNjl4cEZR?=
 =?utf-8?B?WnMrSFJ6dFRHam9lanROd0Q2Nm5SZHVFbHBvR1VKN25EVzZRSlVSRCtRMm9w?=
 =?utf-8?B?cWV4cm1OZXpaZ1RzZTZvQ09HTnFzRU1hVjlyWjB3UktKb2JWTjlsVlBmOUtS?=
 =?utf-8?B?STdiK1V1OVFyc0lURzZzOE51aEpvTFVBTVYwNkpWb09pR2FhZDd5VW5aUSs1?=
 =?utf-8?B?M01ZWGhKWjhZQzRQdlZ0QXZjQ0pQZGpCODlhY2NIYVBDSnVIRFBmS2M0YnFu?=
 =?utf-8?B?VkNRM2U2WmgwWlBlVkJaUGNDZGk2KzlMTDI3Y1lYVVRjakhuQitpRjV1Z3Y1?=
 =?utf-8?B?N0FJMDhwc2l0RVZGQ2N6Q3lVdXNqeEM0aWd3MTlSakxjbE1wSzY3Y21oODdR?=
 =?utf-8?B?NDAweWdVSnNITlRSdjhSaDFObVdqR3BYZTNSMnhzMEZWK1lqend5MHNWN2Zm?=
 =?utf-8?B?YWQzK3pBajdUbm4vYjZBRHlIcm56azZIT3NQUnJKcW41eG5zMGdqd0Y0T3FC?=
 =?utf-8?B?b3BwYzJVS01TUmhPejNtVGNRU3UwUnZiN1pMYU4yVk9iN0JRdGoveGU3Y2pi?=
 =?utf-8?B?S0MreHR3Z3hHd1ZiUjlvOVNNY3lGbHZQemJ0SlZjWktTeUlIdjQ4QW5vc3NC?=
 =?utf-8?B?anJ6S0JHMVR0dUtMVmJLdW1CWldQc0RON0MwckFZbTBlZXB0bkpHNElSVDhh?=
 =?utf-8?B?M1BOTU9JTktJRTVFL1VTaFA0b2d2SUR1VzZHM0Rtcjg2UExManhWOUtybmVC?=
 =?utf-8?B?eGJaZGlnRFc0OTV5QjZqVllIcXZLeFBYTFA5T0I5em5EeEFaVFdBelR2WmRk?=
 =?utf-8?B?dVZCQlNkK2d6UFBxN1plSk5hWHVyNjhNejJGSHJRbDlsdmV6Q3RxWmxVeUVI?=
 =?utf-8?B?dWtPdllpSkk1ajRLN1JMcG04cmZmbE9abTdHWTIvTnFtQ0tqV2tMTWs2d2lW?=
 =?utf-8?B?V2tlUnpYVmtMWE5QUGNJY2FWWExwUy9VZ0VxZTlkRm42UDBBWXdnSTlQY2pq?=
 =?utf-8?Q?c69o2vkxgA/HHapznmfFmy2y2L75RqW2Bg9e2N/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47ce139c-e271-4f08-b61f-08d950f40bf5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 11:45:35.4639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lblf6bJkAqYbyzpTClUbt5YE0wm2dv+SAgdvi3FZ9lNLKBIEYv+jYdRg83DVVuegL2dd5ppRV6ITVMJZRpcSyms4TFrlEhjA56AS0fwWvVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5533
X-OriginatorOrg: citrix.com

On 23/07/2021 05:47, Scott Davis wrote:
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_cre=
ate.c
> index e356b2106d..a12da5531d 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -1060,13 +1060,31 @@ int libxl__domain_config_setdefault(libxl__gc *gc=
,
>          char *s =3D d_config->b_info.device_model_ssid_label;
>          ret =3D libxl_flask_context_to_sid(ctx, s, strlen(s),
>                                           &d_config->b_info.device_model_=
ssidref);
> +        if (ret) {
> +            if (errno =3D=3D ENOSYS) {
> +                LOGD(WARN, domid,
> +                     "XSM Disabled: device_model_stubdomain_init_seclabe=
l not supported");
> +                ret =3D 0;

Surely this wants to be a hard error?

Not specifying a label is one thing, but specifying a label and having
it not take effect because code was compiled out of the hypervisor
sounds like a security hole.

I see this is a pattern copied from elsewhere, but it seems very short
signed.

~Andrew


