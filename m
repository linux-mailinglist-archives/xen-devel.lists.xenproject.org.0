Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DED3BF948
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 13:44:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153029.282703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1SRm-00056R-1M; Thu, 08 Jul 2021 11:44:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153029.282703; Thu, 08 Jul 2021 11:44:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1SRl-00054I-Ug; Thu, 08 Jul 2021 11:44:01 +0000
Received: by outflank-mailman (input) for mailman id 153029;
 Thu, 08 Jul 2021 11:44:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qibP=MA=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m1SRk-00054C-VR
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 11:44:00 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 570e777a-fa20-4be8-9ab8-ce5188528d6a;
 Thu, 08 Jul 2021 11:43:59 +0000 (UTC)
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
X-Inumbo-ID: 570e777a-fa20-4be8-9ab8-ce5188528d6a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625744639;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=iWDMupBO+rDIxrUq5GS6por6hOtDOQJtJ+daBsoBA0k=;
  b=Aznoi1bXvR2qlQfsBaIXphdwe4B3jtFR45YZ8yUSgSdffKWTEqAcsbPZ
   zxhMqQOrOcR/c2zLjM+IY2tdykUdSBUzAaMOZUDQJxMEEAGwdw4mx5mBg
   EnimT99LhhreyFlCd4foNBtjpvSgDsVCfL0CeQYS+iaeVxWXvvKqPcd0R
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: PighIETYezsLKuRe2KH3niMeUo045W2nfpH+vMtsvbcAiEMAMFET6Xq6NH1hGyZiMlg9elG8CQ
 9QKcrdun3EFx7tx7FbVnKBFZ5I6bZ0XjDvOMzLwhnFuwQRG8aOmXh/G/9PHNIlT6rge0lOkp3w
 IZqkn+NC9k961o8oFSZ9TcFwUlZH8m7z//WHHEPu3rfQGFJBxmROm3CC4vV4rzUF3jXO/O4GfB
 NRsBnSYKgwa/fkSNyVxtLZuJUh3gew5LfeE0N0n5kETfjoZEe4TgyugBI+wNp6Z57LZx2ErOAh
 0rI=
X-SBRS: 5.1
X-MesageID: 47818272
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:pUvyPqvW6EMnRHDLXyCSlpBC7skDjNV00zEX/kB9WHVpm6yj+v
 xGUs566faUskd0ZJhEo7q90ca7Lk80maQa3WBzB8bGYOCFghrKEGgK1+KLrwEIcxeUygc379
 YDT0ERMrzN5VgRt7eG3OG7eexQvOVuJsqT9JjjJ3QGd3AVV0l5hT0JbTpyiidNNXJ77ZxSLu
 v72uN34wCOVF4wdcqBCnwMT4H41qf2fMKPW29+O/Y/gjP+9Q+V1A==
X-IronPort-AV: E=Sophos;i="5.84,222,1620705600"; 
   d="scan'208";a="47818272"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OY5ZO28md9q7893R1cZcJ8HIbUOGGwUrlMozJhdW3cI2jxW4m7IRNrvrrVLUTThI9TqFRncTQBTo1mw6LfTFQFtyLUhWyGD2ttgllIF9YzhgtI0MJ4pyBspWtgpAy4seWi2gZcVTROyT1F0kJH15Nyf/sO7DMjK4uURu5FmkKatTjqLIyTImWd4LhG5F0ikTQLwvatc1DNJqORAKWep31K9xl/spcDgSFlkKcn5Jd2KVdrMRzh0v78LqM9sKzsuve89WSrYBa+/eniVKLcOQx7ebau/CL4XADmWVf8Ybq6K7BV3GWpYSbBB6H+tMX+kPlOz93FM4EZbGfxk0G+CBtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8YI1I2uH2ODMa7er0pTVVBQk+8xgk97Su8uLqmTzWWo=;
 b=ZGzCNOuYAO3KHe1GyFnKx7+ZNzIvp7KXIiYQtkwcYSB6RN2TAcC1tkcipf/+Ork+qyxkIzKhBhHk/hRQfHBM73mLYGC72x0NCmdej3IMAt/I7LHWoyI3Drgr2Js9VLup6fdwl4h+7g2QPod51uXO/x1ydbkegWTXP4vFeMprs6caZNBTMyVl/CtBQacuyxH7ufFHsQjeTjp6Db45NfwTZUQrikVBrYIW4viBI42G82OXX8NYAD2S8PHg415qOViPjEBL0q0k8L7CHO095Q8yb0RWSH5WJ1JjZLK0AIvqTqTqWWzVRnhjf8UoqQv+orNIh9H9+BaLiXJO6ZRZRNvJNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8YI1I2uH2ODMa7er0pTVVBQk+8xgk97Su8uLqmTzWWo=;
 b=ve2UtVgz3i8Htq6YJwx72itEcxda10j/a5rzBryEmKta7/GkLa2r7Oa6U23HFchXTmIERuUKvezOOaAd56WY7aCeJ6TkADD2cFtmQqmPMaW/jYgeL+Z+f0d4pqdGijRIjFtNPqjcVnOxvAZj6vpjX7XUSvr51jxoF2bFGD+lSL8=
To: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>
References: <20210708065435.24515-1-olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v1] automation: collect log files in subdirectories
Message-ID: <e84e3fd4-5439-4e15-e363-35c70fa8cad9@citrix.com>
Date: Thu, 8 Jul 2021 12:43:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210708065435.24515-1-olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0464.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bbc9f27-17b9-4197-cc44-08d94205a5b5
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5534:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB553441BADD6C3AC9B1299E50BA199@SJ0PR03MB5534.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pkOg7pXfrR5m477YYIw3kR9J7fi90cuqCO30KSxVYo5aVqn8oORXi494VMeWLuQvCklrMcxo7vJDwUI9Duofx8mBBwoKvf5wx39WkCDIOwoVGMQNrWMaIlLaWCBqQ3L4fyjkarEgKNLmVwaZdC+jpS3SOFVy8sP5Mpicp/nzEUy6X94WBnUSGRGLDImL/00H625jZ421gwHAcVSO62nOIFSIpWe9RZS0ZZ1E5nkwynwU5r+h+QJL867wBQkV0/+wzrZ6w69Z/q7sTLR+5SJ1tkG4zMXIxkaGdRa5SI6OsAaCV5AYb0jdAGgwXdrI78xTxobQUjX9x2EnBRno/4R055WSLRc/jWcZ0f5cgkRCZXATwFYDRog5xISF274jDJjv31Pq3QHk1nMO8h4o01ZfCxgDIpIsG8Va49NS0+p0povgWXT1WalTZX6THF8aH51AodI3IuvLqYOoZb3FmybtG3QpFjbcRDU/alOzUQkOEXO6Tec0He+KaCJtsYSqEJ7uhMHOigzCUTIr3hG32/HfAYcedKIiRJbScK+Q/meVSpSa6LuW2F6GXS1TeOywrIipM9fI6qE1QiyTH2cWwsdb0YZSBRh6k1biYD4NXL9XG/3A4R5CCtgiaAj9hQsRNu8LHwzWSBguMC35Ut4x35qeEUsYpTpavZ5fF5wZnOZSqmZ8eG5/9eaBee1QR5NxvNCuwg1COtX65hFMpEHhePWcR7R2BZZEuBY4vuF7/qPqjvJNRLaAXFKbWWCZAJzi32fxAx+lwbsWPKLdxgKN0SnhvgrHaNLN7uHMIxLwgxWZ3C0C2cITh8scPmQyHXigRo8N
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39860400002)(376002)(136003)(396003)(31696002)(5660300002)(38100700002)(186003)(6486002)(36756003)(31686004)(83380400001)(16576012)(8676002)(6666004)(86362001)(4326008)(4744005)(478600001)(8936002)(66476007)(26005)(66556008)(956004)(66946007)(2906002)(966005)(316002)(53546011)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnozU0lTdmFudE42a29Yd0Jxbmtzb0dwYTNYZ0pIR0VWNnBUK09zY01VcEF0?=
 =?utf-8?B?V0JXVlR2NmRyVHNZNWRzUXRxZzc2UzdCSDd2a040NVdiZmpvT1ppYlU1N3hx?=
 =?utf-8?B?T0ptRTNQSHNrRUZwUE1US2VKZEJLeVNFSjhibEcrR3VqQnFiUSt6RFVtZE9s?=
 =?utf-8?B?YVRKd0tFU2g4djRZdm9tS0JuVzRPT2RTRGg3N1RxZVRnU3lXYk85a0FDNlhy?=
 =?utf-8?B?WVR5RnpweURMdUxwZlQxMEFLTGxZOXFLOVBpM2dSTjJ4T090clM0SHRzSXRG?=
 =?utf-8?B?ZTVQTGMwcTJ3R29SeUQrL3hrRkJzRU1zQ0oxYkJxQTUweVU0NnNPVStWbXZj?=
 =?utf-8?B?L29GWHZjMDIxUm5qY3FrK2FtcE1IbWM1dXI0eWVIWi9RdmFKODQ4eFJKZ05F?=
 =?utf-8?B?VXBhVmNYeDR0a1RYR0w0NGY4VDRWY2V4VUtadTVPaGhWbDMvTVlTbWw0bE9J?=
 =?utf-8?B?dlBBTVRHcXhYU0RGTVRCK3R6akxOM2pPMHpJZCt0Ukc4dkw1K2VuQWxKVDRP?=
 =?utf-8?B?bmViSTNoT1JCc281Sk0ya2VOdmptN2Z5L1E2Q1lOVDBXQUlpM0o0bkgrYS93?=
 =?utf-8?B?MStLN0tjQ3RmT2ZTNEdEQUJOV0pVajJQbi9lakM1Wlc5MGswWWdEeHlYRG50?=
 =?utf-8?B?VDNsQUdBRjREbVdlOEZzQzJUMWhTZDNGMkM2K2RJb2M3NVRJVTlrTldaQklx?=
 =?utf-8?B?c0JGVEJjUVRhbUlxeXY1OVpFTDB6QlhoenBQbStPeG1pLzdDa2JPMGcwRTFL?=
 =?utf-8?B?U2c0RERMMUZ3eS9GOEphNCtJc2kvdWVkNTIyMDFBcGg2U3ZSVTlqd2xXMktR?=
 =?utf-8?B?Y0J5YzdGNGhpQWlnakNBOTd2R2ppL1V2LzFpRC9wRkxOOXVoajRKOHl1eHk3?=
 =?utf-8?B?M0hsRDRTMG14THovVGRaQWJKTU83MHROS2JETmtXVGU4cWNGZWVPMHIxdHJK?=
 =?utf-8?B?dFpBMVR0b3JWMXROZEpYMlJCNXdLRUxHcHIzN2FxY1pRSGU5Q0I5TUZ1NlNI?=
 =?utf-8?B?UXczd2JkQUNpRE5EK3JDcVpBREJFN0ozT0NEN3FrSG5QMldmT0J6MVQ3R3Jp?=
 =?utf-8?B?UUEycGRxb0JvSW1odHp2VlMyK2ZHRFJKdkQ1RlBEU2VLOHlDY2k1MmJEK0hB?=
 =?utf-8?B?VTBGL0hBU3ZWSlNXT1JGWDNjL1VJeTg2ZHplenplMkQ2RXdaV1NVanY4dXY0?=
 =?utf-8?B?R2o0eDhRamlSandrQ0k2QmZkWjg3Nm9tNi9xZWYwOCtUQ0tncXJwa3g4NFI4?=
 =?utf-8?B?aUFYQmVJdnErOEpicG1LZVVVUW1ESWI1OGRMSm12OFl6R2RlV2hRK0RWdXpX?=
 =?utf-8?B?YW0ramVWdWJWbXEzS2hSZ2tlYnphczZWTWRvZ0s5OHczRzl3OTNTY3hEemNF?=
 =?utf-8?B?Zi8rZEw0dlYvYnN5VmE0cU9FVGRsRkNFZitCcVJrc3JWckhIOXFYYm5oZ3N5?=
 =?utf-8?B?amdPMDl3aHc2VmtNcStLR2F3a2l1Vy8vVlliMFpIUnp6UGJUM3oyeXE2N3Qx?=
 =?utf-8?B?SmNvVUdUOWdzL0J3Smdxais1dkJhUy9TeGYwdElEZDZHZk5ybEV3YzlaTDJS?=
 =?utf-8?B?ekJBL1pTVFQxdlMrVDNSdnVycVFKYVJsbVNTQ2J6NGFJYmkzd045aWhNa1h6?=
 =?utf-8?B?Vi9xZTd6aytjSDgwZzZoRCtHaGt0VzRzV2hmd29KVW5JZU95TXRZUUdMbjVs?=
 =?utf-8?B?TjFrMFhYSGU1cS8ySGF1Z3YzcVJ3TWcvdGQraUk5VnZpWkJFd0JkNS9PcDRo?=
 =?utf-8?Q?lHAg9JwL4JkZ6P5AocmPb7WIhu+GQKxEz8lYACc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bbc9f27-17b9-4197-cc44-08d94205a5b5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 11:43:47.3889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1jYllLtWTPQe9iikBEREVbfXUyIOoXfLbzEP531Wuq2/+cprV+IITn5dTr0jguoVHmZNcIB/c0SHnZS3c/mUzkgJpX3FKuUGeE0ktgg4Pss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5534
X-OriginatorOrg: citrix.com

On 08/07/2021 07:54, Olaf Hering wrote:
> The current single *.log pattern collects just config.log, which
> usually contains little useful information.
> Collect also log files in subdirectories, tools/config.log usually
> contains information about configure failures.
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>  automation/gitlab-ci/build.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> No idea if the syntax is correct, and how I would test such changes mysel=
f.

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/333797480
is a pipeline running with this patch in place.

As for testing, get an account on Gitlab.=C2=A0 I'll add you to xen-project=
,
after which pushes to your local fork of Xen here will use the
project-wide runner configuration, rather than using the Gitlab's pool
of public workers (which amongst other things, lack ARM).

~Andrew


