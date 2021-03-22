Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38151344CD6
	for <lists+xen-devel@lfdr.de>; Mon, 22 Mar 2021 18:09:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100390.191243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOO34-00089i-Ea; Mon, 22 Mar 2021 17:09:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100390.191243; Mon, 22 Mar 2021 17:09:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOO34-00089J-Ar; Mon, 22 Mar 2021 17:09:02 +0000
Received: by outflank-mailman (input) for mailman id 100390;
 Mon, 22 Mar 2021 17:09:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FSIZ=IU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lOO33-00089E-Ct
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 17:09:01 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f7509f6-1552-48dd-902b-5d5dc3f793f0;
 Mon, 22 Mar 2021 17:09:00 +0000 (UTC)
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
X-Inumbo-ID: 2f7509f6-1552-48dd-902b-5d5dc3f793f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616432939;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QPtX9B06g+oughc1P4agimdfnvEc+taVde1WpUDghLI=;
  b=f0F6yHT1SrLwU/ri2Sa3HRjlI1HjKFlxhuQKjhRkK8L0i9DJNHUHRlo7
   aLy4gT1rqbAw7/QgQ9x3UDPtwhIOcYedkRDCtzqT8dHWQqzo11kYe8dlY
   s9TZsPHddj6pI2/OJk88h3YUtIUf87/OEY6ovy5PUwzQ2fsfgdxhAQ2q4
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: QhDkJ2biR9Hhp9G0bkt2a+0qgwDYk2FeLvotNXhS/9r+7Uy5L4NqW77n2AJlLpUNTdqUmfAyow
 ANkPX9BX09dpvkKqkbDbc1ZvBQKvCRLu7zIzefkIzaTp8IV5JBgI0XQqCmvFHXfuT+b7XPo69L
 G4gu9crGeGxavK28UrYfgknG9ojEWsnm47dcuCDNwbMcs8YRKHgHlQcn1/09+vlte2+w0DrN1F
 7GXMaOggpSwesuzdyzzi/uydbNeI1ygyY8e4YPfjFikwSgdnLnRx0XXJyC4JcuNmzz1ZSl5kCw
 0f8=
X-SBRS: 5.2
X-MesageID: 40207814
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:c60wIaPE+EYqk8BcT4X155DYdL4zR+YMi2QD/UZ3VBBTb4ikh9
 mj9c5rsCPcpRQwfDUbmd6GMLSdWn+0z/QZ3aA9NaqvNTOLhEKGN4dnhLGM/xTEGzfistJbz7
 tqaaJkCNb9ZGIK9PrSxCmdP5IezMKc8Kau7N2urUtFaQ1xcalv40NYJ2+gcnFefwVNCZonGJ
 f03KMumxOadW0TfoCHABA+MdTrncHBl57tfHc9dn0awTSJ5AnI1JfKVzOZ2RofVD0n+8ZHzU
 H11yjCyY6H2svR9jbsk0vo364TsOLAo+Ezf/Cku4wwIjXohR2vYO1aKtu/lQFwhOm16lo2lv
 ngyi1QWPhb2jf0fHycuhHt2xbtuQxek0PK+Bu9g2bGqcz9aRAbL6N69PhkTic=
X-IronPort-AV: E=Sophos;i="5.81,269,1610427600"; 
   d="scan'208";a="40207814"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0029rH7hZKX9nAZDPefqX3dn88Ju/gMxDU6taYZgryYB6NMcAnhVyGvFQ6b06roPHEEeKD7u6H1Rb3CprOjeFB/oYUpSUBR69nenXjHOZx1eiFO6YHV1L4t2YxP8chWCnH3JwCaRkuZP5h05+dbl3o5yodfnvBhdql5vVHjTSTRfOqszCCfIKOhLbvhn8gzuQNoYwrmZxvTbaeJA7xv5LdgYkYbpd6ARS30PHfjv7XkSsGksTHhGHOs60wFGwZrQSkA2ZEwwFnrToWE6GqBCHGk1RdHyKeCOMLkuIXh+Nujzj+a4f11gtGslxi50UWdYbAvaTt8uIysoTtHhJZalA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPtX9B06g+oughc1P4agimdfnvEc+taVde1WpUDghLI=;
 b=ShB23OdYxPQjzdq5GTThvqHO0nZ2rP7pKbNz0JgFYneUS6FJzmkGlgWQgexeyxR8QVmplBJgiuzxWSpLVwty5wxWQkAeZwDB2oOMmuOZsmb+d+Ii5+7INX+5V4vAPteniEpp01SXb6TxhOHP/R/guoBba/WBfEeiUTeMQb4hKWEZv+ca6kBScCo3qJgEqKOER9pCvpsS/ymiZhvu9LRqUeef7IkWPetl8mItyBFoNzrJSRafx9Gu6KNn81Ysahzpgz8uojtSJEXY0Jjt1wdmbken1mle/U9uzN2xhfRntnZdJXGDvkopvHFTPLHSORFz1NqonBTTZHwhkpcKkJhLgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPtX9B06g+oughc1P4agimdfnvEc+taVde1WpUDghLI=;
 b=ESalTWftqoJM0WTz9pcGS1UvJ2pnDsFxEW3YHfHd+KMgPXkJFuXj2tVMa7Uy6WQGAGptlK58Duca2iMIfdDGasM4V69W6dZsUrEJBVtYX0dHdz52PU2bd5pJysJPYBdM/1bppjTRzh2viPFKTw6xAjeaG1L6ussUodf3NidWD3k=
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>, Jason Andryuk <jandryuk@gmail.com>
References: <20210322133301.11308-1-jandryuk@gmail.com>
 <c5736ca0-de24-bac7-f1d9-3f90df997454@suse.com>
 <d410d743-5479-bbf6-676b-c8749ab07c06@citrix.com>
 <f53db67e-8344-8da7-6658-c521d2e3c527@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen: Create EFI_VENDOR directory
Message-ID: <09b5e7ee-b44b-a8ab-f29d-6617b6af93a0@citrix.com>
Date: Mon, 22 Mar 2021 17:08:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <f53db67e-8344-8da7-6658-c521d2e3c527@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0066.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::30) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 138f6e69-3d1e-4066-e246-08d8ed552d50
X-MS-TrafficTypeDiagnostic: BN3PR03MB2372:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN3PR03MB2372F705798C5995BEBDD1B7BA659@BN3PR03MB2372.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kFtVQ/oJdHYbrme8RThaqU+dfC23eDhOx74W8WvB6QNbn7qHj/62cdktl/hd7yyFBg/Xjvwr9hEMUck6ghDWBRobG7Yh3t+BvVZNrMOE5eQdu+G2hkgFL44nu6ipzOjNnsq9fLWWrrO9qw7gdmqV3NsRvKbO0J/ye3+CWuqKbwc1ZwKoCPhjJ8U2eFDXu1+gGKMD6pD0SYbdMjoStzR0U8RfU0S+HpPot3rDr88zEh6HO6LEOEgRmtcaSo8Cov8Hak4r0lE6LXCDn0zoxt9YzLBr2/h/GSHAh5Rb3sn89MctMNJVIeT2PxeXZVjhfhIm0nnnPSIV5rVOikY/E81vQFm2XIqWt6N3ipaf3JQHolXMp3HPVRBuvKaHoY+k/RwKC5aSA7FVEi6Z7wHDORz78GzsH0AXpalPCJWvF9ZG7vz2pjDn7QxdjHmtMvEDuHE/eA2xT4WPMlvuU3puf2yFM/kgOc0aPrA4hySjAL4+UKlfzpLSNXDZZr8M9lrgO+vElUYcz4Uwb41pR2AECKxQ/cLu6WLvoW7oFaD1/MwzQQdR4peS5KqETkesYMUQpk7yIsfrIJcumYH5owQc3nTP8GKji206EDSTmJhlLp929SG5swq77E1cx1P3RhQcqUj/nJsemxHY8cMPiTfqSRMS4MKq/z+tI70btDicpV2tg9Z9+/iC6iJKT2oFgabNjcUh7Qnew4vgeiDXSfNiqYSFq+/fjQP/nU1Yriw5wkEmYM8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(16576012)(66946007)(66556008)(66476007)(186003)(16526019)(54906003)(53546011)(956004)(2616005)(8676002)(26005)(86362001)(31686004)(316002)(2906002)(8936002)(31696002)(6916009)(36756003)(83380400001)(5660300002)(6486002)(6666004)(478600001)(4326008)(38100700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WjJOamZiVjAybDZMczZYdXV6aEdtL0tZM0FpNkZyeVFNaERCMlhTMWlXcG1q?=
 =?utf-8?B?TVU5NWRLU0NGaVhkRTJEZVpzNkJSWWYyNHB0bnJ6VnNrYzkyTFRvcmlBU3Z5?=
 =?utf-8?B?NzJFNnEraU9rNy9vdm11OENDMmhDbTdMangzTHdPaFRqRU1LYkV0MzRrYUIv?=
 =?utf-8?B?Y0lYaHNFTWJtaC9wdUk2VkpxY2VtalVmM3JFWGJ3ZzloblEwb25GWDZ3TDBa?=
 =?utf-8?B?QjNicW02QkEvVjFnamdtQTdnUU56NDBITmd3LzFMTElUMjZ5Ym8rTUNRU1dj?=
 =?utf-8?B?T1FkT0lDN1crZXEyUGVWZkNiTVhIOEdTaG1FUTRLVDdxeGV4V2dTYUh2Y2hl?=
 =?utf-8?B?WjRwS28xdmJiSEdSRStLVjFGZWlNdUQwYUVpSHpFaGlURGN1WGErcC94dkI1?=
 =?utf-8?B?eXV5eExmSll4ejIwL0lpZHptNzJtZkZqcXVJSzFmVy91cVlabGViZFFONWxh?=
 =?utf-8?B?RjNEUkVIYnJhOG44bGM1QWxqVTREdGZSeDVuc3h4WjEzQ3JMN2RITEtaN3FO?=
 =?utf-8?B?TFkrazloang1ZVZSQjVqTktzZHZPUEY5eEMvVXkzR1M2UEF2Q2twNHZhbE9z?=
 =?utf-8?B?cm5FTHova20wOG56NjExRmVqbzF6aE8wanAzYWNURkM4a0QxTlhPWnBoWHJJ?=
 =?utf-8?B?U2ZVbWpmRXBxQUZYWTFBS0szNzVXNGNGbDR6eWlYZzR6alNucS91QTExU0J2?=
 =?utf-8?B?azY2d0VTTHpUWUw5enJJaENYTklKU3p4UzUwTkl4SGloWnB4RExNbHFpTk9H?=
 =?utf-8?B?bVRWN2dOV3Y3QUljR2tLOVV6M1RHU2IrbGpZTDNGWVBPZHB5cUxsazVKZFRK?=
 =?utf-8?B?TDRpSUVhbDJqbnRDczUxVWJPYU1DeE0xbGFZblZQR2xsOXY4WUFBRHM5Ulhj?=
 =?utf-8?B?Q1pVUHpEWkJaeVRuMVFRaGkxQ1AwRXVTeXFQUmRGK3ZHS0ROczZueHRmL1VV?=
 =?utf-8?B?TGNScXhabGl5aFJFRU42NEJLMWRGalZ4cXBKa3ErZk91UVArOVEwWkVLeGNH?=
 =?utf-8?B?Y0UwSjd6UjlMbFRoS25uVVorcklQdGhxYmNkMkNUNHgrTXRNckJLUmRCdHgw?=
 =?utf-8?B?dmcvWXJPdmlOM2Jvb1NzMVZJcGdycm5YeUNiekhya3pqRHFRNG8rRExCaU9L?=
 =?utf-8?B?NnNBMkQxN01XTnR5R3ZyL2VJNVg0emZJS3phVkNxNDhDUllPRkpJejQzV2Rk?=
 =?utf-8?B?aGJtRUE4TnJpTGN5L0pGUGw0cmJiVDBvVjBENGh4RGJmVlNrMitNMkxMbWVz?=
 =?utf-8?B?b0E5MXdmRmlic1pxS1ZsbG5DRk5kYVJWOWlUaFdLczhWMXFMc0xIcThwQnov?=
 =?utf-8?B?SXBFN3NCNmRXSG82Y0NFY2UxV0V0SDVSUnZXRmlReHFWWnpkVmtwdTMxbC83?=
 =?utf-8?B?QmR0QXJpVzB2QVhWVE5UbTBES0V4VCtlZHFlNUNnZjhadC9iZWpCY09NZllO?=
 =?utf-8?B?NlQ0aTk5bGxBNGsvbVN2dWJlbERlNElkTWpYeG40Y3BQczhYRWRRbVZtcnFh?=
 =?utf-8?B?YjFTYmJaQzhleG8vOFdFNkNSaHJ5aXpZeVdDcHJGbGIvcWZUMUJCVVdFemVs?=
 =?utf-8?B?Z0xEdVZwcTJBY2hCSDNqYXBxUk1YMUhrSUNYbEJWQ0tkRzNLUWNFMFdTRE5s?=
 =?utf-8?B?YnVPZ2VEYitmZWx4ZVdWTXNtNjBhSm1ZL3dZSllQTTFrNlNqZS9UWExUN3BI?=
 =?utf-8?B?UTJSc2FWRnZyVEVZa0FHVldLYjlZV2JvSkY0U0pEaDFXQ0FHSnBNSzRKczJ2?=
 =?utf-8?Q?pvG5vc8wELvZBpFC82sv6jXzygkzqoINqWv3Rhl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 138f6e69-3d1e-4066-e246-08d8ed552d50
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 17:08:56.2952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RcIMDRcPZxi6VHdpKDlGbGczq69X4mwKA2/MovBc0FDcScchOqz6YW+rFqmwdsc1gbvc9FHxBPAtWYht/NsDt671DUyF5+stM50tQIp6D7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB2372
X-OriginatorOrg: citrix.com

On 22/03/2021 15:15, Jan Beulich wrote:
> On 22.03.2021 15:59, Andrew Cooper wrote:
>> On 22/03/2021 14:52, Jan Beulich wrote:
>>> On 22.03.2021 14:33, Jason Andryuk wrote:
>>>> make install-xen fails when EFI_VENDOR is set (=3Dfedora) with:
>>>> install: cannot create regular file '/home/user/xen/dist/install/boot/=
efi/efi/fedora/xen-4.15.0-rc.efi': No such file or directory
>>>>
>>>> Create the EFI_VENDOR directory so xen.efi can be installed within.
>>>>
>>>> This removes the need for Fedora and Qubes xen.spec files to manually
>>>> create the directory in advance.
>>> While I'm not strictly against, I'd like to point out that it was
>>> deliberate to not create this directory here. I also didn't expect
>>> anyone's xen.spec to do so. Instead I'd expect the distro to create
>>> it during OS installation. If this was a bad assumption, I'd prefer
>>> if the commit message here could point out why such an expectation
>>> won't hold in general.
>> This reasoning is broken for anything other `make install DESTDIR=3D/` o=
n
>> a live system.
>>
>> It is incompatible with how RPM, deb, etc packages work.
> I'm afraid I don't understand, for both of your statements. If distro
> installation put in place the designated directory, there wouldn't be
> any live system lacking it, and there wouldn't be any concern in the
> packaging of any software.
>
> To take a perhaps too extreme example - packages typically expect e.g.
> /usr to exist as well, don't they?

No.=C2=A0 A buildroot starts out fully empty, by design.

The packaging environment (usually a chroot) invokes `make install
DESTDIR=3D/path/to/staging/root` so you don't interfere with any of the
tools inside the environment, and the resulting tar/cpio has the
buildroot stripped out of paths.

The failure being discussed here is the build within the packaging
environment, not the metadata which forms the final package.=C2=A0 Installi=
ng
a deb/rpm/etc will make directories as applicable.

~Andrew


