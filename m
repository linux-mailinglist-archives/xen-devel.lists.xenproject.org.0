Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0372E3336B2
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 08:53:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95886.181043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJteR-0002ep-1i; Wed, 10 Mar 2021 07:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95886.181043; Wed, 10 Mar 2021 07:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJteQ-0002eO-Tp; Wed, 10 Mar 2021 07:53:02 +0000
Received: by outflank-mailman (input) for mailman id 95886;
 Wed, 10 Mar 2021 07:53:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LfCg=II=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lJteP-0002e9-Hz
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 07:53:01 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e81d9a6-8e8f-4f50-84da-1a1271f57290;
 Wed, 10 Mar 2021 07:53:00 +0000 (UTC)
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
X-Inumbo-ID: 6e81d9a6-8e8f-4f50-84da-1a1271f57290
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615362780;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=1Kssqz+WLgBNHpkenZMOvaFKLGJcIvM6rkrhayhxPuU=;
  b=brRSQ/aoDeLmefkibxkH3ddZKjjPRDGVzX88qz9oEY9qfyr8dNiyJrVE
   tauK+cGbe/PMeywTwE8GT7PAyII3E+ByNGg4nmAoolisy2ASwFcgcsfVo
   BdIzZPjn48iyXVqwWkxAZfZ4OqsAWEzoZOITQA2abssCvsMRBcWudyPnj
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: LSXf9i3fphaDoZwHBHzJTzH2FPXXuXd5vZQXFh7U3p7UCGilgQcug0yJoO36ZMItL8usd3vAGJ
 kMQ0ZX7ZbR4OgAsUVEKTJF4/PMitGB0hWUl/AGf1/l4sJKtw9l/H0VozxJLIEmdjqM13Zjo1wd
 OOMfY2yktMECmKHM1u4grwKiupfSbS6mT5HNi57/JJoE32u4Xby59R+kARzGcIg4I31YQfkiyx
 YmpXZOOfT6X7GXH+arpZ+M/mO2ZXmPlPqu+5gXh26WsnhaqsqD14tFLmugHGD5YNtT/hkPTXYY
 ipU=
X-SBRS: 5.2
X-MesageID: 39111763
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,237,1610427600"; 
   d="scan'208";a="39111763"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQg3UFdoJ2BI+nS9Tj0587DnLOOElvgKgX4TAhyRgmfwxB5aiYlocXTP83yJgcVJQDAKEX2G3J/k9fgGKgBisnaEnLqm/VXBFuc9KKx449kTyIB6/PHeh9s/bYDMfoRyxXETYO59mZ1aEEff4Y3P//lSHLp6WSL30pn5qvuU2Xyb/gQhtuutaz+YJbRIa1U4nSE6bodhSRNQL/1+mrkNx7inZTIFQI1i3wD65Hw6xcw0rWKhDafSeIWGmnNTf1e2+DBnVaugaomi/tAMJsDPzEjHrCMWaWzwMJ9N9X21IRVnb++T+guYREyVhXosw9Ex/buxz3eLVz6dpLq2JdsW6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqzUufE9H0R8/djEDbSikgHNrNawG3lACGzcc953Nqs=;
 b=GnCvv/cMb4v/OcT9xVstDxvbwrb0WVC+RaA56ta+aX2Pwc5DaVRa/eq1oOK7Rmaa4FppFgiXJ3mYL2pqPk5bMUU8GObUeFsTj/r+0e6HJ7In4J3t1bpmTVm1f2hF5jgWl+kpoGBzklK6E+nV1WQtaWzBCUcMz2r+UgGJgCFUAP8zGtq3Ivbqw68ZkgxQng41f+TN5k+huyArliPw6ekAReaGxYGhooPwVu5Idl5IGWSeFrJkHhCan7SX9tjLRovv5zcW/BsfGX0NTR718Lg6QGtuN3303giiIG+WklD0xeTgs3gWL90/jXI++sKDbtmoamuMe5G1SaJ/F5OzGPjX+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqzUufE9H0R8/djEDbSikgHNrNawG3lACGzcc953Nqs=;
 b=DbTuyzpR+/Pe1Hnj/F6NbX8xNUCcXWA4+XOT7IOpk9eWMTiBxFFIwWXd6zYyR2HX8NySQ71ugrURYk2bf969NbYPnSwK3mFIa354Kceft4QGR7F9iwS66S6ieadqVpshRCNQtK6JXy2knapHoeIxyyAvow8E3ytqLnNpgzMdquI=
Date: Wed, 10 Mar 2021 08:52:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>,
	<famzheng@amazon.com>, <cardoe@cardoe.com>, <wl@xen.org>,
	<Bertrand.Marquis@arm.com>, <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@eu.citrix.com>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH for-4.15] xen: Bump the minimum version of GCC supported
 to 4.9 (5.1 on arm64)
Message-ID: <YEh6vmXV8bdhcC1U@Air-de-Roger>
References: <161507188317.11025.6744028462008264481@c667a6b167f6>
 <af575951-9d48-09da-d120-a6120ca29ead@xen.org>
 <alpine.DEB.2.21.2103081654030.16374@sstabellini-ThinkPad-T480s>
 <10b8048a-e8fe-1fcd-7291-7f1b16da2f4c@xen.org>
 <YEdOz4B4rtXbjKOS@Air-de-Roger>
 <alpine.DEB.2.21.2103091423470.16374@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.21.2103091423470.16374@sstabellini-ThinkPad-T480s>
X-ClientProxiedBy: LO2P123CA0099.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18855762-13d1-4eca-a8c4-08d8e39977f9
X-MS-TrafficTypeDiagnostic: DM4PR03MB5998:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB599874F136CA596EBE147D0B8F919@DM4PR03MB5998.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XD81ZkJb1jqGeHC4W6svWA9bZqbYKl2FmVgGaZp0+zIH5pO2uG176am/Wx1rJNyUXIUqS/yd8UqsbMnzZ2FWf5XsGy2RswEoI5TQZlapADZCyyDUfZQTgfdvOZ5EnQACPj1KBtDb85oYd8xUkOSTq+S+D1fiEcfWcuTN1+Yp+nwta0i5WPYFubcElaNKdcFprjzIy4SH6vH0Fg/3gSbd+cte8dFqi8YBci5nEn6wz9VD/JHxFLY9mUj8kqfWeylgKPQe+9wpaC1aUTg6VDjekxVE0j5bMA86qNYXpMbpL8zC6i0OWau/BU9Bz/xoB9qMQemOpBXI5b0W+th5o3DFh9TJQeQ1o1II88tV+WeEoDK1iZRBkgj4M5YDVGcTepa+9p7EBVtQnD4zKWozvbe0zRr7KtL5Ph5zmDj9KH48AAbc9Bo4avZuFKEY8hriiH1EbAFEi6q0z5exdsIfAO2HSKIE6sVoXU96N7+PV+uYV6w0i3nTsYJKue/xis88b/1EUpAW1XDa16N5UnhhRsZFIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(39850400004)(366004)(136003)(376002)(346002)(66556008)(316002)(6916009)(86362001)(83380400001)(6496006)(54906003)(9686003)(478600001)(6666004)(956004)(66946007)(66476007)(6486002)(8936002)(2906002)(186003)(26005)(5660300002)(33716001)(4326008)(16526019)(107886003)(4744005)(53546011)(8676002)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MHRFVVUwQW5iWmNRSVBXNVAxSFlsdWl2QmhnbEl0dG1iMkNNeTM3aEVVT25a?=
 =?utf-8?B?b2x3V0lDdndJMUxzbXNQdm9MbWZxam1CSmFUM3FWeSt1b3VUUi9TR3ZXbHFS?=
 =?utf-8?B?TCt3eHlnb0dremEyUHFmV2hKTDdFZktnM05nQ3o5L2x6TG5wNWxBeWk0Y1ZL?=
 =?utf-8?B?L3B2bURrSXN5UWdTUVZlMG1CbmhUTkhxOUZIK3JxQ3RBdTAwNTEwKzEyRE1k?=
 =?utf-8?B?Q21ybFdJL0hQVVQ0b1U3ejhLMkFnY1pSRzQweVAyMmhXYXVreHhCZVhXejc4?=
 =?utf-8?B?MkE4TTFXS2JYeDhNYzRDQ05zQ2gzZG5YZmxLVEFDbHF1bXg3clFMaHZiRVFh?=
 =?utf-8?B?ZytwTWVKa2pEUGpNdVpjbkh4ZnlOMXpVUk14K3RVaEdrV2hKZmtjdVFmaEF2?=
 =?utf-8?B?TXJhTTd2VHhGNmx6RWwxNlBCUERtZ1d2NGVGOHdXOUZWeXNIaCtud1RadFlk?=
 =?utf-8?B?aHJlUUMvSkdyNGE1em1YeXNqdnVYYjhVdGZNU0tqL29FeGI5QkNacHBSRUxF?=
 =?utf-8?B?alRyMk1LaDltVm5qZzk0VWJWWkE0WDY4WmZyUGdFUU51Z2FtQ3Fudy92R24x?=
 =?utf-8?B?aUJ5R1ZMOWRFQ3RWVVA2SWRQK2NvNTlza0JhbDFVNml6Qld5aEFRMTZzM0du?=
 =?utf-8?B?dDBUaktkMzJKSzhabjhCUG85S09IVWZWWEY1OXZzV2RLakIzVmljb21nbWpW?=
 =?utf-8?B?MXVRVjg5ZnJMbEZBa3Q3emhKbXgzSzlDdGlYYWxDSDNCSExCMENRaVlzbWpn?=
 =?utf-8?B?bWVHTWU1WGgwNElhZU5PbGtLMTk4RXZMN2RjK08zNktDK0lsdHd4SUNyazMv?=
 =?utf-8?B?NlgwRk9Lb1E0d1lvcWJaQTF4eDVWTk5iS2M3U1o2dmpQK2xQeXUvNWFidlAv?=
 =?utf-8?B?TnU5Vy9ycGl3VTQyVUcvOXhWVDlTR1I5eHNNbTBSenF2cmpxRXRtZUQ2bWxO?=
 =?utf-8?B?S0VsVlZ3eFA4K0lQU1M1TnNxT2ZJbTdJeFkxRkhNTlpyOHpCbldTd2o0R0FU?=
 =?utf-8?B?d1ZJTmcvVWpJQUd3RlhNVjdudzdOZlAzdmJhdSs2SDJxaEJCSTQvVmJkbGtt?=
 =?utf-8?B?K1RwQndtQ2hRcVVOekhGa1o4NWx1ekxwWUZvSFMzK3g5eVg5Zk9XYkFEcVFU?=
 =?utf-8?B?K1BjSzJmUnEreTIxdVZXcVpsdkFkZHJ4UEltVjBjSXZVOExlYlo1Rk5wWUVR?=
 =?utf-8?B?Q1hMR2VicEFibWdIb3VuTGRaaXgybmtNMVFUZ1laZ2F6WjU3c2IwWERnQndP?=
 =?utf-8?B?OGhMYWZPQWdRcWxhQUNSWDRqQWYyYnJHalprcXJWSk1udW81R0hFeDlrbEFs?=
 =?utf-8?B?QTJzRW12aXlQME9JVThkaEhidXcxblpSRlVKajFPT0R4OGkxVHNCMnp0VlZ1?=
 =?utf-8?B?T3lDdGRDZ1JaVDlQNi9RcXpLbkN3TUdSTUl4N1ZxSlkxQkQyMDFnOUdqRTYy?=
 =?utf-8?B?UFpDaWZpMVIxeG5zYS9xcitPaDR2TlIvY3o3ck5yMEJVaXVoQ2RkYjFQdW9l?=
 =?utf-8?B?TXZycElpN1ZqSjJ0SWNMUlZTSmhaTE16emQrWlhCaVFOcVQzaWVsY0pMLzBp?=
 =?utf-8?B?YlhucDlFanAzcW1JM1JtN3prc1FpSXNCc1dTRUs4WkloQ2NGNEFrYnhVVHd2?=
 =?utf-8?B?VUZnQVMzMlNRUENYM2FsNTB2bmp5Wko4VlprQ1Z0RmpDc292dzl4WXJzVGdk?=
 =?utf-8?B?bnhoSFpiSXFCUjc0VVpZRjZaRHF3aXgybVV1eEtHdDZCVGVJcVRKUnd5Uk9U?=
 =?utf-8?B?VlF3aWdtRHI2eVRNY3d4WW9INW9pRi9tNkJlVElDUm9oMUMwWURWdkNQd1RR?=
 =?utf-8?B?azF3SEpKNFpnSC9ocDk2Zz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18855762-13d1-4eca-a8c4-08d8e39977f9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 07:52:35.6402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D5WGhbquQFwWOFyuYjkCLeBT4oA57dTmtaZn0ypJi28txYZpOiJeGgpvGIea8Ynmnt7/NIAnbdWPPiro7Ywv7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5998
X-OriginatorOrg: citrix.com

On Tue, Mar 09, 2021 at 02:24:05PM -0800, Stefano Stabellini wrote:
> On Tue, 9 Mar 2021, Roger Pau Monné wrote:
> > On Tue, Mar 09, 2021 at 10:05:18AM +0000, Julien Grall wrote:
> > > Hi Stefano,
> > > 
> > > On 09/03/2021 00:59, Stefano Stabellini wrote:
> > > > On Sun, 7 Mar 2021, Julien Grall wrote:
> > > > > On 06/03/2021 23:04, no-reply@patchew.org wrote:
> > 
> > Where does one has to register to get the patchew build failures?
> 
> By asking Fam (CC'ed) very nicely :-)

Thanks! Could we maybe setup a mailing list for those emails? ie:
patchew-tests@... or some such, so that we don't have to go adding
people manually?

Roger.

