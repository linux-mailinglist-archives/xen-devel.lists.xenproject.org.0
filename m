Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A13ED2FECF4
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 15:35:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72119.129553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2b2y-0007zJ-7V; Thu, 21 Jan 2021 14:34:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72119.129553; Thu, 21 Jan 2021 14:34:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2b2y-0007yu-4Q; Thu, 21 Jan 2021 14:34:52 +0000
Received: by outflank-mailman (input) for mailman id 72119;
 Thu, 21 Jan 2021 14:34:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aMxC=GY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l2b2w-0007yo-HA
 for xen-devel@lists.xen.org; Thu, 21 Jan 2021 14:34:50 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29090991-e197-4f38-bf20-36207deb66e5;
 Thu, 21 Jan 2021 14:34:49 +0000 (UTC)
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
X-Inumbo-ID: 29090991-e197-4f38-bf20-36207deb66e5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611239689;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=dPjAWL75okpRBEFLHKkWt34bG0yIH3cMSYP1Uc7h1UU=;
  b=Atlt05yH3jiKealbzQ6FEt4Dov/saSLfJukj37ih5BPfLc3iirZDEh0t
   jrOVjRCdmUEPTa+F4skMy/iwDuJ5oZRQjuEdz3UU88YKeYbxEAiAr1oA4
   zYNvShbaMAWf1eCsF2dFKNCMNTqDJrX1l3/5bU5Iiu3etb2UDJ4hT09G3
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: zEwQLt9+oz00EdomjvqG3j1OPTGmLe7xvijFKgjiK0zx0tqOXYmdGuV3/NfSi7AbHSQrrZD35M
 B/VBuszO8dGhDJ6DEUihPnN9wHrjXhEkZERgI3jmy1GjndD28YgvmWf7CELcbWCgQzVC1wlzC3
 RA56KdTp2XQ+TLPiyZIR2RlOAhJdwMfmYjclg5axrD9Af3AYBhfSNSt3KlJegLM5SqhVvkUvaL
 GB8CZ8xfKvp5EBz6PHN+HGz4wwysx+qXMNwWBm2mVgBCuyq/HONUctp5l/TFXteaTJv/Pe0bdB
 jmg=
X-SBRS: 5.2
X-MesageID: 35935573
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,364,1602561600"; 
   d="scan'208";a="35935573"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F7xcFHVmaI/bo3oCUwcfxkevjbMwAq6BF8Pm1dVmYychzslKo0aRYs5GIT6E9a8TXhjqS/HVv7Hua5bsbI7Ihruz4rg15mrumcTYaRGMa99ThKncGE1EyTKWTPWIneaB62hkvg3havsTGnackvCn3vIkQraaoCUZ1dV0i1+dwB89gGvUBdNgAJFcnryQ690gFTcjMJwRraUgL+AlIj7frewAkiKkAo2T+8quFtzprzj4LKGBSvO5J0LCiQbi0qnXR2efmPKvJYahDAAjeUWI/AcwfQEle5KeZesRPO2j+zGTTdeBb5q12rgD59r3eyqMdUaAqvkUMYlynlWl/+8jkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9W39MWCFZeQsdyfAvGPKpx81/7naW/pgNnVps4RqwY=;
 b=IFPp5kvX4sXl1wjATkHP8DvpDndxhcCdaaDecIZRcj6QdtwZ1yLU+BZFjPpQHeRniM8tozkQ+FK7DCcyexxFee9j0Q8Yd4PzKf92rfmB1O3Zd3qk92gch5/n/l7SOUbRUACx4hRlBx+OJPQYEcuwUDr0NjZhh79HtAo+z5awmLQzavaoFCOrx2EU8EppQMqGo1gxBeheQdHlO2rqOpGuvLpRRwSfxtjS3PCwk+Vv2GR+5jDanIiZc8pHOBRnFek63UbcPELM+0w+kARWPxezhM2C+Jor2K3OR5OG8zVM5K0z7DUGwAe9Ukl1wSdI6Az+oekzayJ9xVTwkGWCJDYb1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9W39MWCFZeQsdyfAvGPKpx81/7naW/pgNnVps4RqwY=;
 b=dw0hpUarnpQzvaL+kwjn9vxUZn0Y+lvTiOWkphYNdW1WZKLO+BcwXQKzjVLGcsKdxc73IyNxQatvLVQys/NJKXoGFGhkJDlubAvVfEH8/50ZHLoUeTsgK7ilyy2f6J58luUTeVCeZj1mdEHw/v3LZXcaI2ncuN5TaOZy2WYpe/w=
Date: Thu, 21 Jan 2021 15:34:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>
CC: <xen-devel@lists.xen.org>
Subject: Re: Xen Security Advisory 360 v1 - IRQ vector leak on x86
Message-ID: <20210121143440.xucstdfws4ymtete@Air-de-Roger>
References: <E1l2afg-0006PK-Gj@xenbits.xenproject.org>
 <20210121142012.GB1592@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210121142012.GB1592@mail-itl>
X-ClientProxiedBy: MRXP264CA0008.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2175e038-cfbe-490b-057e-08d8be19b26d
X-MS-TrafficTypeDiagnostic: DS7PR03MB5606:
X-Microsoft-Antispam-PRVS: <DS7PR03MB5606EF907EA04F23E102EC9B8FA19@DS7PR03MB5606.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rj9NOo8sIbx9AiHSQmZ1f8hkl0E1lpFXHHHPNAc+JxUKcARX4j1XpufIRBhFzSZeuNZfFJceeBSAG5+6qmgFahnUccAsTu8naQTFtrZGx+6yEA4zGuChMBKfv2MCFDm3QTt4vL9JMQIWYthiTNGK46InAKit2WQNmA4zkKWE9gS9YJlu03U1FyPlVIjYS/koyNdUVcNkIiPMCtmFsswnq/J1Zp4xjWmBYa8JD4iCh+5bRb3pr5LYsOwwXTjpQcdn1jrA8S7YU5xuHKp3BP8Pb+ucz0KMi6VSut7kJypy8J/TsWyPlkqWNrTsaIcFPqVagSHUPz54Qir3N6f6U8k7sZVf7pJO2Dhy6fDPAz4v6vr8TRYC3KOgzKQgHogq3y8J22KCedQAsr1qo37VCOe5dg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(66476007)(66556008)(478600001)(66946007)(85182001)(16526019)(186003)(8936002)(86362001)(6666004)(6486002)(26005)(956004)(9686003)(1076003)(6916009)(2906002)(6496006)(83380400001)(66574015)(4326008)(15650500001)(8676002)(5660300002)(316002)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aEx5RWp3UGFtS2VOaitVN3ltakpnVVRYeUV2L3QrZmtseXJjOHc4SC9KOFMy?=
 =?utf-8?B?YXZ4UWk2TTN6TFRhWnNXYjdrTGpQaEFVWEdpKzc4NlkrWGdaUmRyQXRabHYr?=
 =?utf-8?B?TzJ4QVk0ZGFodEUrZ2t1bWw1dTE4NjJvRXJla09EYVgyZUxIaElCUGFjVmVL?=
 =?utf-8?B?bW9yaVU5RWpZdkhLd0hLbWxhUFFzVzQxTkhueFc3SDlzYnNUSi9TN0ZDOHRt?=
 =?utf-8?B?R3dnSjl0RG1hNTh3NzI0dUhpbTNaa2YrdlFFV0tVOVpkQUU1R0VoWEZaS29h?=
 =?utf-8?B?Vmczd09RSVNzaG5JTzVSWEFHMXlWbDArL2NFTjJKaWJVSmxXb2pRU1lGNUR3?=
 =?utf-8?B?VXBoY09RdWZxRUVNeGczazYyU0h1MXIwMElRZTIrdjhlVmdFS0NtWkZpallT?=
 =?utf-8?B?UEVKbVdRSktCZnNnSjJheCtJcG1rcXR1S1o4YzJuMEpvWDVqRHBNUE9WU3h3?=
 =?utf-8?B?elc1dTdxQ0RabzY5dFlaaHBmL3VscGp4eGk4R1k4aTlCZFRlVUNkeklITmNk?=
 =?utf-8?B?Y1hTeGMrWkx6OXg5RDNaaG5WTjRIU3QwZU1OT2xGU01HZFNQMTRPSDlGalZS?=
 =?utf-8?B?dlJheDVDQVZYNVVvMUViNlF2VGdDSWdDMitEZkhlaGZpL0tlaVpqdE0vOExT?=
 =?utf-8?B?R3pTUnVhbytVdFBmQk54S21NZE1SSUplZEtZbDlMZGI2VTdtTW9rcFhHTjlo?=
 =?utf-8?B?RkRiMHlBTTJOZnl2MUpmSFpSbDV3dVRWc2h2enVDSmtiU3FSK1I0REJtTUJ3?=
 =?utf-8?B?SXk3TDQvcjdLZmFzLzBpWXJETnBIdEVUU0c1ZHltSFRhNTVOYXFIOWxYa3A5?=
 =?utf-8?B?YUtUbGJLeDRWOU9YcE5GQWRhVDhyRkIwWXRWUFkrYW1qVU5ibzRxN0ZJWDhP?=
 =?utf-8?B?SW9uTXlpem16TW15SDU4V1h4bFpyNVZsQzA2WWpiOTdjblQySlp6ek1hTTVm?=
 =?utf-8?B?NEd1RFJUSkNyd05Ta01iSDFabHRKSmMxdGYrMUFTVU8yQy9mTXplbXhKMjRl?=
 =?utf-8?B?TUVVZHp1S0V2VE53VUhKaklzN2VuNTRGcHRDaldZMzJ1ekM3cUlxbHpZWmo4?=
 =?utf-8?B?TFlucld0MWZFcUN5Y1djNmQ3bGpRYzZDak9yUjVsMTZRR0F6K0pibW84NVpS?=
 =?utf-8?B?L2tmU3Q0U3VVcFhTTHRtRVBQNzRtOTQrYWFpWTJsaytCemV4TCtNeW1IcENp?=
 =?utf-8?B?dTd5T1p5YlhBZDlpR0gxZUlnY2IyOCt5VnR0ZHEybmJXSnFyaEd1Z3dKbDhZ?=
 =?utf-8?B?SWZjL1pMZWMyS3VDL0p3aHNaTEtjR1Y4ekY5Wm5PQ2RrWkRnNjBXMGR6NG5m?=
 =?utf-8?Q?0fkljwJRIdKlsZO3/Ax3eYASqAdCkAIRe4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2175e038-cfbe-490b-057e-08d8be19b26d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 14:34:45.2164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JF9DVyoYCOOIVoB4egEZQWEH/zBLh3L5JeMagDJS2lWlhY9/xsqlL1njWqn52htFHNfJSBj3Xvl3hKRYH/wGew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5606
X-OriginatorOrg: citrix.com

On Thu, Jan 21, 2021 at 03:20:12PM +0100, Marek Marczykowski-Górecki wrote:
> On Thu, Jan 21, 2021 at 02:10:48PM +0000, Xen.org security team wrote:
> >                     Xen Security Advisory XSA-360
> > 
> >                         IRQ vector leak on x86
> > 
> > ISSUE DESCRIPTION
> > =================
> > 
> > A x86 HVM guest with PCI pass through devices can force the allocation
> > of all IDT vectors on the system by rebooting itself with MSI or MSI-X
> > capabilities enabled and entries setup.
> 
> (...)
> 
> > MITIGATION
> > ==========
> > 
> > Not running HVM guests with PCI pass through devices will avoid the
> > vulnerability.  Note that even non-malicious guests can trigger this
> > vulnerability as part of normal operation.
> 
> Does the 'on_reboot="destroy"' mitigate the issue too? Or on_soft_reset?

Kind of. Note you will still leak the in use vectors when the guest is
destroyed, but that would prevent the guest from entering a reboot
loop and exhausting all vectors on the system unless the admin starts
it again.

In that case I think the premise of a guest 'rebooting itself' doesn't
apply anymore, since the guest won't be able to perform such
operation.

Roger.

