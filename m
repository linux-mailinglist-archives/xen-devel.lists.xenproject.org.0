Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A863B4916
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 21:01:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147377.271623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwr4A-0006Xa-Gt; Fri, 25 Jun 2021 19:00:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147377.271623; Fri, 25 Jun 2021 19:00:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwr4A-0006Ur-DV; Fri, 25 Jun 2021 19:00:38 +0000
Received: by outflank-mailman (input) for mailman id 147377;
 Fri, 25 Jun 2021 19:00:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eNyz=LT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lwr49-0006US-AW
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 19:00:37 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4869df88-89c9-4922-b74e-087207e8dace;
 Fri, 25 Jun 2021 19:00:36 +0000 (UTC)
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
X-Inumbo-ID: 4869df88-89c9-4922-b74e-087207e8dace
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624647635;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rLDLYRwMboHJFFFHeECdEkav7NBJo/2jsE9a+LuF7ZI=;
  b=AwQh9IY79RulwzJfZO7BDMQoOgSKUj1tLtg2BgdHqKZViUTNl17bPYDO
   aQTGR7pHg8s5U383+gWJqbp5NJC2bO4DhPra5pKLRoRhWdxNswHddl0sB
   j/jKBXvuE1da+HO+ggAyiuOv6p9TyOZ/eM5xbWccdstgFhaVY3Ydsd9ts
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: UwFocDfWdxzpMhE0JG/eCIoeteSBtf333rQGGqHrl3l0WVeEozC//iaBbGOKfJANLGxTeCAgit
 IlwHoJQ4LViz6hBcQFXkRuD89QtQsYr9bWLCilgsLaXvYY1JjD++F9Nf7wQH6MYOCsLvxj1hKz
 y0Q33fZiHAjZnCI1gNbjfifqfhszsStSxW55EQFa3h/d/TbC3uJAqDw0qV1dVY5h+GWSR2xcFB
 TYpj2X58fGw8kBeKjM5xKgyjk62UqS4n0BzlB709h/WZEQaEtIe3R2jd52ThWsFfiWiGth+t1E
 NKs=
X-SBRS: 5.1
X-MesageID: 46713366
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:KoKFYK+4Go4zhqtyeT5uk+E6db1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Scy9qADnhOFICO4qTMuftWjdyRaVxeRZg7cKrAeQYxEWmtQtsp
 uINpIOcuEYbmIK/voSgjPIaurIqePvmMvD5Za8vgJQpENRGsVdBm9Ce3am+yZNNW977PQCZf
 ihD4Z81kGdkSN9VLXLOpBJZZmNm/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjMTSSlGz7sO+X
 XM11WR3NTjj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhHhkByhaohNU6CL+Bo1vOaswlA3l8
 SkmWZvA+1Dr1fqOk2lqxrk3AftlBw07WX59FOeiXz/5eTkWTMTEaN69MBkWyqcz3BlkMB30a
 pN0W7cnYFQFwn8kCP04MWNfw12l3CzvWEpnYco/j9iuLMlGftsRLEkjQRo+M9qJlO91GlnKp
 gvMCjk3ocSTbvABEqp51WGqbeXLwYO9hTveDlJhiXa6UkPoJjVp3FojfD3pU1wg67VfaM0rN
 gsAp4Y4I2mcfVmG56VJN1xDPdfWVa9DS4lDgqpUBza/fY8SgzwQtjMke4I2N0=
X-IronPort-AV: E=Sophos;i="5.83,299,1616472000"; 
   d="scan'208";a="46713366"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i75wVq6q/PQIP2qwxKc61QcV+Qk1PEbukeHMI7U94nlGZW40BJ5lu7XGukfKvl3j3aGGiUSf5pDtofcWm4JmJkcS77mfAuZAcqjz40IXh4X12BRfLQ0pOHP12ee9WNTaTn0UyHZyqphajcxZCcxtle2utHroq8Rw6VG351z6pmEuCr4TGvzhY8+C5mDPlR9Y7rfpy8NXCfepHn1I06vob657Q0CUiuwLughaOUzSLo5Pm7LVAYlz6W/2kO9l2GKhCWuKauh2dCY/eNXYDPXjyTY/M7aqxR1Vd7BJ7oqnNiPYfMyHfKIaSLD7UUC42kyx5u80lfYP39Nzw8TeVVZZRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yPGvVCo7omd/hK9DMmyUOmC/PwZNwFLSWdPE566IVlg=;
 b=UAG4LadrOpHvQsuTSsNC6uT78aNpcBACuCcy88/egVJ4tK5CoaM9zuuDITytHxZlUG3mYG0IqT4QFwQbP3ownBeolio1nlqOZF6zFmZQr++Y7Uv1P86B3khcfmnjfhOmxFohN7xJjgjmnYr4T/XVQLX3R3sbkE5VD5wMBLhbLbZ6e9KhQRdGz1ift6PTh8Z7TrW+O7PFVLYsKvevUG4Q+dAFFpl9gX/OJMNAWdMtrsaxCEbOZz1yW9+SUpPWXXh1Y1gkPpsslT2osnR1htjlG70UE94BhPws2cQX1u+p8eJKh7x80OqvccEHiOGb9I25f2WAnw734RQBm9lQq7Q3nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yPGvVCo7omd/hK9DMmyUOmC/PwZNwFLSWdPE566IVlg=;
 b=BZ/pm8byCeZU/bMJBkfIMH0uXePunVNUwY7DJA7GnfxuCNUdWE6G9XgtRX/nYjpklFa0dBB2WB2EElcg+7HEwmQazL0/xJUU3aGIIBlSPrfO53R/xcbXLdW+IJygGqYohsjiR33QSHQUZahVko8fCiRXqsj8XINqRUla5y8femU=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
 <09e81b91-84de-6e49-9a62-eb3a6f392954@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 06/12] libxenguest: guard against overflow from too large
 p2m when checkpointing
Message-ID: <8248ed3f-0437-4ba4-fc26-884e8d70cf92@citrix.com>
Date: Fri, 25 Jun 2021 20:00:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <09e81b91-84de-6e49-9a62-eb3a6f392954@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0346.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8705d08c-7894-467f-f573-08d9380b80e7
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5727:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB57273C03B6F4C3E320BDB35EBA069@SJ0PR03MB5727.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k/g6KkgpOYMMMuyUxeayWeUmcCwFRnPgsma9PJrru8EErjFIYRXEWotjPCIuE49vQBrtyJVR2SOhZ4P0ijSQYD5WSW7WUZJ2q4kJuj/C72B3sIAg1imZ0lGwwfExjjLjoXd60012DkiOliTJh37FIZLjk8Lpko/GvdwEtnUCUZA0mHVZLCANPhIR/w46LRhwp84YucZLzNs4Jsg+9AoVR8t4hf/tPyFWJZ99SyVmk/9/cvh2VVQU+xthCyrrA/FSSwBC4vFSBnU9z1t4UwwoZwWa1QZEycVJJrhTOOHcUFdoTXBQXURIT12/ts7vK0HXg5N3DY2E8DViRGNdTa/KwgD0iVEjNWPHfX80HImmuDw3l3qOek5ny9hSKLpI/ERNu2i4OAiJJqbvjcb06+0+dlOK8DGP8UqgB5qacHbLjTfcsBQ9vmnRhMIDFd+utNGn2mdFAntmj26C9he1I6zaqipgF+vtUzkMDinl11NViXpbAKbpLiv7bk7qBbaMgY0x23ClSWB2UHoQ76g/eUAvgH9cXH9p+IV+EQD8YhOj98SmK0CanNskw8Jr2PhhCELW1jroeuOOZ8hWSYW2KdUCOewJhTnbgGfIdwRpZpRLIzC205CTASBatpEvgboLbV6HA4kkj3n34YPbviH6c/7J/tqEStvZ2hyC8CP+KfRr3/b3dMCRvm9QbEWHnw3nJKZd4zuoiLIGBtPNVU+OH6kp7PJ/PJMEScsyQtdsQrSbR50p7Mwl1YmbItp9PuctMIDV
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39850400004)(396003)(366004)(136003)(6666004)(478600001)(6486002)(53546011)(956004)(2616005)(110136005)(16576012)(54906003)(186003)(26005)(38100700002)(16526019)(8676002)(316002)(8936002)(4326008)(31696002)(36756003)(2906002)(5660300002)(86362001)(31686004)(83380400001)(66946007)(66476007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWNhOUNQVHNzZnozNjZpM2htRkFyY0F2ZFNhcDZ0RDFhSTI1dUp6eHJVU1JV?=
 =?utf-8?B?eUxMTzhnUzlYYkFqa0pyazdwQnVBTFVnejhtRHJUbEJCcUpNd2lKbXNGTy9F?=
 =?utf-8?B?TEFQbWFrUlhsWGplL3EzblNGd1JkT001WUVxTWJhVGllUzNBaXFwL0NhbzZ0?=
 =?utf-8?B?N0R0OFczU1BSUW91OHora3c3U2NnR1QxdDgxaks2bnNCdUNGQ216ampCMFN4?=
 =?utf-8?B?NUtRazQ5bzZ4SDNWUUlNeW44UzhyNFFodmE5SWMveCtBdHUzenFJSnp4aWhC?=
 =?utf-8?B?eHZUUkQzTG1JR29qSERFUWRxVUFOV0FNZEdwaEkreHk4N1gxMzJlQi9Mbk1H?=
 =?utf-8?B?VE9ydm12TEtPeWZSVjQzU0Z5YUZZQkcyZk12WFIybW5ieGxvN2hpY1hrcUlZ?=
 =?utf-8?B?eU1LeXBCVGd4VzRqdU1rNCtNU2xOaUhZaytjdlZIR1AySTFNengzby9wTThp?=
 =?utf-8?B?djhvdU1tdll5aUFpZXFJb0N0eUNieDJMUlFsZVAyRzZKVi81dFcvVmY4anZz?=
 =?utf-8?B?cGFiRmZDVjUwU1RDZXlSYTBWOW9wNmhkSEF1SUFEK1hLZmVNZnRLK2RleU1x?=
 =?utf-8?B?OHNqeGtVbHdlNFkwN1RvTDNqNEc0cEV5V0JGcFVjM0tKYXlXMUJIN2h0dHh5?=
 =?utf-8?B?SE5pSFBTT0FPUXhOYkJZUXplejQvb01EdG1iQy9QWE5NSVVMQ3FxdmdZQlNu?=
 =?utf-8?B?V29PTTJUZG5USmtPclV4T1BnVzg0aDZUMElubW15VnVCZmFzb0NIcmxxLy9B?=
 =?utf-8?B?cVNPZXpzK3kva2hBMkp0bExDZElYbWpHODNrQ28zV2lCbWR5Z1Q1MGg2SHV1?=
 =?utf-8?B?ckFzWlpwTGh0cVVvUWc2RGpBUjBoZFFRbjRadjIybkQ0MmVMZ2V1Yml5em1l?=
 =?utf-8?B?TkIxeGJrOXFIbjh4UElhUXBFUmVZQnoyS2RhRUgvbUVjdWZYZCtqMUdISW9t?=
 =?utf-8?B?U21Vb2U3WFpnek9uc25nMTVRS1NOSzE1eVhRbTE2L3o4d0ZrbE1yUTA3SlNm?=
 =?utf-8?B?TlQ5VXpMWEJUZDJ4Ulc2M3pXZ2NOUk45NS9kT3JCZ0JqSlJjNVppV29PdGtB?=
 =?utf-8?B?a2k4dXZDYXZzMnVqZGtlcmtvbjk5NHpmRWExR25OVUsrekdvT0hpb1kwVUJN?=
 =?utf-8?B?bHNTRUlHNjhBRTFmMmFjYTErRFJWRHhpb2JEc1h5QUg5eUtpNGNwVGtJR0hx?=
 =?utf-8?B?SDlCVnZGbWhQdEp2Wkd3OVAvNVhxUzh1RVh1NXFTcEdQZnVRaWRHNHZGMVZF?=
 =?utf-8?B?VVFabmVsbmM3NWlRVHNCWTdhWEQxbmZaL0dOcWF6SkJqcU43OVQ2cEpMZmxq?=
 =?utf-8?B?MndyS0dMNTJOQWl4NVhlRUE4ajVmSEFRK2NGcTU1aUhOSWJrMDNWTzNCd3l4?=
 =?utf-8?B?enI1NHFVTkZmb2hPQVljcDdJOE0zeEttZVFFcWxTT0RCTGRsUXZVcjdBRXFq?=
 =?utf-8?B?VERpTVRPUkoyUUh1aDRFeEVjZlhDNWtkc3pKaTJNbDJCZE91N2E0TDBNSDVp?=
 =?utf-8?B?dHRPZGNKRzdnNFhDbTZMWHpZVkRIOTZPTjl1bTdpc01IcFVJT0QvWDhmWmdO?=
 =?utf-8?B?bjRERkdqSStaUGdRQW5ycytmbUl4aTNnZ2dEWEUyUnk3eER0YTV3TTVYMitH?=
 =?utf-8?B?Z3hoWFh3eHh4QmNSN28xdDZqZEhOcWpYOFdjNnRiMXVneEM3Tm1VL3c3R1Mv?=
 =?utf-8?B?M2pBejBiYkhneW5rK2tsS2JnZ3BUWWRYanBmT3lXWjc3VDV0TDhpUGdQUkIv?=
 =?utf-8?Q?D9r/PPBY8GQL4Q9aPfaf3YDp2/mlovF4FOeEfnL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8705d08c-7894-467f-f573-08d9380b80e7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 19:00:30.9296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YscUyowuaAMKq2snfNMSicD99x38mlL/S75bhc5ElFro+rsd+U0MXpbQZj4zxD8AfeQZ1w1I2ZubmTK1q0ChBEtWOaEXKQDliKF5y4wfbqM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5727
X-OriginatorOrg: citrix.com

On 25/06/2021 14:20, Jan Beulich wrote:
> struct xc_sr_record's length field has just 32 bits.

The stream max record length is

/* Somewhat arbitrary - 128MB */
#define REC_LENGTH_MAX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (128U << 20)

and is checked in the low level helpers, making the upper bound on the
number of PFNs 0xFFFFFF once the record header is taken into account.

There doesn't appear to have been any consideration made to what happens
if this number gets too large.=C2=A0 That said, the replication will totall=
y
fall apart if it ever gets to a fraction of this, because this is the
list of pages the source side needs to send again in addition to
whatever *it* dirtied, as it is the state we've lost on the destination
side by permitting the VM to run live.

The common case is that, when execution diverges, the dirtied pages on
source and destination will be almost the same, so merging this on the
source side shouldn't lead to many superfluous pages needing to be sent.

>  Fill it early and
> check that the calculated value hasn't overflowed. Additionally check
> for counter overflow early - there's no point even trying to allocate
> any memory in such an event.
>
> While there also limit an induction variable's type to unsigned long:
> There's no gain from it being uint64_t.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Of course looping over test_bit() is pretty inefficient, but given that
> I have no idea how to test this code I wanted to restrict changes to
> what can sensibly be seen as no worse than before from just looking at
> the changes.

At this point, I'm not sure it can be tested.=C2=A0 IIRC, COLO depends on
some functionality which didn't make its way upstream into Qemu.

> --- a/tools/libs/guest/xg_sr_restore.c
> +++ b/tools/libs/guest/xg_sr_restore.c
> @@ -450,7 +450,8 @@ static int send_checkpoint_dirty_pfn_lis
>      xc_interface *xch =3D ctx->xch;
>      int rc =3D -1;
>      unsigned int count, written;
> -    uint64_t i, *pfns =3D NULL;
> +    unsigned long i;
> +    uint64_t *pfns =3D NULL;
>      struct iovec *iov =3D NULL;
>      struct xc_sr_record rec =3D {
>          .type =3D REC_TYPE_CHECKPOINT_DIRTY_PFN_LIST,
> @@ -469,16 +470,28 @@ static int send_checkpoint_dirty_pfn_lis
> =20
>      for ( i =3D 0, count =3D 0; i < ctx->restore.p2m_size; i++ )
>      {
> -        if ( test_bit(i, dirty_bitmap) )
> -            count++;
> +        if ( test_bit(i, dirty_bitmap) && !++count )

This is far too opaque logic.

Its also entirely unnecessary...=C2=A0 All this loop is doing is calculatin=
g
the size for the memory allocation below, and that can be done by using
the stats output from xc_logdirty_control(), which means it doesn't want
deleting in the earlier patch.

~Andrew


