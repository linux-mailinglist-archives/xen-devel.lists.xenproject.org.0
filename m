Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9318C31DEEA
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 19:13:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86402.162219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCRK7-0004ds-H3; Wed, 17 Feb 2021 18:13:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86402.162219; Wed, 17 Feb 2021 18:13:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCRK7-0004dT-DZ; Wed, 17 Feb 2021 18:13:15 +0000
Received: by outflank-mailman (input) for mailman id 86402;
 Wed, 17 Feb 2021 18:13:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n2sW=HT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lCRK5-0004dO-PN
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 18:13:14 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58ae33e3-e9c6-42f9-bc40-f7d3dfc8ecb5;
 Wed, 17 Feb 2021 18:13:12 +0000 (UTC)
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
X-Inumbo-ID: 58ae33e3-e9c6-42f9-bc40-f7d3dfc8ecb5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613585592;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QRpiycKoHpqbeXMkjOnMDaBDtQtNB995D+xygeHxhYs=;
  b=YhwsXY2qsCrMMORjsGQdZ+9NLPXG2C4d6iFHe58+InhH8k2DiNBNjd1M
   Dk5UZsVLhheVULNcpb78zSIMqudyoB2R4wd2J8V4QD3znEBckcSrOhEST
   Nx5LsFwZH7TNoY8qeVw244b43gv9PAWmMwE9UDzGWhU6xV3r1x7V/XVUk
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: MKjA3RlDl8g7SHBYaRSDFy2pqs8rVx8FD7E1psoxBGOlUpDBqLWM7gLZsYBKZ231XJyUmX63oO
 syZVi8xZsT4uESUQTq8gUFzNfixnhBcRsRlZ65fIUSm/cNcYLzuo/8FQVO0ZXmAdVy4PqcmzRe
 ilFoImPyWvKDtDq5gTMbtisg2G2XtpVOY+O2lMhj7J1gCIoeEeVXnlKWRIoovksgL85TmvozoF
 x6LLDU+rA0DPomb7cqPSsa22CFJD3LBdp9mmlqA57I2+jzRyjC7c6GPtauk2CLJL+3udSDOkTz
 8fk=
X-SBRS: 5.2
X-MesageID: 37638885
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,185,1610427600"; 
   d="scan'208";a="37638885"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OdURUj2tRSO5CW7tpKApyC2xU2EhRTYx7540VrWQJePGvvRnIttxgxZ9q7+FrhabtU+cagBtZwatOiFzEh6CjoBbkTr6uhqlu1JFkKLqJPZFHRIYnkvAz+A3qriya10F/Wk6aDbi5lgn94vB7RSVGPlkDgwU+NdzBWJLyjc7hZTL/dHQmIoJicCMU9Qvu+/1VC62aqtbrzbFavWFjbN2yUKQ8gbFN5L/Eo0QaGF0dqKT1HlMdzviAsaDcmqHxObw+mjThS+ewA0j37tUwJhUUA7FndLM6c3N7J6cdogBBZtp8OXR5WUpnRNIRuZYneCnCv9K2GhL03Qrl475iDN9Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efY9GnvQWruZXPsXoFCvJRoWo8O/XI2YOmFSN4SnK+w=;
 b=aZEwj+dBqghRsBi/oMc9ZIGnkNunblYurJeCqo+qdeRznzdHsi2hCBsSm6PibxH0BH3ltkzW7dzbaoFJQVl5TI/9UXM63kpu8E7AoVNAI7DTHctb5qNprVm9ZubMpprMB/563nMTDL19F+ryuu+Z/ZRq8g3r69zIwv6gi0bH1i9r2EB3s3vDQ1qNsh7sixvWFk+03G5PyJJJ0WU74ScIh+v7lnuYUWusEMPKA8QSwk9vdRLhnbDM7agB00FgFWqfcpXwTxObeYG+D/b8JCtXgewTtiHn/5LiCL6wTWhqkx66hafgk4sMCeVIf7wgsEug+ZC9gc4aWTvhnwTks6jmIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efY9GnvQWruZXPsXoFCvJRoWo8O/XI2YOmFSN4SnK+w=;
 b=v/25i0l3rgwd57Pi0UdJW9mOUipdSBDpC5qZzg+rmIFbC4VZYpJphfW4CIRgLwmfkCrvaC7yxJUwPkakTB3KVejF5ROvFO7MhqBi/O9JhY5QCR41ElZ4sdWSrxL4MQ869ivRn1E8GbsRYcMZGOUNuauzJh/3bgVOXb/jO7Ml5R8=
Subject: Re: [PATCH 3/3] tools/libxl: Rework invariants in
 libxl__domain_get_device_model_uid()
To: Ian Jackson <iwj@xenproject.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>
References: <20210217164251.11005-1-andrew.cooper3@citrix.com>
 <20210217164251.11005-4-andrew.cooper3@citrix.com>
 <24621.22394.619514.991835@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c9cc1195-fb5a-edf6-3afa-1b32cfb37c48@citrix.com>
Date: Wed, 17 Feb 2021 18:13:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <24621.22394.619514.991835@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0327.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39768408-e83c-4ea6-4891-08d8d36fada5
X-MS-TrafficTypeDiagnostic: BYAPR03MB3557:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3557724D7B1A71CC12695E9BBA869@BYAPR03MB3557.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Oppmea+J/j+218WgYR9bhcro3JsJANa2+1aHDFwGVBolNsgxB5hcga7WkGqiuU2Xk20c4cZhOd3QX5KMagxA3hzN5CLhJbDyoW2+69Yy7B1zMzyfiWTGZqX0fSSs264FxUS3VCsab9GIL1PiPRcurPMI72sR/JAs+rXeEnAVErDkDfI6sIZwGqEo2WGvGOfDUMQtEiKt1byb3fCyhCvM0GdisCPToSKn9Y2wpo0NBBfGHJ2URAhK7om6qQgMtMeJycSR9h4oH36G9n5MTN9WlcNlTBa5ZQXYZw7ctT5BpWLDmPaMxBZmiFcMH+vj4tDZJ+PqZ3wKbAFCBuw/tNdtjcQ7cSb4fXA44GOW5E/aaDnSl3isChbzByOqj5I6GTnKhOQyfxmOnOIQ77MXlU+HS6eCazeF+sBRzngHp9R2y0bsxpO4jfrSyU5I59ynIHjFUek9w3vD8t4vBRkrVCJx/xh95FxhNHbjPeDVN+1aZCQUvralPocrnNw48rVsOKhc4szrqV//A+s9xY4zvd0VSvNGFuWoAkjjkPaQ8F/vYH/xUgS2wf53wwkO/l1Dh1eEh8fp81yDdATkutOgEbR0usSU7BTGkwPG+L6q3BKEN8k8L04ya8CtFEz0s3mc0sP05kF2wbubJdl4CRmAovUalA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(366004)(136003)(396003)(53546011)(16526019)(31686004)(6666004)(2616005)(26005)(36756003)(186003)(86362001)(4326008)(956004)(2906002)(83380400001)(107886003)(31696002)(8936002)(54906003)(316002)(8676002)(5660300002)(66476007)(66556008)(6916009)(66946007)(16576012)(6486002)(478600001)(101420200003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZDQ3ZWtCSjU1bHh1NUtnL0pzYjNGZ20rZlJLS3BscWZpRDZGUXl5WmZwWW5x?=
 =?utf-8?B?aSticTRXbTN5YkRlMUtTZktScUlJcUFNbk5Ydm5ZOGxyRHhrbFdBclBHaDZD?=
 =?utf-8?B?RGpHVHJvRVRiQU45bjZoOXRCbitQV1FvdWZ3aHZNWXpwUTZqMDN3ZGZKRC9V?=
 =?utf-8?B?ZnRoTlRnSXV3ZWpXYjNEMjdHcEdhZHFZVTQxVW1YeWs0Qnk2ZnJKbURvSWFh?=
 =?utf-8?B?UEg4eUk3RlNlYi9uaUVYZXYwQ1B2VWNCSE92UkdObkxIM1luNEJTYmhaT29Y?=
 =?utf-8?B?VldVUEFnamRteWpnK1VCUHRpK3E4QTBjMi9lc1dJZHVaRktnbEwwYVBvT1di?=
 =?utf-8?B?eVpGSG5TS3VueWNFcjhEaHVQT0pKN0JZWHhzanNFUFBMTXNMZmNnSS9QU0lN?=
 =?utf-8?B?OG9IOG8rZURpeHEwbzJQVFBBejAzaktETEQwa1QzSUpJc3JrT2R4V3dLVXRW?=
 =?utf-8?B?NWM0cWN2dTRDWEYyck9saW40N2dyaE9OaEZiYmhFRUVESitxTi9zMXNBdDFX?=
 =?utf-8?B?bWRFdkRTWEM4M0lsVVYxM2lpcWFQNVNPQXVIY0pNQ091SUUzb2kyMEFjekVI?=
 =?utf-8?B?V2dpbDNNTHBJVTJlTUhSZHZxc1MxS0QvcEtobTFyTFRSVHFKMW5HOXlVcjBz?=
 =?utf-8?B?WVJWMDYvanUreVRnU2VrNFBMYjFLaEg0VUZ0dUM1VlBMSlR0Y3N6cDdJcUY4?=
 =?utf-8?B?dEFRUklSUGhmSnkrRFludFRrbDlVc3pvVTlYdXFZOFAwR21PZThic2c2UWVr?=
 =?utf-8?B?OW96dEovdFJiWFc3bmlkSnNaWTVSd1g4L1Z1NzJuMmVUSHJLR042QkRNMUwx?=
 =?utf-8?B?d2o5VjcxdTNQaWxkQ3lxTWtZN1hqblhYR3NnV1F0cU9kVHpCaU5rY3Vpa2xo?=
 =?utf-8?B?eG4yOGNNdnNEbG5sS2txVGxHN3FIZ2MyOHh6Y1lFcWlwVzJONmhrZHJpZ2xN?=
 =?utf-8?B?bm9icWh3ZUcyZ3NGalovUEY1RndzanBQZHUwcERGdHRCZDd4amhMZUZNSFA2?=
 =?utf-8?B?d3h0cmpLWnF3RGd1RVNyUzB2STMwZGtyYkRNSHdSREVuUmNmcVM4ZGNhUG9k?=
 =?utf-8?B?M3ZjOUoxazBlRGZpdXRCTml3aktPY2t5YWc0dTVBclRhK0ZkUXdDZTRMKy9u?=
 =?utf-8?B?elNGMGRITjBGRmhCM2dJZDF3bWRpQnVlc2F5c1FKOHA2Ri91UlBGQ0t4Nit3?=
 =?utf-8?B?OXZTMWRZd1ZJUDhsUVNBMU9MVGF1UHB1UldzMU0yNzA2UFJVZWgrUTIrZ2Fj?=
 =?utf-8?B?UncrR1oyV1IzZDZOb2dNZlVXeTFQOGdMckJyMUd3UzRGL1ExVmJ4M1pzM3BO?=
 =?utf-8?B?azdIY0sxR3ZrNjI1VXVZV0lueUgwVEhQZlBaRnFNV09YZEM0OEkwK2NESG5Z?=
 =?utf-8?B?WVV4eVRJci9JZGh5WXM5K2J6U2hRSmUvUjJDbDdqWm0xTjgzOGUwakkxTUQ1?=
 =?utf-8?B?ZkFpbktkK0U0S1pmSnlPeFo1dTZVdmhLa3VUdHdDRWJVNm5EekJ2NXFxZHg5?=
 =?utf-8?B?djU3ODV2SXRRTGZrMTVsRmdmbG1iem55bkdsUk42TzNPWTRMZDRBeUl0aFI5?=
 =?utf-8?B?cDNYOXp6T1NJU0sxSy95S0ZWL0p4Y0YzSCtTY0lrNjI0VzNXaWJoeEpaMTRh?=
 =?utf-8?B?dzFwZUtDWDZUVGliUm1lQkxoSW0yV1NYZ1VKMlVTdGtMVUFlSWwyT2UwMTJ1?=
 =?utf-8?B?UEJNUVFpZ3NlNnNyYVg2T1FsRjhXaUZkdzZJaG5yVjZXK2lYaTQrUE9Xem9x?=
 =?utf-8?Q?lSOhsuoI/icWHj4xBqEiQwu+NMCgQzF6+gebFzT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39768408-e83c-4ea6-4891-08d8d36fada5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2021 18:13:08.5973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6r6UgATvwaLoHwy/JZIMRsfgD5PYgbEqTvAYsPA4bXTDfZuZH+3TXqWBgr4SFyYqKWyiC8H9x+wudzThLFnCaw/7S0wn2a15JMK2UWxl6OI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3557
X-OriginatorOrg: citrix.com

On 17/02/2021 17:50, Ian Jackson wrote:
> Andrew Cooper writes ("[PATCH 3/3] tools/libxl: Rework invariants in libxl__domain_get_device_model_uid()"):
>> Various version of gcc, when compiling with -Og, complain:
>>
>>   libxl_dm.c: In function 'libxl__domain_get_device_model_uid':
>>   libxl_dm.c:256:12: error: 'kill_by_uid' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>     256 |         if (kill_by_uid)
>>         |            ^
> Thanks for working on this.  I have reviewed your changes and I see
> where you are coming from.  The situation is not very nice, mostly
> because we don't have proper sum types in C.
>
> I'm sorry to say that with my release manager hat on I think it is too
> late for this kind of reorganisation for 4.15, especially just to work
> around an overzealous compiler warning.
>
> I think we can fix the compiler warning simply by setting the
> `kill_by_uid` variable on more of the exit paths.  This approach was
> already taken in this code for one of the paths.
>
> I would prefer that approach at this stage of the release.

Well - I have explained why I'm not happy with that approach, but you
are the maintainer and RM.

I will trade you a minimal patch for formal R-b's so the time invested
so far fixing this mess isn't wasted when 4.16 opens.

~Andrew

