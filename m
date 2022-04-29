Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F5F5146DC
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 12:37:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317188.536409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkO00-00048X-MC; Fri, 29 Apr 2022 10:37:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317188.536409; Fri, 29 Apr 2022 10:37:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkO00-00045d-IL; Fri, 29 Apr 2022 10:37:20 +0000
Received: by outflank-mailman (input) for mailman id 317188;
 Fri, 29 Apr 2022 10:37:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iTs9=VH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nkNzy-00045V-Hk
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 10:37:18 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56fedc9e-c7a8-11ec-a405-831a346695d4;
 Fri, 29 Apr 2022 12:37:17 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-SDKgxzxyPX2xZ3nUGRKlzg-1; Fri, 29 Apr 2022 12:37:15 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR0401MB2287.eurprd04.prod.outlook.com (2603:10a6:800:2e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Fri, 29 Apr
 2022 10:37:14 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Fri, 29 Apr 2022
 10:37:14 +0000
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
X-Inumbo-ID: 56fedc9e-c7a8-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651228636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vBeehNNKcALOn2Ccw1VujC7JXL/3wwRgg/Da3YSULbY=;
	b=lQleSZtZTV/vPNQzz1ClyBp4l//2hpBpM+KKzbMerV0i6nhjCxIq6DAxRyX53YXfVA3YCx
	KNN8/lubUcXmD016ySXIheHMQaGTh+ede55vr22xXPDgQutAcrn9La7lQFITqGQFihYiF5
	1UXIbraLkQ2Wkl5HUXCofK9oFl4C69c=
X-MC-Unique: SDKgxzxyPX2xZ3nUGRKlzg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jbPCcu5XfafbjepqgsdFYWgH0HaFgNbSYBkyv6NJhM/0ycYBkLgbMh5kLNOaAqVtuv0f98oxvwp61gyDUigJC/BfH5izoBCGS1PZlZYeJCKrMmSxLsufr034jZbUVs+H3pkOcm+IpgbaOLqeY08Wfm7i17+TicYr+8nKNwsS4BSZ8IwDjyjQQeof08wkrZGnXeFlWhP0Ru7CEr0tcfeVCzxzaKiEeNdzwUI2ha5g0lq0WebDjXQEaOjasRyg7qzReyOalqYStYu/7xVwLEfV69UZ6sSAIsk3Vrd0E6ky9NiZiuV3KvukxyPtVPF2azZIb9GkL6ZgkyQFzWt2hxXKiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Epzp5HkR9KkZW4E2jKSKxyhqnnGDanuZ6PAHXAylqII=;
 b=amvsW8mwfINVI1pTKCDabU5Kk3v+G19nO9rixnw6nV38NbgFT+YHeMbdNtvfgQA/xYeNc6WiOKzVeUG6PfdNCZepJ/8nWGCbkUCEb/6EZKJ9ZG/DJehlBhF8Uu/07fzxwjhbV5uHfr1OHhwoa+jKoQUPrq6k7jTKNaguB7YkMFqIwdxRZGxsX7SyvU6WBqgZi47Y3squyzoFw3Qnl1Z2fJY5nwNzgILoH3mN7veTpm67/SQdcuSc4oxMid0bzvK+ksj2N2GanxBHEz8pi6JWgjCvyW02/kitlvw+xyCXf7btuGmwXTKc2oWKE47uDBvFSAcZF4Noh4UziadLWqKrUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <25a16b3e-e235-698a-452e-bb87920adc89@suse.com>
Date: Fri, 29 Apr 2022 12:37:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [xen-unstable test] 169819: regressions - FAIL
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 osstest service owner <osstest-admin@xenproject.org>
References: <osstest-169819-mainreport@xen.org>
 <Ymu+WnVjTANHk+na@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Ymu+WnVjTANHk+na@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0099.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::14) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7bbfe8a-f609-49a6-e6e9-08da29cc396b
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2287:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB22879D5604A91E7F090D8FB9B3FC9@VI1PR0401MB2287.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SD5WN8+T1OHUQXpQC73Vj5JCShK9jV7Q5xy9rROn6f7Y2Lvjj4l4jgGxnYZyi+NmO6cw9HbFiWCpteUu+r1oKp1mqg309vAfg3D9Hg9woGPgZSYaTfda+oK6ffxbkcmghD1sSochBMQoqGsOnan5BsUnk+ueOmTP3YIhfT4eiC0xmG9sPeZmki+e/YFxVkm21M/itNsn34vYMEbwIgl9CE8owsVBFg08aGZQ4RdwHv55S17IKrRh5u9gmjawjC8MDOhXq5GSYESoPzlgdj9RSf8aMQ6uaf3vtQ/GHtAcWjiNtBYn6n2/EfbY103sl5LRCd/FBG4Wpt/vdKCUeHO74PN+2xpftTOwqdfgGWLCat4QLv71VbymWtZebFH1regszTK9R1577kLuDP0+P/Jz53TbsBXRUz8eNmXJ5p3qGamIUVhR8IL2xLxYFcI4Fgp2LB7u4Q9TAubX4K3OxnRscP9xQn9PS+izHTtvYg9D2sCWQ+Si9v72Qz+BQIdsJL4yTa7S7UztAMBrgclvgQtjIp6iIbn9IQZCGEbRJaI+jwod9iITOVJH031ZcC6AFcZuoWp4uJt5mK9AW+FcCPqijED+VlC9YAhUx9awaiXyjuybG0bcEhhNwRja8ohc1azYUCLW12oQEkbWyXVMZNf8HtKphX26vWrGJAYfVxqIA4N7AXY8ImH7CFAC2SVfFXRQVICvxx2h3oYsnMZSHR5X5Z1yQO1jH7NqaBkfgJJU+a/qZ9JPZv9aHP4kmk5spPai/AzimLVA1LXydL/SD3mR1FdpsrSspvCCdVYjWhl6l3Xf4cNSJcWydJcT6nLbxyHhH9PsJTEkUyl+7dco0Myw5dOMC7w5Lbmh+NnO8tvLebDdslj12XoQ/6vPZCYd/uIe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(6506007)(31696002)(38100700002)(26005)(31686004)(54906003)(6916009)(53546011)(6512007)(83380400001)(4326008)(66476007)(86362001)(8676002)(66946007)(66556008)(36756003)(2906002)(508600001)(316002)(8936002)(186003)(966005)(2616005)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DBV83JLqA+fXhIheHdm3a88+CIwXzAfiPNUq8Ya03GsNQ/pocsg3CgU97ZN9?=
 =?us-ascii?Q?n/nAZiAO//gf1S1xtmbjemMV0xCtdmAV0L8HoCAIVPMrJ0Bn6c0Ni3AszFIy?=
 =?us-ascii?Q?y0QQggEF0XAejLmbM1fNPEDkid7tizlvbuvH4fDI4fBEZs0VyrU8Ju5cx5fv?=
 =?us-ascii?Q?nqKKKzXr/1SqQe7PfU9Gscffwlb50aUqTE/M1678HgwZbThID5PdUcF/8b45?=
 =?us-ascii?Q?i8I1phW1q6SF6/xqYU50R01ivSMaAfjNd4VJaCOMRvpxPvYgebkxJTUwDky+?=
 =?us-ascii?Q?kxuaoP0sLA9lLZiQcJ0D6/ea7kGLGcMoPzQtHEvNIoYyT6Bz2Sb9ycq5q9ei?=
 =?us-ascii?Q?BtITyGIHBVYQMIOS/yWzScbNQBtzJ70ctEpMWGiyS9eEYmQwRp6/0X/V0K//?=
 =?us-ascii?Q?fhhWTPrWpqpSrDFfSqmKP+5xf5RWSJS8K+DtPKkM0oRbyivE24tILjGse7oE?=
 =?us-ascii?Q?fvkeog+RIXqYV332fl5VDeMhuMBpcX/53J49HCgmocjaP1MrHV+MUkpxJB8j?=
 =?us-ascii?Q?qK7DEFc4h1RG0zHaYnYADfnvYTMWwJh89+0qYnqpu72SuPinYwYiqsfHLn8f?=
 =?us-ascii?Q?ViCagg6YAUBvMLkLoQMhKcCHCXrv6tir+a84t8WpmBeON3kiFNvHROjMfPpH?=
 =?us-ascii?Q?/qndLSfQ2zNmBBk5XZvN1Ypnp9riuK9G26FMIOqMIFyIYSklN8GjEwnzK8Sq?=
 =?us-ascii?Q?b6BDj/PtaLkG99Y09FPpnYCbyH/PRFZuXl3Tb7NnBUdqD+KZpwM+/2onP2fW?=
 =?us-ascii?Q?5t6T9lPr5/OPQpZCBgy33BkpxmcGXqJfJoRlU/JByp4Uf8JlhO49voJAAZZH?=
 =?us-ascii?Q?mjqBpXRFhDprIdAf/yqoUHglXKQKYqJ0PjZGgh5xGg2X5CMka3vwXGW2wOa9?=
 =?us-ascii?Q?VUOqiFBwbSNesPu7+uwgSYnsUdEIqRYAOJ+B3mbHro/tngaJXw9H2mo3T4Pr?=
 =?us-ascii?Q?x+9YXm13OIWRX21U1bOnoFJPjphXL6Ifys8ElvN6LaOFWtO7p0d6svmB2aFf?=
 =?us-ascii?Q?+3neDljO3yNA5x/gAJZeSZIFYEsiylwm7AjttyfCLzxGnfmLLNOHDosGCBwe?=
 =?us-ascii?Q?RS06nxTlL3COaOZXDqW6ctT4KkEU5eSiuWh7QWclpgreufl7liL+lXpDIP6M?=
 =?us-ascii?Q?hgsnczcMqx5jAYcU/V2JmZEw1KySn0l05qNjYyNd7kT4B2+zbs4cF1aa3iaJ?=
 =?us-ascii?Q?TrrygMIhSfiCVi7mnMYm2uMr/PUwzoeXIpUlA9C5N8jy1JJHwsGw9iLo0x67?=
 =?us-ascii?Q?DPosz2NXsPiFATIAQxnJY80JR92d5RiNsEZ4C2Zyisx4NurAPNx5DqmC/wA1?=
 =?us-ascii?Q?YoN5PIZQtM3RVTXPCZraf87B071wJSo9mvws27+FYZ/Dzb6qnd82iH85XRQV?=
 =?us-ascii?Q?djD4lCsmJgnb829DEz3O6RMS0yuiXw7AurV4MD2uATJN/4xGGKlqDNw2Gsrl?=
 =?us-ascii?Q?Uxc8ntcgRzwdweBMmGZDBt4OJZ4e5nDyxEUfgS/IDLzBezXvh7knXfwqLYJC?=
 =?us-ascii?Q?XooZ0bDP24dUI+PT9bkuZnNKroZX7MA1UE/kzBA1D1KZAB21GIkyebHIsJH5?=
 =?us-ascii?Q?0KqLy1cKfOaw+s34yBjV+xvl6jQAEUfjWs8bFpM2Sy98FFJ19ywUqHolTsPp?=
 =?us-ascii?Q?J+PIVkoJVk5NK9tY4znJP0yG4aa0T4rnD3RtO+7nFJBs+ABdjMhdFWsTZ1p0?=
 =?us-ascii?Q?vFGe6MkEls0VDQrC7XeZTmOHtQ2qY+mBgeyIt9yRzKIA1ck6czt/wQ+yzgKQ?=
 =?us-ascii?Q?QhYnsG9sfQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7bbfe8a-f609-49a6-e6e9-08da29cc396b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 10:37:14.0567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dr1eF1bGL6OzGgPA57KIIqtpGwZNeRyFrkVrnyEFRvZaqhdPk6PrEqrEFTIViF9qFcSjoPOeOJCkMn0Mr8bntA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2287

On 29.04.2022 12:30, Roger Pau Monn=C3=A9 wrote:
> On Fri, Apr 29, 2022 at 07:46:47AM +0000, osstest service owner wrote:
>> flight 169819 xen-unstable real [real]
>> flight 169843 xen-unstable real-retest [real]
>> http://logs.test-lab.xenproject.org/osstest/logs/169819/
>> http://logs.test-lab.xenproject.org/osstest/logs/169843/
>>
>> Regressions :-(
>>
>> Tests which did not succeed and are blocking,
>> including tests which could not be run:
>>  test-arm64-arm64-examine      8 reboot                   fail REGR. vs.=
 169775
>>  test-arm64-arm64-libvirt-xsm  8 xen-boot                 fail REGR. vs.=
 169775
>>  test-arm64-arm64-libvirt-raw  8 xen-boot                 fail REGR. vs.=
 169775
>>  test-arm64-arm64-xl-credit1   8 xen-boot                 fail REGR. vs.=
 169775
>>  test-arm64-arm64-xl-thunderx  8 xen-boot                 fail REGR. vs.=
 169775
>>  test-arm64-arm64-xl           8 xen-boot                 fail REGR. vs.=
 169775
>>
>> Tests which are failing intermittently (not blocking):
>>  test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail=
 pass in 169843-retest
>=20
> Looked into this one, and it's slightly concerning, guest seems to be
> stuck at installation:
>=20
> Select and install software  [  481.093857] watchdog: BUG: soft lockup - =
CPU#1 stuck for 23s! [ksoftirqd/1:17]
> [  509.093865] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftir=
qd/1:17]
> [  545.093820] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [  573.093809] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [  609.093855] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftir=
qd/1:17]
> [  637.093836] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftir=
qd/1:17]
> [  673.093957] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [  701.093854] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [  733.093805] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [  761.093817] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [  797.093898] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftir=
qd/1:17]
> [  825.093863] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [  861.093865] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [  889.093945] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftir=
qd/1:17]
> [  925.093974] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [  953.093925] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [  985.093832] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 1013.093855] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 1049.094031] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftir=
qd/1:17]
> [ 1077.093860] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftir=
qd/1:17]
> [ 1113.093938] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 1141.093803] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 1177.094051] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftir=
qd/1:17]
> [ 1205.093805] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftir=
qd/1:17]
> [ 1237.093955] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftir=
qd/1:17]
> [ 1265.094004] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftir=
qd/1:17]
> [ 1301.093835] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 1329.094039] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 1365.093883] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftir=
qd/1:17]
> [ 1393.094167] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 1429.093857] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 1457.093900] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftir=
qd/1:17]
> [ 1489.094026] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 1517.093997] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 1553.093996] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 1581.094064] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 1617.094076] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftir=
qd/1:17]
> [ 1645.093882] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftir=
qd/1:17]
> [ 1681.093896] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 1709.094022] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 1741.093870] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 1769.093854] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 1805.094017] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftir=
qd/1:17]
> [ 1833.093837] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftir=
qd/1:17]
> [ 1869.094043] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 1897.094101] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 1933.093879] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftir=
qd/1:17]
> [ 1961.093933] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 1997.093952] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 2025.093925] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftir=
qd/1:17]
> [ 2057.093895] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 2085.094172] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 2121.094018] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 2149.094021] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 2185.093931] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftir=
qd/1:17]
> [ 2213.093864] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftir=
qd/1:17]
> [ 2249.093951] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 2277.093899] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 2309.094054] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 2337.093956] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 2373.094111] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftir=
qd/1:17]
> [ 2401.094132] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftir=
qd/1:17]
> [ 2437.094064] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 2465.094003] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 2501.093959] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftir=
qd/1:17]
> [ 2529.094050] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 2561.094027] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftir=
qd/1:17]
> [ 2589.094061] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftir=
qd/1:17]
> [ 2625.093999] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 2653.093956] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 2689.094024] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 2717.094093] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 2753.093913] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftir=
qd/1:17]
> [ 2781.094095] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftir=
qd/1:17]
> [ 2813.093959] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 2841.094117] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 2877.094041] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 2905.094009] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 2941.093893] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftir=
qd/1:17]
> [ 2969.094085] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftir=
qd/1:17]
> [ 3005.094061] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 3033.093917] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
> [ 3065.094060] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftir=
qd/1:17]
>=20
> debina1 is one of the boxes I've put into production recently.

ISTR this issue having surfaced randomly before. With the randomness making
it difficult to investigate.

Jan


