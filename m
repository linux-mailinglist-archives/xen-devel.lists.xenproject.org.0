Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAA465885
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2019 16:09:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlZgY-0005Wu-Ui; Thu, 11 Jul 2019 14:04:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zLEP=VI=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hlZgW-0005Wp-RK
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2019 14:04:32 +0000
X-Inumbo-ID: c2027445-a3e4-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c2027445-a3e4-11e9-8980-bc764e045a96;
 Thu, 11 Jul 2019 14:04:26 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 11 Jul 2019 14:04:16 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 11 Jul 2019 13:40:16 +0000
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 11 Jul 2019 13:40:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K1lPVLvym1FtdDOkZ/j5Eq2R7i2FflW1ZbpeSyi0lRIrCfqCHMFR0mS2ordZVSi3Geyjo+L/VP8AWGqU2hMADkRKs6zRz1IatIpXcnLS4I56ye6kqkEZpIsnmV7isrx/ZrAnzqlYiufw6Xjs+I2/MbMnOSIHvN8tnJzPA8Im0pW6HVBXmXHIchDZo7S9RL5HCnWskKDJoCtm23Ly7wN37m3qlVjzYEaX8DcGx69EoMY5LJUJIi08WBIqLf6z/SQTIc2OZX766PW08TeACbPLX1QmjrZiIWajEqCkhTToWdno1YlrmU0IaGxKlsQlLv4CL9KskewxgAPtBbBGZT2oUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0Cn2lB+GhwwQbnqfAA1Uev0nmcxwO4bnAGWCJIodiU=;
 b=kME9ZUAVvd1JuiJIucJaacellEgkUG4tFOfDgEType8kxQaJHDO2HtrKDurhvnDebCO9rEUyTP9aEYiuuTduWtMsamkZgb7Re9R+62ZGWhMEgZz2k+mSybkXLlKcnqehBDw1P3PAt1OiCFanPbsTlEVtQW9nRBCUyB0gXGlpVnco7U6zQaOkv3XObTihRtnzOqnlvOlCDbUiDXm7JcyejztWMnK1I+RjqPXiBX+pIp3jEa1z5POvsKJzkW+Z5yGe8WrG6ZeQ79kiPkKFrwAn+bKO+h49fBSnctogwALj6Fgqg46l85bA7rs1uzJdWU9nfbKE/vrpAlqfH05Icnfb4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM5PR18MB1499.namprd18.prod.outlook.com (10.175.220.20) by
 DM5PR18MB2326.namprd18.prod.outlook.com (52.132.208.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Thu, 11 Jul 2019 13:40:13 +0000
Received: from DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::b8ae:df10:7b4a:5245]) by DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::b8ae:df10:7b4a:5245%3]) with mapi id 15.20.2052.020; Thu, 11 Jul 2019
 13:40:13 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <JGross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH 00/60] xen: add core scheduling support
Thread-Index: AQHVN+4q1/wC7eqyt0OnXkyWABT13w==
Date: Thu, 11 Jul 2019 13:40:12 +0000
Message-ID: <7d3bab61bb623939fd770578b7a8e451d6254c22.camel@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
In-Reply-To: <20190528103313.1343-1-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2b4e57f-2e35-4fe9-65f8-08d706054cf5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:DM5PR18MB2326; 
x-ms-traffictypediagnostic: DM5PR18MB2326:
x-microsoft-antispam-prvs: <DM5PR18MB232615478872D330894D931CC5F30@DM5PR18MB2326.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0095BCF226
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(189003)(199004)(52314003)(7416002)(8676002)(6486002)(478600001)(2501003)(2906002)(81166006)(229853002)(966005)(26005)(81156014)(6436002)(91956017)(66946007)(256004)(14444005)(64756008)(66556008)(66476007)(76116006)(30864003)(66616009)(3846002)(99936001)(6116002)(186003)(66446008)(66066001)(11346002)(446003)(2616005)(305945005)(6246003)(14454004)(53366004)(8936002)(486006)(476003)(99286004)(110136005)(7736002)(316002)(53936002)(53376002)(76176011)(71190400001)(71200400001)(25786009)(102836004)(6506007)(86362001)(6306002)(6512007)(68736007)(36756003)(66574012)(4326008)(5660300002)(54906003)(53946003)(118296001)(559001)(579004)(569006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB2326;
 H:DM5PR18MB1499.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YtJR3Tr93kf1XoNExJzLYGPfDKedxoTquew0w5aM3s+hu8cUiRRwVcVtWbRFt3YC6eA99pSw2xzzn5A4waZZ3XgzeVvkKwSub6H2lo50G/9huTlF2U13e6sNavG2AdFZhweU/GQqjUIchZpDYCQpetsfmeld2Luc+5luH3oFR45Xbe5QrCBqV9/nu+tiB8Uq89lHBA/93HrJIz4cSaoejcvEupCEHC6Eqq4kqwdO2LMEHlVEfDDbeyDAgSrNtbzQDTFhJTFd5o1xWp29SuPtUsYWUmWV6K4xxrl6f/E3D/w23ltbAccSfD2ncz4112D04kuLpoNfVy0QOs8oOiKu/WQBqOGl38OYU32NvH2GeI2nJnuJmVGrB6vvS7iQbJrmnU1b9uLs0xi7YjdQM6lQTuYe7znhnIAKZUyvrAG42ic=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d2b4e57f-2e35-4fe9-65f8-08d706054cf5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2019 13:40:12.8515 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dfaggioli@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB2326
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 00/60] xen: add core scheduling support
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "robert.vanvossen@dornerworks.com" <robert.vanvossen@dornerworks.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "josh.whitehead@dornerworks.com" <josh.whitehead@dornerworks.com>,
 "mengxu@cis.upenn.edu" <mengxu@cis.upenn.edu>, Jan Beulich <JBeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============2827901010866463025=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============2827901010866463025==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-1M+ohW2RqCLPOauDglt2"

--=-1M+ohW2RqCLPOauDglt2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-05-28 at 12:32 +0200, Juergen Gross wrote:
> Add support for core- and socket-scheduling in the Xen hypervisor.
>=20
> [...]
>
> I have done some very basic performance testing: on a 4 cpu system
> (2 cores with 2 threads each) I did a "make -j 4" for building the
> Xen
> hypervisor. With This test has been run on dom0, once with no other
> guest active and once with another guest with 4 vcpus running the
> same
> test. The results are (always elapsed time, system time, user time):
>=20
> sched-gran=3Dcpu,    no other guest: 116.10 177.65 207.84
> sched-gran=3Dcore,   no other guest: 114.04 175.47 207.45
> sched-gran=3Dcpu,    other guest:    202.30 334.21 384.63
> sched-gran=3Dcore,   other guest:    207.24 293.04 371.37
>=20
> The performance tests have been performed with credit2, the other
> schedulers are tested only briefly to be able to create a domain in a
> cpupool.
>=20
I have done some more, and I'd like to report the results here.

For those that are attending the Xen-Project Dev Summit, and has seen
Juergen's talk about core-scheduling, these are the numbers he had in
his slides.

They're quite a few number, and there are multiple way to show them.

We arranged them in two different ways, and I'm showing both. Since
it's quite likely that the result will be poor in mail clients, here
they are the links to view in browser or download text files:

http://xenbits.xen.org/people/dariof/benchmarks/results/2019/07-July/xen/co=
re-sched/mmtests/boxes/wayrath/summary.txt

http://xenbits.xen.org/people/dariof/benchmarks/results/2019/07-July/xen/co=
re-sched/mmtests/boxes/wayrath/summary-5columns.txt

They're the same numbers, in the two files, but in
'summary-5columns.txt' has them arranged in tables that show, for each
combination of benchmark and configuration, the differences between the
various options (i.e., no core-scheduling, core-scheduling not used,
core-scheduling in use, etc).

The 'summary.txt' file, contains some more data (such as the results of
runs done on baremetal), arranged in different tables. It also contains
some of my thoughts and analysis about what the numbers tells us.

It's quite hard to come up with a concise summary, as results vary a
lot on a case by case basis, and there are a few things that needs
being investigated mode.

I'll try anyway, but please, if you are interested in the subject, do
have a look at the numbers themselves, even if there's a lot of them:

- Overhead: the cost of having this patch series applied, and not=20
  using core-scheduling, seems acceptable to me. In most cases, the=20
  overhead is within the noise margin of the measurements. There are a=20
  couple of benchmarks where this is not the case. But that means we=20
  can go trying figuring out why this happens only there, and,=20
  potentially, optimize and tune.

- PV vs. HVM: there seem to be some differences, in some of the=20
  results, for different type of guest (well, for PV I used dom0). In=20
  general, HVM seems to behave a little worse, i.e., suffers from more=20
  overhead and perf degradation, but this is not the case for all=20
  benchmarks, so it's hard to tell whether it's something specific or=20
  an actual trend.
  I don't have the numbers for proper PV guests and for PVH. I expect=20
  the former to be close to dom0 numbers and the latter to HVM=20
  numbers, but I'll try to do those runs as well (as soon as the=20
  testbox is free again).

- HT vs. noHT: even before considering core-scheduling at all, the=20
  debate is still open about whether or not Hyperthreading help in the=20
  first place. These numbers shows that this very much depend on the=20
  workload and on the load, which is no big surprise.
  It is quite a solid trend, however, than when load is high (look,=20
  for instance, at runs that saturate the CPU, or at oversubscribed=20
  runs), Hyperthreading let us achieve better results.

- Regressions versus no core-scheduling: this happens, as it could=20
  have been expected. It does not happen 100% of the times, and=20
  mileage may vary, but in most benchmarks and in most configurations,=20
  we do regress.

- Core-scheduling vs. no-Hyperthreading: this is again a mixed bag.=20
  There are cases where things are faster in one setup, and cases=20
  where it is the other one that wins. Especially in the non=20
  overloaded case.

- Core-scheduling and overloading: when more vCPUs than pCPUs are used=20
  (and there is actual overload, i.e., the vCPUs actually generate=20
  more load than there are pCPUs to satisfy), core-scheduling shows=20
  pretty decent performance. This is easy to see, comparing core-
  scheduling with no-Hyperthreading, in the overloaded cases. In most=20
  benchmark, both the configuration perform worse than default, but=20
  core-scheduling regresses a lot less than no-Hyperthreading. And=20
  this, I think, is quite important!

- Core-scheduling and HT-aware scheduling: currently, the scheduler=20
  tend to spread vCPUs among cores. That is, if we have 2 vCPUs and 2=20
  cores with two threads each, the vCPUs run faster if we put each one=20
  on a core, because each one of them has the full core resources=20
  available. With core-scheduling implemented this way, this happens a=20
  lot less. Actually, most of the times work is run on siblings,=20
  leaving full cores entirely idle. This is what hurts pretty much the=20
  results of  the runs done inside an HVM guest with 4 vCPUs. It must =20
  be said, however:
  * that this also means performance are more consistent, and=20
    independent on the actual CPU load. So, if you have a VM and share=20
    an host with other VMs, performance of your workload depend less  =20
    on whether the others are running or idle;
  * I expect this issue to be addressed, at least partially, by=20
    exposing a topology to the guest that takes into account that,=20
    thanks to core-scheduling, some vCPUs are actually SMT-siblings. =20
    In fact, at that point, it will be the guest's scheduler job to=20
    decide whether to consolidate or spread the work. And if it=20
    decides to spread it, that means tasks will run on vCPUs that are=20
    not virtual SMT-siblings, and hence run on different cores (if \
    they are available) at the host level.

Anyway, I've written way too much. Have a look at the results, and feel
free to share what you think about them.

Regards,
Dario
---
XEN CORE-SCHEDULING BENCHMARK
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

Code:=20
 - Juergen's v1 patches, rebased
   git: https://github.com/jgross1/xen/tree/sched-v1-rebase

Host:
 - CPU: 1 socket, 4 cores, 2 threads
 - RAM: 32 GB
 - distro: opneSUSE Tumbleweed
 - Kernel: 5.1.7
 - HW Bugs Mitigations: fully disabled (both in Xen and dom0)
 - Filesys: XFS

VMs:
 - vCPUs: either 8 or 4
 - distro: opneSUSE Tumbleweed
 - Kernel: 5.1.7
 - HW Bugs Mitigations: fully disabled
 - Filesys: XFS

Configurations:
 - BM-HT: baremetal, HyperThreading enabled (8 CPUs)
 - BM-noHT: baremetal, Hyperthreading disabled (4 CPUs)
 - v-XEN-HT: Xen staging (no coresched patches applied), Xen dom0, 8 vCPUs,=
 Hyperthreading enabled (8 CPUs)
 - v-XEN-noHT: Xen staging (no coresched patches applied), Xen dom0, 4 vCPU=
s, Hyperthreading disabled (4 CPUs)
 - XEN-HT: Xen with coresched patches applied, Xen dom0, 8 vCPUs, Hyperthre=
ading enabled (8 CPUs), sched-gran=3Dcpu (default)
 - XEN-noHT: Xen with coresched patches applied, Xen dom0, 4 vCPUs, Hyperth=
reading disabled (4 CPUs), sched-gran=3Dcpu (default)
 - XEN-csc: Xen with coresched patches applied, Xen dom0, 8 vCPUs, Hyperthr=
eading enabled (8 CPUs), sched-gran=3Dcore
 - v-HVM-v8-HT: Xen staging (no coresched patches applied), HVM guest, 8 vC=
PUs, Hyperthreading enabled (8 CPUs)
 - v-HVM-v8-noHT: Xen staging (no coresched patches applied), HVM guest, 8 =
vCPUs, Hyperthreading enabled (4 CPUs)
 - HVM-v8-HT: Xen with coresched patches applied, HVM guest, 8 vCPUs, Hyper=
threading enabled (8 CPUs), sched-gran=3Dcpu (default)
 - HVM-v8-noHT: Xen with coresched patches applied, HVM guest, 8 vCPUs, Hyp=
erthreading enabled (4 CPUs), sched-gran=3Dcpu (default)
 - HVM-v8-csc: Xen with coresched patches applied, HVM guest, 8 vCPUs, Hype=
rthreading enabled (8 CPUs), sched-gran=3Dcore
 - v-HVM-v4-HT: Xen staging (no coresched patches applied), HVM guest, 4 vC=
PUs, Hyperthreading enabled (8 CPUs)
 - v-HVM-v4-noHT: Xen staging (no coresched patches applied), HVM guest, 4 =
vCPUs, Hyperthreading enabled (4 CPUs)
 - HVM-v4-HT: Xen with coresched patches applied, HVM guest, 4 vCPUs, Hyper=
threading enabled (8 CPUs), sched-gran=3Dcpu (default)
 - HVM-v4-noHT: Xen with coresched patches applied, HVM guest, 4 vCPUs, Hyp=
erthreading enabled (4 CPUs), sched-gran=3Dcpu (default)
 - HVM-v4-csc: Xen with coresched patches applied, HVM guest, 4 vCPUs, Hype=
rthreading enabled (8 CPUs), sched-gran=3Dcore
 - v-HVMx2-v8-HT: Xen staging (no coresched patches applied), 2x HVM guest,=
 8 vCPUs, Hyperthreading enabled (8 CPUs)
 - v-HVMx2-v8-noHT: Xen staging (no coresched patches applied), 2x HVM gues=
t, 8 vCPUs, Hyperthreading enabled (4 CPUs)
 - HVMx2-v8-HT: Xen with coresched patches applied, 2x HVM guest, 8 vCPUs, =
Hyperthreading enabled (8 CPUs), sched-gran=3Dcpu (default)
 - HVMx2-v8-noHT: Xen with coresched patches applied, 2x HVM guest, 8 vCPUs=
, Hyperthreading enabled (4 CPUs), sched-gran=3Dcpu (default)
 - HVMx2-v8-csc: Xen with coresched patches applied, 2x HVM guest, 8 vCPUs,=
 Hyperthreading enabled (8 CPUs), sched-gran=3Dcore

Benchmarks:
 - Suite: MMTests, https://github.com/gormanm/mmtests (e.g., see: https://l=
kml.org/lkml/2019/4/25/588)
   * Stream: pure memory benchmark (various kind of mem-ops done in paralle=
l). Parallelism is NR_CPUS/2 tasks (i.e, . Ideally, we wouldn't see any dif=
ference between HT, noHT and csc;
   * Kernbench: builds a kernel, with varying number of compile jobs. HT is=
, in general, known to help, at least a little, as it let us do more parall=
el builds;
   * Hackbench: communication (via pipes, in this case) between group of pr=
ocesses. As we deal with _groups_ of tasks, we're already in saturation wit=
h 1 group, hence we expect noHT to suffer;
   * mutilate: load generator for memcached, with high request rate;
   * netperf-{udp,tcp,unix}: two communicating tasks. Without any pinning (=
either at hypervisor and dom0/guest level), we expect HT to play a role, as=
 depending on where the two task are scheduler (i.e., whether on two core o=
f the same thread, or not) performance may vary;
  * pgioperfbench: Postgres microbenchmark (I wanted to use pgbench, but ha=
d issues);
  * iozone: I have the number, but they're not shown here (needs time for l=
ooking at them and properly present them).

Raw results:
 - On my test box. I'll put them somewhere soon... :-)

Result comparisons:
 1) BM-HT vs. BM-noHT: check whether, on baremetal, for the given benchmark=
, HT has a positive or negative impact on performance
 2) v-XEN-HT vs. XEN-HT: check the overhead introduced by having the coresc=
hed patches applied, but not in use, in case HT is enabled. This tells us h=
ow expensive it is to have these patches in, for someone that does not need=
 or want to use them, and keeps HT enabled;
 3) v-XEN-noHT vs. XEN-noHT: check the overhead introduced by having the co=
resched patches applied, but not in use, in case HT is disabled. This tells=
 us how expensive it is to have these patches in, for someone that does not=
 need or want them, and keeps HT disabled;
 4) XEN-HT vs. XEN-noHT vs. XEN-csc: with coresched patches applied, compar=
e sched-gran=3Dcpu and HT enabled (current default), with turning HT off an=
d with sched-gran=3Dcore (and HT enabled, of course). This tells us how muc=
h perf we lose (or gain!) when using core-scheduling, as compared to both d=
efault and disabling hyperthreading disabled. Ideally, we'd end up a bit sl=
ower than default, but not as slow(er) as with HT disabled.
 5) HVM-v8-HT vs. HVM-v8-noHT vs. HVM-v8-csc: same as above, but benchmarks=
 are running in an HVM guest with 8 vCPUs.
 6) HVM-v4-HT vs. HVM-v4-noHT vs. HVM-v4-csc: same as 5), but the HVM VM ha=
s now only 4 vCPUs.
 7) HVMx2-v8-HT vs.  HVMx2-v8-noHT vs. HVMx2-v8-csc: now there are 2 HVM gu=
ests, both with 8 vCPUs. One runs synthetic workloads (CPU and memory) prod=
ucing ~600% CPU load. The other runs our benchmarks. So, the host is in ove=
rload by 2x factor, in terms of number of vCPUs vs. number of pCPUs (not co=
unting dom0!). In terms of CPU load, it's almost the same, but harder to te=
ll exactly, as the synthetic load is ~600% (and not 800%) and the various b=
enchmarks have variable CPU load.

STREAM
=3D=3D=3D=3D=3D=3D
1)                            BM-HT                BM-noHT
MB/sec copy     32623.20 (   0.00%)    33906.18 (   3.93%)
MB/sec scale    22056.18 (   0.00%)    23005.44 (   4.30%)
MB/sec add      25827.70 (   0.00%)    26707.06 (   3.40%)
MB/sec triad    25771.70 (   0.00%)    26705.98 (   3.63%)

I was expecting nearly identical performance between 'HT' and 'noHT'. For s=
ure, I wasn't expecting 'noHT' to regress. It's actually going a little fas=
ter, which does indeed makes sense (as we don't use any task pinning).

2)                         v-XEN-HT                 XEN-HT
MB/sec copy     33076.00 (   0.00%)    33112.76 (   0.11%)
MB/sec scale    24170.98 (   0.00%)    24225.04 (   0.22%)
MB/sec add      27060.58 (   0.00%)    27195.52 (   0.50%)
MB/sec triad    27172.34 (   0.00%)    27296.42 (   0.46%)

3)                       v-XEN-noHT               XEN-noHT
MB/sec copy     33054.78 (   0.00%)    33070.62 (   0.05%)
MB/sec scale    24198.12 (   0.00%)    24335.76 (   0.57%)
MB/sec add      27084.58 (   0.00%)    27360.86 (   1.02%)
MB/sec triad    27199.12 (   0.00%)    27468.54 (   0.99%)

4)                           XEN-HT               XEN-noHT                X=
EN-csc
MB/sec copy     33112.76 (   0.00%)    33070.62 (  -0.13%)    31811.06 (  -=
3.93%)
MB/sec scale    24225.04 (   0.00%)    24335.76 (   0.46%)    22745.18 (  -=
6.11%)
MB/sec add      27195.52 (   0.00%)    27360.86 (   0.61%)    25088.74 (  -=
7.75%)
MB/sec triad    27296.42 (   0.00%)    27468.54 (   0.63%)    25170.02 (  -=
7.79%)

I wasn't expecting a degradation for 'csc' (as, in fact, we don't see any i=
n 'noHT'). Perhaps, re-run the 'csc' case with 2 threads, and see if it mak=
es any difference.

5)                        HVM-v8-HT            HVM-v8-noHT             HVM-=
v8-csc
MB/sec copy     33338.56 (   0.00%)    34168.32 (   2.49%)    29568.34 ( -1=
1.31%)
MB/sec scale    22001.94 (   0.00%)    23023.06 (   4.64%)    18635.30 ( -1=
5.30%)
MB/sec add      25442.48 (   0.00%)    26676.96 (   4.85%)    21632.14 ( -1=
4.98%)
MB/sec triad    26376.48 (   0.00%)    26542.96 (   0.63%)    21751.54 ( -1=
7.53%)

(Unexpected) Impact is way more than just "noticeable". Furthermore, 'HT' a=
nd 'noHT' results are only a little worse than the PV (well, dom0) case, wh=
ile 'csc' is much worse. I suspect this may be caused by the benchmark's ta=
sks running on siblings, even if there are fully idle cores, but this needs=
 more investigation.

6)                        HVM-v4-HT            HVM-v4-noHT             HVM-=
v4-csc
MB/sec copy     31917.34 (   0.00%)    33820.44 (   5.96%)    31186.82 (  -=
2.29%)
MB/sec scale    20741.28 (   0.00%)    22320.82 (   7.62%)    19471.54 (  -=
6.12%)
MB/sec add      25120.08 (   0.00%)    26553.58 (   5.71%)    22348.62 ( -1=
1.03%)
MB/sec triad    24979.40 (   0.00%)    26075.40 (   4.39%)    21988.46 ( -1=
1.97%)

Not as bad as the 8 vCPU case, but still not great.

7)                      HVMx2-v8-HT          HVMx2-v8-noHT           HVMx2-=
v8-csc
MB/sec copy     28821.94 (   0.00%)    22508.84 ( -21.90%)    27223.16 (  -=
5.55%)
MB/sec scale    20544.64 (   0.00%)    15269.06 ( -25.68%)    17813.02 ( -1=
3.30%)
MB/sec add      22774.16 (   0.00%)    16733.48 ( -26.52%)    19659.98 ( -1=
3.67%)
MB/sec triad    22163.52 (   0.00%)    16508.20 ( -25.52%)    19722.54 ( -1=
1.01%)

Under load, core-scheduling does better than 'noHT'. Good! :-D


KERNBENCH
=3D=3D=3D=3D=3D=3D=3D=3D=3D
Done runs with 2, 4,8 or 16 threads. So, with HT on, we saturate at 8 threa=
ds, with HT off, at 4.
------------------------------------------------------------
1)                                 BM-HT                BM-noHT
Amean     elsp-2       199.46 (   0.00%)      196.25 *   1.61%*
Amean     elsp-4       114.96 (   0.00%)      108.73 *   5.42%*
Amean     elsp-8        83.65 (   0.00%)      109.77 * -31.22%*
Amean     elsp-16       84.46 (   0.00%)      112.61 * -33.33%*
Stddev    elsp-2         0.09 (   0.00%)        0.05 (  46.12%)
Stddev    elsp-4         0.08 (   0.00%)        0.19 (-126.04%)
Stddev    elsp-8         0.15 (   0.00%)        0.15 (  -2.80%)
Stddev    elsp-16        0.03 (   0.00%)        0.50 (-1328.97%)

Things are (slightly) better, on 'noHT', before saturation, but get substan=
tially worse after that point.

2)                              v-XEN-HT                 XEN-HT
Amean     elsp-2       234.13 (   0.00%)      233.63 (   0.21%)
Amean     elsp-4       139.89 (   0.00%)      140.21 *  -0.23%*
Amean     elsp-8        98.15 (   0.00%)       98.22 (  -0.08%)
Amean     elsp-16       99.05 (   0.00%)       99.65 *  -0.61%*
Stddev    elsp-2         0.40 (   0.00%)        0.14 (  64.63%)
Stddev    elsp-4         0.11 (   0.00%)        0.14 ( -33.77%)
Stddev    elsp-8         0.23 (   0.00%)        0.40 ( -68.71%)
Stddev    elsp-16        0.05 (   0.00%)        0.47 (-855.23%)

3)                            v-XEN-noHT               XEN-noHT
Amean     elsp-2       233.23 (   0.00%)      233.16 (   0.03%)
Amean     elsp-4       130.00 (   0.00%)      130.43 (  -0.33%)
Amean     elsp-8       132.86 (   0.00%)      132.34 *   0.39%*
Amean     elsp-16      135.61 (   0.00%)      135.51 (   0.07%)
Stddev    elsp-2         0.10 (   0.00%)        0.06 (  39.87%)
Stddev    elsp-4         0.04 (   0.00%)        0.67 (-1795.94%)
Stddev    elsp-8         0.37 (   0.00%)        0.04 (  89.24%)
Stddev    elsp-16        0.20 (   0.00%)        0.34 ( -69.82%)

4)                                XEN-HT               XEN-noHT            =
    XEN-csc
Amean     elsp-2       233.63 (   0.00%)      233.16 *   0.20%*      248.12=
 *  -6.20%*
Amean     elsp-4       140.21 (   0.00%)      130.43 *   6.98%*      145.65=
 *  -3.88%*
Amean     elsp-8        98.22 (   0.00%)      132.34 * -34.73%*       98.15=
 (   0.07%)
Amean     elsp-16       99.65 (   0.00%)      135.51 * -35.98%*       99.58=
 (   0.07%)
Stddev    elsp-2         0.14 (   0.00%)        0.06 (  56.88%)        0.19=
 ( -36.79%)
Stddev    elsp-4         0.14 (   0.00%)        0.67 (-369.64%)        0.57=
 (-305.25%)
Stddev    elsp-8         0.40 (   0.00%)        0.04 (  89.89%)        0.03=
 (  91.88%)
Stddev    elsp-16        0.47 (   0.00%)        0.34 (  27.80%)        0.47=
 (   0.53%)

'csc' proves to be quite effective for this workload. It does cause some sm=
all regressions at low job count, but it lets us get back all the perf we l=
ost when disabling Hyperthreading.

5)                             HVM-v8-HT            HVM-v8-noHT            =
 HVM-v8-csc
Amean     elsp-2       202.45 (   0.00%)      205.87 *  -1.69%*      218.87=
 *  -8.11%*
Amean     elsp-4       121.90 (   0.00%)      115.41 *   5.32%*      128.78=
 *  -5.64%*
Amean     elsp-8        85.94 (   0.00%)      125.71 * -46.28%*       87.26=
 *  -1.54%*
Amean     elsp-16       87.37 (   0.00%)      128.52 * -47.09%*       88.03=
 *  -0.76%*
Stddev    elsp-2         0.09 (   0.00%)        0.34 (-299.25%)        1.30=
 (-1433.24%)
Stddev    elsp-4         0.44 (   0.00%)        0.27 (  38.66%)        0.60=
 ( -36.58%)
Stddev    elsp-8         0.14 (   0.00%)        0.22 ( -63.81%)        0.35=
 (-153.50%)
Stddev    elsp-16        0.02 (   0.00%)        0.40 (-1627.17%)        0.3=
2 (-1300.67%)

Trend is pretty much the same than in the dom0 case.

6)                             HVM-v4-HT            HVM-v4-noHT            =
 HVM-v4-csc
Amean     elsp-2       206.05 (   0.00%)      208.49 *  -1.18%*      237.58=
 * -15.30%*
Amean     elsp-4       114.53 (   0.00%)      115.46 *  -0.82%*      162.61=
 * -41.98%*
Amean     elsp-8       127.22 (   0.00%)      117.63 *   7.54%*      166.22=
 * -30.66%*
Amean     elsp-16      133.70 (   0.00%)      120.53 *   9.85%*      170.05=
 * -27.19%*
Stddev    elsp-2         0.26 (   0.00%)        0.24 (   7.38%)        0.34=
 ( -30.97%)
Stddev    elsp-4         0.29 (   0.00%)        0.23 (  20.88%)        0.24=
 (  17.16%)
Stddev    elsp-8         2.21 (   0.00%)        0.12 (  94.48%)        0.24=
 (  89.01%)
Stddev    elsp-16        2.00 (   0.00%)        0.57 (  71.34%)        0.34=
 (  82.87%)

Quite bad, this time. Basically, with only 4 vCPUs in the VM, we never satu=
rate the machine, even in the 'noHT' case. In fact, 'noHT' goes similarly t=
han 'HT' (even a little better, actually), as it could have been expected. =
OTOH, 'csc' regresses badly.

I did some more investigation, and found out that, with core-scheduling, we=
 no longer spread the work among cores. E.g., with 4 cores and 4 busy vCPUs=
, in the 'HT' case, we run (most of the time) one vCPU on each core. In the=
 'csc' case, they often on 2 cores and leaves 2 cores idle. This means lowe=
r, but also more deterministic, performance. Whether or not is something we=
 like, needs to be discussed.

7)                           HVMx2-v8-HT          HVMx2-v8-noHT           H=
VMx2-v8-csc
Amean     elsp-2       288.82 (   0.00%)      437.79 * -51.58%*      339.86=
 * -17.67%*
Amean     elsp-4       196.18 (   0.00%)      294.95 * -50.35%*      242.91=
 * -23.82%*
Amean     elsp-8       153.27 (   0.00%)      229.25 * -49.57%*      182.50=
 * -19.07%*
Amean     elsp-16      156.59 (   0.00%)      235.63 * -50.48%*      185.82=
 * -18.67%*
Stddev    elsp-2         0.20 (   0.00%)        0.34 ( -67.23%)        2.56=
 (-1175.73%)
Stddev    elsp-4         0.48 (   0.00%)        0.07 (  86.25%)        0.41=
 (  15.93%)
Stddev    elsp-8         0.39 (   0.00%)        0.81 (-109.26%)        1.30=
 (-235.77%)
Stddev    elsp-16        0.88 (   0.00%)        0.87 (   1.97%)        1.75=
 ( -98.28%)

In overload, 'csc' regresses noticeably, as compared to 'HT'. But improves =
things a lot, as compared to 'noHT'.


HACKBENCH-PROCESS-PIPE
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
1)                            BM-HT                BM-noHT
Amean     1       0.3838 (   0.00%)      0.6752 * -75.92%*
Amean     3       1.1718 (   0.00%)      1.9740 * -68.46%*
Amean     5       1.9334 (   0.00%)      2.5968 * -34.31%*
Amean     7       2.6592 (   0.00%)      2.6656 (  -0.24%)
Amean     12      3.0228 (   0.00%)      3.2494 (  -7.50%)
Amean     18      3.4848 (   0.00%)      3.7932 *  -8.85%*
Amean     24      4.1308 (   0.00%)      5.2044 * -25.99%*
Amean     30      4.7290 (   0.00%)      5.8558 * -23.83%*
Amean     32      4.9450 (   0.00%)      6.2686 * -26.77%*
Stddev    1       0.0391 (   0.00%)      0.0308 (  21.27%)
Stddev    3       0.0349 (   0.00%)      0.1551 (-344.67%)
Stddev    5       0.1620 (   0.00%)      0.1590 (   1.90%)
Stddev    7       0.1166 (   0.00%)      0.3178 (-172.48%)
Stddev    12      0.3413 (   0.00%)      0.4880 ( -43.00%)
Stddev    18      0.2202 (   0.00%)      0.0784 (  64.40%)
Stddev    24      0.4053 (   0.00%)      0.3042 (  24.95%)
Stddev    30      0.1251 (   0.00%)      0.1655 ( -32.33%)
Stddev    32      0.0344 (   0.00%)      0.2019 (-486.80%)

'noHT' hurts (as could have been anticipated), even quite significantly in =
some cases (actually, I'm not sure why 7, 12 and 18 groups went so much bet=
ter than others...)

2)                         v-XEN-HT                 XEN-HT
Amean     1       0.7356 (   0.00%)      0.7470 (  -1.55%)
Amean     3       2.3506 (   0.00%)      2.4632 (  -4.79%)
Amean     5       4.1084 (   0.00%)      4.0418 (   1.62%)
Amean     7       5.8314 (   0.00%)      5.9784 (  -2.52%)
Amean     12      9.9694 (   0.00%)     10.4374 *  -4.69%*
Amean     18     14.2844 (   0.00%)     14.1366 (   1.03%)
Amean     24     19.0304 (   0.00%)     17.6314 (   7.35%)
Amean     30     21.8334 (   0.00%)     21.9030 (  -0.32%)
Amean     32     22.8946 (   0.00%)     22.0216 *   3.81%*
Stddev    1       0.0213 (   0.00%)      0.0327 ( -53.61%)
Stddev    3       0.1634 (   0.00%)      0.0952 (  41.73%)
Stddev    5       0.3934 (   0.00%)      0.1954 (  50.33%)
Stddev    7       0.1796 (   0.00%)      0.2809 ( -56.40%)
Stddev    12      0.1695 (   0.00%)      0.3725 (-119.74%)
Stddev    18      0.1392 (   0.00%)      0.4003 (-187.67%)
Stddev    24      1.5323 (   0.00%)      0.7330 (  52.16%)
Stddev    30      0.4214 (   0.00%)      1.0668 (-153.14%)
Stddev    32      0.8221 (   0.00%)      0.3849 (  53.18%)

With the core-scheduling patches applied, even if 'csc' is not used, there =
were runs where the overhead is noticeable (but also other runs where patch=
ed Xen was faster, so...)

3)                       v-XEN-noHT               XEN-noHT
Amean     1       1.2154 (   0.00%)      1.2200 (  -0.38%)
Amean     3       3.9274 (   0.00%)      3.9302 (  -0.07%)
Amean     5       6.6430 (   0.00%)      6.6584 (  -0.23%)
Amean     7       9.2772 (   0.00%)      9.8144 (  -5.79%)
Amean     12     14.8220 (   0.00%)     14.4464 (   2.53%)
Amean     18     21.6266 (   0.00%)     20.2166 *   6.52%*
Amean     24     27.2974 (   0.00%)     26.1082 *   4.36%*
Amean     30     32.2406 (   0.00%)     31.1702 *   3.32%*
Amean     32     34.8984 (   0.00%)     33.8204 *   3.09%*
Stddev    1       0.0727 (   0.00%)      0.0560 (  22.95%)
Stddev    3       0.2564 (   0.00%)      0.1332 (  48.04%)
Stddev    5       0.6043 (   0.00%)      0.5454 (   9.75%)
Stddev    7       0.6785 (   0.00%)      0.4508 (  33.56%)
Stddev    12      0.5074 (   0.00%)      0.8115 ( -59.92%)
Stddev    18      0.9622 (   0.00%)      0.8868 (   7.84%)
Stddev    24      0.4904 (   0.00%)      0.8453 ( -72.38%)
Stddev    30      0.5542 (   0.00%)      0.6499 ( -17.27%)
Stddev    32      0.4986 (   0.00%)      0.7965 ( -59.77%)

4)                           XEN-HT               XEN-noHT                X=
EN-csc
Amean     1       0.7470 (   0.00%)      1.2200 * -63.32%*      0.7160 *   =
4.15%*
Amean     3       2.4632 (   0.00%)      3.9302 * -59.56%*      2.2284 *   =
9.53%*
Amean     5       4.0418 (   0.00%)      6.6584 * -64.74%*      4.0492 (  -=
0.18%)
Amean     7       5.9784 (   0.00%)      9.8144 * -64.16%*      5.8718 (   =
1.78%)
Amean     12     10.4374 (   0.00%)     14.4464 * -38.41%*     10.1488 (   =
2.77%)
Amean     18     14.1366 (   0.00%)     20.2166 * -43.01%*     14.7450 *  -=
4.30%*
Amean     24     17.6314 (   0.00%)     26.1082 * -48.08%*     18.0072 (  -=
2.13%)
Amean     30     21.9030 (   0.00%)     31.1702 * -42.31%*     21.1058 (   =
3.64%)
Amean     32     22.0216 (   0.00%)     33.8204 * -53.58%*     22.7300 (  -=
3.22%)
Stddev    1       0.0327 (   0.00%)      0.0560 ( -71.05%)      0.0168 (  4=
8.71%)
Stddev    3       0.0952 (   0.00%)      0.1332 ( -39.92%)      0.0944 (   =
0.88%)
Stddev    5       0.1954 (   0.00%)      0.5454 (-179.08%)      0.3064 ( -5=
6.79%)
Stddev    7       0.2809 (   0.00%)      0.4508 ( -60.47%)      0.5762 (-10=
5.11%)
Stddev    12      0.3725 (   0.00%)      0.8115 (-117.83%)      0.3594 (   =
3.53%)
Stddev    18      0.4003 (   0.00%)      0.8868 (-121.54%)      0.2580 (  3=
5.56%)
Stddev    24      0.7330 (   0.00%)      0.8453 ( -15.32%)      0.8976 ( -2=
2.45%)
Stddev    30      1.0668 (   0.00%)      0.6499 (  39.08%)      0.8666 (  1=
8.76%)
Stddev    32      0.3849 (   0.00%)      0.7965 (-106.96%)      1.4428 (-27=
4.86%)

This looks similar to 'kernbench'. 'noHT' hurts the workload badly, but 'cs=
c' seems to come quite a bit to the rescue!

5)                        HVM-v8-HT            HVM-v8-noHT             HVM-=
v8-csc
Amean     1       0.8992 (   0.00%)      1.1826 * -31.52%*      0.9462 *  -=
5.23%*
Amean     3       2.4524 (   0.00%)      2.4990 (  -1.90%)      2.5514 *  -=
4.04%*
Amean     5       3.6710 (   0.00%)      3.5258 (   3.96%)      3.9270 *  -=
6.97%*
Amean     7       4.6588 (   0.00%)      4.6430 (   0.34%)      5.0420 (  -=
8.23%)
Amean     12      7.7872 (   0.00%)      7.6310 (   2.01%)      7.6498 (   =
1.76%)
Amean     18     10.9800 (   0.00%)     12.2772 ( -11.81%)     11.1940 (  -=
1.95%)
Amean     24     16.5552 (   0.00%)     18.1368 (  -9.55%)     15.1922 (   =
8.23%)
Amean     30     17.1778 (   0.00%)     24.0352 * -39.92%*     17.7776 (  -=
3.49%)
Amean     32     19.1966 (   0.00%)     25.3104 * -31.85%*     19.8716 (  -=
3.52%)
Stddev    1       0.0306 (   0.00%)      0.0440 ( -44.08%)      0.0419 ( -3=
6.94%)
Stddev    3       0.0681 (   0.00%)      0.1289 ( -89.35%)      0.0975 ( -4=
3.30%)
Stddev    5       0.1214 (   0.00%)      0.2722 (-124.14%)      0.2080 ( -7=
1.33%)
Stddev    7       0.5810 (   0.00%)      0.2687 (  53.75%)      0.3038 (  4=
7.71%)
Stddev    12      1.4867 (   0.00%)      1.3196 (  11.24%)      1.5775 (  -=
6.11%)
Stddev    18      1.9110 (   0.00%)      1.8377 (   3.83%)      1.3230 (  3=
0.77%)
Stddev    24      1.4038 (   0.00%)      1.2938 (   7.84%)      1.2301 (  1=
2.37%)
Stddev    30      2.0035 (   0.00%)      1.3529 (  32.47%)      2.4480 ( -2=
2.19%)
Stddev    32      1.8277 (   0.00%)      1.1786 (  35.52%)      2.4069 ( -3=
1.69%)

Similar to the dom0 case, but it's rather weird how the 'noHT' case is, in =
some cases, quite good. Even better than 'HT'. :-O

6)                        HVM-v4-HT            HVM-v4-noHT             HVM-=
v4-csc
Amean     1       1.4962 (   0.00%)      1.4424 (   3.60%)      1.6824 * -1=
2.44%*
Amean     3       2.5826 (   0.00%)      2.9692 ( -14.97%)      2.9984 ( -1=
6.10%)
Amean     5       3.4330 (   0.00%)      3.5064 (  -2.14%)      4.7144 * -3=
7.33%*
Amean     7       5.3896 (   0.00%)      4.5122 (  16.28%)      5.7828 (  -=
7.30%)
Amean     12      7.6862 (   0.00%)      8.1164 (  -5.60%)     10.3868 * -3=
5.14%*
Amean     18     10.8628 (   0.00%)     10.8600 (   0.03%)     14.5226 * -3=
3.69%*
Amean     24     16.1058 (   0.00%)     13.9238 (  13.55%)     17.3746 (  -=
7.88%)
Amean     30     17.9462 (   0.00%)     20.1588 ( -12.33%)     22.2760 * -2=
4.13%*
Amean     32     20.8922 (   0.00%)     15.2004 *  27.24%*     22.5168 (  -=
7.78%)
Stddev    1       0.0353 (   0.00%)      0.0996 (-181.94%)      0.0573 ( -6=
2.13%)
Stddev    3       0.4556 (   0.00%)      0.6097 ( -33.81%)      0.4727 (  -=
3.73%)
Stddev    5       0.7936 (   0.00%)      0.6409 (  19.25%)      1.0294 ( -2=
9.71%)
Stddev    7       1.3387 (   0.00%)      0.9335 (  30.27%)      1.5652 ( -1=
6.92%)
Stddev    12      1.1304 (   0.00%)      1.8932 ( -67.48%)      1.6302 ( -4=
4.21%)
Stddev    18      2.6187 (   0.00%)      2.2309 (  14.81%)      0.9304 (  6=
4.47%)
Stddev    24      2.2138 (   0.00%)      1.6892 (  23.70%)      1.4706 (  3=
3.57%)
Stddev    30      1.6264 (   0.00%)      2.1632 ( -33.01%)      1.6574 (  -=
1.91%)
Stddev    32      3.5272 (   0.00%)      2.5166 (  28.65%)      2.0956 (  4=
0.59%)

7)                      HVMx2-v8-HT          HVMx2-v8-noHT           HVMx2-=
v8-csc
Amean     1       1.4736 (   0.00%)      1.2224 *  17.05%*      1.6544 * -1=
2.27%*
Amean     3       3.1764 (   0.00%)      2.4984 *  21.34%*      2.9720 *   =
6.43%*
Amean     5       4.7694 (   0.00%)      3.4870 *  26.89%*      4.4406 *   =
6.89%*
Amean     7       6.3958 (   0.00%)      4.6320 *  27.58%*      5.9150 *   =
7.52%*
Amean     12     11.0484 (   0.00%)      7.6534 *  30.73%*      9.7064 (  1=
2.15%)
Amean     18     16.8658 (   0.00%)     12.8028 *  24.09%*     17.0654 (  -=
1.18%)
Amean     24     23.6798 (   0.00%)     18.8692 *  20.32%*     24.1742 (  -=
2.09%)
Amean     30     29.6202 (   0.00%)     25.4126 *  14.21%*     30.5034 (  -=
2.98%)
Amean     32     31.7582 (   0.00%)     28.5946 *   9.96%*     33.0222 *  -=
3.98%*
Stddev    1       0.0309 (   0.00%)      0.0294 (   5.09%)      0.0526 ( -6=
9.92%)
Stddev    3       0.1102 (   0.00%)      0.0670 (  39.25%)      0.0956 (  1=
3.30%)
Stddev    5       0.2023 (   0.00%)      0.1089 (  46.16%)      0.0694 (  6=
5.68%)
Stddev    7       0.3783 (   0.00%)      0.1408 (  62.79%)      0.2421 (  3=
6.01%)
Stddev    12      1.5160 (   0.00%)      0.3483 (  77.02%)      1.3210 (  1=
2.87%)
Stddev    18      1.3000 (   0.00%)      1.2858 (   1.09%)      0.8736 (  3=
2.80%)
Stddev    24      0.8749 (   0.00%)      0.8663 (   0.98%)      0.8197 (   =
6.31%)
Stddev    30      1.3074 (   0.00%)      1.4297 (  -9.36%)      1.2882 (   =
1.46%)
Stddev    32      1.2521 (   0.00%)      1.0791 (  13.81%)      0.7319 (  4=
1.54%)

'noHT' becomes _super_fast_ (as compared to 'HT') when the system is overlo=
aded. And that is (continues to be) quite weird. About 'csc', it's not too =
bad, as it performs in line with 'HT'.


MUTILATE
=3D=3D=3D=3D=3D=3D=3D=3D
1)                           BM-HT                BM-noHT
Hmean     1    60932.67 (   0.00%)    60817.19 (  -0.19%)
Hmean     3   150762.70 (   0.00%)   123570.43 * -18.04%*
Hmean     5   197564.84 (   0.00%)   176716.37 * -10.55%*
Hmean     7   178089.27 (   0.00%)   170859.21 *  -4.06%*
Hmean     8   151372.16 (   0.00%)   160742.09 *   6.19%*
Stddev    1      591.29 (   0.00%)      513.06 (  13.23%)
Stddev    3     1358.38 (   0.00%)     1783.77 ( -31.32%)
Stddev    5     3477.60 (   0.00%)     5380.83 ( -54.73%)
Stddev    7     2676.96 (   0.00%)     5119.18 ( -91.23%)
Stddev    8      696.32 (   0.00%)     2888.47 (-314.82%)

It's less of a clear cut whether or not HT helps or not...

2)                        v-XEN-HT                 XEN-HT
Hmean     1    31121.40 (   0.00%)    31063.01 (  -0.19%)
Hmean     3    75847.21 (   0.00%)    75373.02 (  -0.63%)
Hmean     5   113823.13 (   0.00%)   113127.84 (  -0.61%)
Hmean     7   112553.93 (   0.00%)   112467.16 (  -0.08%)
Hmean     8   103472.02 (   0.00%)   103246.75 (  -0.22%)
Stddev    1      147.14 (   0.00%)      175.64 ( -19.37%)
Stddev    3      920.80 (   0.00%)     1017.40 ( -10.49%)
Stddev    5      339.23 (   0.00%)      781.99 (-130.52%)
Stddev    7      248.83 (   0.00%)      404.74 ( -62.66%)
Stddev    8      132.22 (   0.00%)      274.16 (-107.35%)

3)                      v-XEN-noHT               XEN-noHT
Hmean     1    31182.90 (   0.00%)    31107.06 (  -0.24%)
Hmean     3    83473.18 (   0.00%)    84387.92 *   1.10%*
Hmean     5    90322.68 (   0.00%)    91396.40 (   1.19%)
Hmean     7    91082.97 (   0.00%)    91296.28 (   0.23%)
Hmean     8    89529.42 (   0.00%)    89442.61 (  -0.10%)
Stddev    1      369.37 (   0.00%)      336.37 (   8.93%)
Stddev    3      300.44 (   0.00%)      333.46 ( -10.99%)
Stddev    5      842.22 (   0.00%)      816.23 (   3.08%)
Stddev    7      907.80 (   0.00%)     1084.18 ( -19.43%)
Stddev    8      362.90 (   0.00%)      890.80 (-145.47%)

4)                          XEN-HT               XEN-noHT                XE=
N-csc
Hmean     1    31063.01 (   0.00%)    31107.06 (   0.14%)    29609.98 *  -4=
.68%*
Hmean     3    75373.02 (   0.00%)    84387.92 *  11.96%*    73419.60 *  -2=
.59%*
Hmean     5   113127.84 (   0.00%)    91396.40 * -19.21%*   100843.37 * -10=
.86%*
Hmean     7   112467.16 (   0.00%)    91296.28 * -18.82%*   108439.16 *  -3=
.58%*
Hmean     8   103246.75 (   0.00%)    89442.61 * -13.37%*   101164.18 *  -2=
.02%*
Stddev    1      175.64 (   0.00%)      336.37 ( -91.51%)      271.28 ( -54=
.46%)
Stddev    3     1017.40 (   0.00%)      333.46 (  67.22%)      367.95 (  63=
.83%)
Stddev    5      781.99 (   0.00%)      816.23 (  -4.38%)      549.77 (  29=
.70%)
Stddev    7      404.74 (   0.00%)     1084.18 (-167.87%)      376.92 (   6=
.87%)
Stddev    8      274.16 (   0.00%)      890.80 (-224.93%)      987.59 (-260=
.23%)

And it's a mixed bag even here, but it clearly looks like 'csc' helps (i.e.=
, let us achieve better perf than 'noHT' when in and above saturation).

5)                       HVM-v8-HT            HVM-v8-noHT             HVM-v=
8-csc
Hmean     1    39583.53 (   0.00%)    38828.65 *  -1.91%*    35103.76 * -11=
.32%*
Hmean     3    87210.00 (   0.00%)    57874.31 * -33.64%*    47160.22 * -45=
.92%*
Hmean     5   130676.61 (   0.00%)    42883.21 * -67.18%*    85504.60 * -34=
.57%*
Hmean     7   157586.93 (   0.00%)    59146.02 * -62.47%*   136717.21 * -13=
.24%*
Hmean     8   174113.49 (   0.00%)    75503.09 * -56.64%*   159666.07 *  -8=
.30%*
Stddev    1      160.68 (   0.00%)      232.01 ( -44.39%)      547.91 (-240=
.99%)
Stddev    3     1158.62 (   0.00%)      654.05 (  43.55%)    18841.25 (-152=
6.19%)
Stddev    5      298.35 (   0.00%)      542.51 ( -81.84%)     1274.93 (-327=
.32%)
Stddev    7     2569.12 (   0.00%)     1034.22 (  59.74%)     4163.80 ( -62=
.07%)
Stddev    8      982.48 (   0.00%)      692.10 (  29.56%)     1324.30 ( -34=
.79%)

'csc' helps, and it let us achieve better performance than 'noHT', overall.=
 Absolute performance looks worse than in dom0, but the 'noHT' case seems t=
o be affected even more.

6)                       HVM-v4-HT            HVM-v4-noHT             HVM-v=
4-csc
Hmean     1    37156.88 (   0.00%)    36938.92 (  -0.59%)    34869.19 *  -6=
.16%*
Hmean     3    91170.71 (   0.00%)    91469.09 (   0.33%)    76214.51 * -16=
.40%*
Hmean     5   119020.55 (   0.00%)   126949.11 *   6.66%*   109062.82 *  -8=
.37%*
Hmean     7   119924.66 (   0.00%)   133372.57 *  11.21%*   110466.18 *  -7=
.89%*
Hmean     8   121329.34 (   0.00%)   136100.78 (  12.17%)   114071.36 *  -5=
.98%*
Stddev    1      214.02 (   0.00%)      362.58 ( -69.42%)      516.53 (-141=
.35%)
Stddev    3     2554.47 (   0.00%)     1549.81 (  39.33%)      748.72 (  70=
.69%)
Stddev    5     1061.32 (   0.00%)     2250.11 (-112.01%)     2377.12 (-123=
.98%)
Stddev    7     5486.68 (   0.00%)     3214.60 (  41.41%)     4147.45 (  24=
.41%)
Stddev    8     1857.60 (   0.00%)    12837.92 (-591.10%)     3400.78 ( -83=
.07%)

7)                     HVMx2-v8-HT          HVMx2-v8-noHT           HVMx2-v=
8-csc
Hmean     1    30194.08 (   0.00%)     2457.66 * -91.86%*     4940.93 * -83=
.64%*
Hmean     3    33860.02 (   0.00%)    11209.64 * -66.89%*    23274.26 * -31=
.26%*
Hmean     5    45606.53 (   0.00%)    15984.89 * -64.95%*    38599.75 ( -15=
.36%)
Hmean     7    70754.93 (   0.00%)    23045.58 * -67.43%*    55799.74 * -21=
.14%*
Hmean     8    88529.15 (   0.00%)    36532.64 * -58.73%*    70367.33 * -20=
.52%*
Stddev    1      214.55 (   0.00%)        2.87 (  98.66%)    13159.62 (-603=
3.62%)
Stddev    3      440.61 (   0.00%)      179.15 (  59.34%)     4463.14 (-912=
.95%)
Stddev    5      900.27 (   0.00%)      161.20 (  82.09%)     6286.95 (-598=
.34%)
Stddev    7      706.22 (   0.00%)      708.81 (  -0.37%)     3845.49 (-444=
.52%)
Stddev    8     3197.46 (   0.00%)      818.97 (  74.39%)     4477.51 ( -40=
.03%)

Similar to kernbench: 'csc' a lot better than 'noHT' in overload.


PGIOPERFBENCH
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
1)                                BM-HT                BM-noHT
Amean     commit        7.72 (   0.00%)        9.73 * -26.14%*
Amean     read          6.99 (   0.00%)        8.15 * -16.66%*
Amean     wal           0.02 (   0.00%)        0.02 (   3.63%)
Stddev    commit        1.35 (   0.00%)        5.48 (-304.84%)
Stddev    read          0.61 (   0.00%)        3.82 (-521.73%)
Stddev    wal           0.04 (   0.00%)        0.04 (   1.36%)

Commit and read runs are suffering withough HT.

2)                             v-XEN-HT                 XEN-HT
Amean     commit        7.88 (   0.00%)        8.78 * -11.43%*
Amean     read          6.85 (   0.00%)        7.71 * -12.54%*
Amean     wal           0.07 (   0.00%)        0.07 (   1.15%)
Stddev    commit        1.86 (   0.00%)        3.59 ( -92.56%)
Stddev    read          0.53 (   0.00%)        2.89 (-450.88%)
Stddev    wal           0.05 (   0.00%)        0.05 (  -0.86%)

Significant overhead introduced by core scheduler patches, with sched-gran=
=3Dcpu and HT enabled.

3)                           v-XEN-noHT               XEN-noHT
Amean     commit        8.53 (   0.00%)        7.64 *  10.47%*
Amean     read          7.30 (   0.00%)        6.86 *   6.02%*
Amean     wal           0.08 (   0.00%)        0.08 (   2.61%)
Stddev    commit        4.27 (   0.00%)        1.35 (  68.46%)
Stddev    read          3.12 (   0.00%)        0.39 (  87.45%)
Stddev    wal           0.04 (   0.00%)        0.04 (   6.28%)

While not so much (actually, things are faster) with sched-gran=3Dcpu and H=
T disabled.

4)                               XEN-HT               XEN-noHT             =
   XEN-csc
Amean     commit        8.78 (   0.00%)        7.64 *  13.03%*        8.20 =
(   6.63%)
Amean     read          7.71 (   0.00%)        6.86 *  10.95%*        7.21 =
*   6.43%*
Amean     wal           0.07 (   0.00%)        0.08 * -12.33%*        0.08 =
(  -7.96%)
Stddev    commit        3.59 (   0.00%)        1.35 (  62.41%)        3.50 =
(   2.37%)
Stddev    read          2.89 (   0.00%)        0.39 (  86.46%)        2.50 =
(  13.52%)
Stddev    wal           0.05 (   0.00%)        0.04 (  11.34%)        0.04 =
(   6.71%)

Interestingly, when running under Xen and without HT, 'commit' and 'read' r=
uns are not suffering any longer (they're actually faster!). 'wal' is. With=
 core scheduling, WAL still slows down, but a little bit less, and commit a=
nd read are still fine (although they speed-up less).

5)                            HVM-v8-HT            HVM-v8-noHT             =
HVM-v8-csc
Amean     commit        7.83 (   0.00%)        7.74 (   1.16%)        7.68 =
(   1.87%)
Amean     read          6.97 (   0.00%)        6.97 (  -0.03%)        6.92 =
*   0.62%*
Amean     wal           0.04 (   0.00%)        0.01 *  79.85%*        0.07 =
* -84.69%*
Stddev    commit        1.60 (   0.00%)        1.54 (   3.79%)        1.59 =
(   0.35%)
Stddev    read          0.53 (   0.00%)        0.55 (  -3.61%)        0.68 =
( -27.35%)
Stddev    wal           0.05 (   0.00%)        0.03 (  45.88%)        0.05 =
(   2.11%)

'commit' and 'read' looks similar to the dom0 case. 'wal' is weird, as it w=
ent very very good in the 'noHT' case... I'm not sure how significant this =
benchmark is, to be honest.

6)                            HVM-v4-HT            HVM-v4-noHT             =
HVM-v4-csc
Stddev    commit        1.62 (   0.00%)        1.51 (   7.24%)        1.65 =
(  -1.80%)
Stddev    read          0.55 (   0.00%)        0.66 ( -19.98%)        0.57 =
(  -2.02%)
Stddev    wal           0.05 (   0.00%)        0.05 (  -6.25%)        0.05 =
(  -5.64%)

7)                          HVMx2-v8-HT          HVMx2-v8-noHT           HV=
Mx2-v8-csc
Amean     commit        7.94 (   0.00%)        8.31 *  -4.57%*       10.28 =
* -29.45%*
Amean     read          6.98 (   0.00%)        7.91 * -13.20%*        9.47 =
* -35.58%*
Amean     wal           0.01 (   0.00%)        0.07 *-415.01%*        0.24 =
*-1752.46%*
Stddev    commit        1.75 (   0.00%)        1.30 (  26.10%)        2.17 =
( -23.63%)
Stddev    read          0.67 (   0.00%)        0.79 ( -17.48%)        2.21 =
(-228.37%)
Stddev    wal           0.03 (   0.00%)        0.09 (-157.29%)        0.39 =
(-1057.77%)

Here, on the other hand, 'csc' regresses against 'noHT'. We've seen 'wal' f=
luctuating a bit. But in this case, even if we'd ignore it, we see that als=
o 'commit' and 'read' slow down significantly.


NETPERF-UDP
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
1)                                   BM-HT                BM-noHT
Hmean     send-64        395.57 (   0.00%)      402.32 *   1.70%*
Hmean     send-256      1474.96 (   0.00%)     1515.87 *   2.77%*
Hmean     send-2048    10592.86 (   0.00%)    11137.39 *   5.14%*
Hmean     send-8192    27861.86 (   0.00%)    29965.72 *   7.55%*
Hmean     recv-64        395.51 (   0.00%)      402.30 *   1.72%*
Hmean     recv-256      1474.96 (   0.00%)     1515.61 *   2.76%*
Hmean     recv-2048    10591.01 (   0.00%)    11135.47 *   5.14%*
Hmean     recv-8192    27858.04 (   0.00%)    29956.95 *   7.53%*
Stddev    send-64          4.61 (   0.00%)        3.01 (  34.70%)
Stddev    send-256        28.10 (   0.00%)       11.44 (  59.29%)
Stddev    send-2048      164.91 (   0.00%)      112.24 (  31.94%)
Stddev    send-8192      930.19 (   0.00%)      416.78 (  55.19%)
Stddev    recv-64          4.73 (   0.00%)        3.00 (  36.49%)
Stddev    recv-256        28.10 (   0.00%)       11.86 (  57.79%)
Stddev    recv-2048      163.52 (   0.00%)      111.83 (  31.61%)
Stddev    recv-8192      930.48 (   0.00%)      415.22 (  55.38%)

'noHT' being consistently --although marginally, in most cases-- better see=
ms to reveal non-ideality in how SMT is handled in the Linux scheduler.

2)                                v-XEN-HT                 XEN-HT
Hmean     send-64        223.35 (   0.00%)      220.23 *  -1.39%*
Hmean     send-256       876.26 (   0.00%)      863.81 *  -1.42%*
Hmean     send-2048     6575.95 (   0.00%)     6542.13 (  -0.51%)
Hmean     send-8192    20882.75 (   0.00%)    20999.88 (   0.56%)
Hmean     recv-64        223.35 (   0.00%)      220.23 *  -1.39%*
Hmean     recv-256       876.22 (   0.00%)      863.81 *  -1.42%*
Hmean     recv-2048     6575.00 (   0.00%)     6541.22 (  -0.51%)
Hmean     recv-8192    20881.63 (   0.00%)    20996.13 (   0.55%)
Stddev    send-64          1.16 (   0.00%)        0.94 (  19.15%)
Stddev    send-256         7.50 (   0.00%)        7.71 (  -2.79%)
Stddev    send-2048       29.58 (   0.00%)       57.84 ( -95.56%)
Stddev    send-8192      106.01 (   0.00%)      172.69 ( -62.90%)
Stddev    recv-64          1.16 (   0.00%)        0.94 (  19.15%)
Stddev    recv-256         7.50 (   0.00%)        7.70 (  -2.70%)
Stddev    recv-2048       28.84 (   0.00%)       56.58 ( -96.20%)
Stddev    recv-8192      105.96 (   0.00%)      167.07 ( -57.68%)

3)                              v-XEN-noHT               XEN-noHT
Hmean     send-64        222.53 (   0.00%)      220.12 *  -1.08%*
Hmean     send-256       874.65 (   0.00%)      866.59 (  -0.92%)
Hmean     send-2048     6595.97 (   0.00%)     6568.38 (  -0.42%)
Hmean     send-8192    21537.45 (   0.00%)    21163.69 *  -1.74%*
Hmean     recv-64        222.52 (   0.00%)      220.08 *  -1.10%*
Hmean     recv-256       874.55 (   0.00%)      866.47 (  -0.92%)
Hmean     recv-2048     6595.64 (   0.00%)     6566.75 (  -0.44%)
Hmean     recv-8192    21534.73 (   0.00%)    21157.86 *  -1.75%*
Stddev    send-64          1.45 (   0.00%)        1.64 ( -13.12%)
Stddev    send-256         4.96 (   0.00%)        8.92 ( -79.63%)
Stddev    send-2048       35.06 (   0.00%)       64.88 ( -85.05%)
Stddev    send-8192      199.63 (   0.00%)      161.66 (  19.02%)
Stddev    recv-64          1.44 (   0.00%)        1.62 ( -12.50%)
Stddev    recv-256         4.94 (   0.00%)        9.03 ( -82.65%)
Stddev    recv-2048       34.99 (   0.00%)       65.80 ( -88.02%)
Stddev    recv-8192      201.10 (   0.00%)      162.03 (  19.43%)

4)                                  XEN-HT               XEN-noHT          =
      XEN-csc
Hmean     send-64        220.23 (   0.00%)      220.12 (  -0.05%)      199.=
70 *  -9.32%*
Hmean     send-256       863.81 (   0.00%)      866.59 (   0.32%)      791.=
34 *  -8.39%*
Hmean     send-2048     6542.13 (   0.00%)     6568.38 (   0.40%)     5758.=
09 * -11.98%*
Hmean     send-8192    20999.88 (   0.00%)    21163.69 (   0.78%)    19706.=
48 *  -6.16%*
Hmean     recv-64        220.23 (   0.00%)      220.08 (  -0.07%)      199.=
70 *  -9.32%*
Hmean     recv-256       863.81 (   0.00%)      866.47 (   0.31%)      791.=
09 *  -8.42%*
Hmean     recv-2048     6541.22 (   0.00%)     6566.75 (   0.39%)     5757.=
50 * -11.98%*
Hmean     recv-8192    20996.13 (   0.00%)    21157.86 (   0.77%)    19703.=
65 *  -6.16%*
Stddev    send-64          0.94 (   0.00%)        1.64 ( -74.89%)       21.=
30 (-2173.95%)
Stddev    send-256         7.71 (   0.00%)        8.92 ( -15.74%)       63.=
89 (-729.17%)
Stddev    send-2048       57.84 (   0.00%)       64.88 ( -12.18%)      112.=
05 ( -93.72%)
Stddev    send-8192      172.69 (   0.00%)      161.66 (   6.39%)      276.=
33 ( -60.02%)
Stddev    recv-64          0.94 (   0.00%)        1.62 ( -72.94%)       21.=
30 (-2173.74%)
Stddev    recv-256         7.70 (   0.00%)        9.03 ( -17.23%)       64.=
08 (-732.24%)
Stddev    recv-2048       56.58 (   0.00%)       65.80 ( -16.28%)      112.=
00 ( -97.94%)
Stddev    recv-8192      167.07 (   0.00%)      162.03 (   3.01%)      276.=
84 ( -65.70%)

In this case, 'csc' is performing worse than 'noHT', pretty consistently. T=
his again may be due to sub-optimal placement of the vCPUs, with core-sched=
uling enabled.

5)                               HVM-v8-HT            HVM-v8-noHT          =
   HVM-v8-csc
Hmean     send-64        518.85 (   0.00%)      487.85 *  -5.97%*      505.=
10 (  -2.65%)
Hmean     send-256      1955.77 (   0.00%)     1784.00 *  -8.78%*     1931.=
18 (  -1.26%)
Hmean     send-2048    12849.78 (   0.00%)    13027.81 (   1.39%)    13485.=
59 (   4.95%)
Hmean     send-8192    37659.20 (   0.00%)    35773.79 *  -5.01%*    35040.=
88 *  -6.95%*
Hmean     recv-64        518.32 (   0.00%)      487.76 *  -5.89%*      504.=
86 (  -2.60%)
Hmean     recv-256      1954.42 (   0.00%)     1782.90 *  -8.78%*     1930.=
33 (  -1.23%)
Hmean     recv-2048    12830.91 (   0.00%)    13018.47 (   1.46%)    13475.=
39 (   5.02%)
Hmean     recv-8192    37619.84 (   0.00%)    35768.42 *  -4.92%*    35035.=
40 *  -6.87%*
Stddev    send-64         29.69 (   0.00%)        6.43 (  78.34%)       17.=
36 (  41.53%)
Stddev    send-256        64.17 (   0.00%)       26.82 (  58.21%)       33.=
37 (  47.99%)
Stddev    send-2048     1342.98 (   0.00%)      246.21 (  81.67%)      353.=
97 (  73.64%)
Stddev    send-8192      224.20 (   0.00%)      467.40 (-108.48%)      928.=
70 (-314.24%)
Stddev    recv-64         29.96 (   0.00%)        6.54 (  78.16%)       17.=
64 (  41.11%)
Stddev    recv-256        64.29 (   0.00%)       27.28 (  57.56%)       34.=
17 (  46.85%)
Stddev    recv-2048     1353.73 (   0.00%)      251.38 (  81.43%)      368.=
14 (  72.81%)
Stddev    recv-8192      206.98 (   0.00%)      467.59 (-125.91%)      928.=
73 (-348.71%)

This looks different than the dom0 case. Basically, here, 'noHT' and 'csc' =
look on par (maybe 'csc' is even a little bit better). Another difference i=
s that 'noHT' slows down more, as compared to 'HT'.

6)                               HVM-v4-HT            HVM-v4-noHT          =
   HVM-v4-csc
Hmean     send-64        513.95 (   0.00%)      511.96 (  -0.39%)      458.=
46 * -10.80%*
Hmean     send-256      1928.30 (   0.00%)     1930.57 (   0.12%)     1831.=
70 *  -5.01%*
Hmean     send-2048    13509.70 (   0.00%)    13802.90 *   2.17%*    12739.=
81 *  -5.70%*
Hmean     send-8192    35966.73 (   0.00%)    36086.45 (   0.33%)    35293.=
89 (  -1.87%)
Hmean     recv-64        513.90 (   0.00%)      511.91 (  -0.39%)      458.=
34 * -10.81%*
Hmean     recv-256      1927.94 (   0.00%)     1930.48 (   0.13%)     1831.=
50 *  -5.00%*
Hmean     recv-2048    13506.19 (   0.00%)    13799.61 *   2.17%*    12734.=
53 *  -5.71%*
Hmean     recv-8192    35936.42 (   0.00%)    36069.50 (   0.37%)    35266.=
17 (  -1.87%)
Stddev    send-64         12.88 (   0.00%)        3.89 (  69.78%)       16.=
11 ( -25.10%)
Stddev    send-256        37.13 (   0.00%)       19.62 (  47.16%)       30.=
54 (  17.75%)
Stddev    send-2048       86.00 (   0.00%)      100.64 ( -17.03%)      311.=
99 (-262.80%)
Stddev    send-8192      926.89 (   0.00%)     1088.50 ( -17.44%)     2801.=
65 (-202.26%)
Stddev    recv-64         12.93 (   0.00%)        3.96 (  69.36%)       16.=
15 ( -24.90%)
Stddev    recv-256        37.76 (   0.00%)       19.75 (  47.68%)       30.=
68 (  18.73%)
Stddev    recv-2048       88.84 (   0.00%)      100.51 ( -13.13%)      313.=
79 (-253.20%)

7)                             HVMx2-v8-HT          HVMx2-v8-noHT          =
 HVMx2-v8-csc
Hmean     send-64        359.65 (   0.00%)      251.84 * -29.98%*      348.=
95 (  -2.97%)
Hmean     send-256      1376.16 (   0.00%)      969.58 * -29.54%*     1293.=
19 *  -6.03%*
Hmean     send-2048    10212.34 (   0.00%)     6893.41 * -32.50%*     8933.=
39 * -12.52%*
Hmean     send-8192    30442.79 (   0.00%)    18372.42 * -39.65%*    25486.=
82 * -16.28%*
Hmean     recv-64        359.01 (   0.00%)      240.67 * -32.96%*      319.=
95 * -10.88%*
Hmean     recv-256      1372.71 (   0.00%)      923.23 * -32.74%*     1206.=
20 * -12.13%*
Hmean     recv-2048    10185.94 (   0.00%)     6258.59 * -38.56%*     8371.=
03 * -17.82%*
Hmean     recv-8192    30272.47 (   0.00%)    16888.08 * -44.21%*    22719.=
70 * -24.95%*
Stddev    send-64          6.49 (   0.00%)        7.35 ( -13.35%)       18.=
06 (-178.42%)
Stddev    send-256        29.41 (   0.00%)       15.84 (  46.15%)       25.=
77 (  12.38%)
Stddev    send-2048       97.12 (   0.00%)      238.24 (-145.32%)      276.=
14 (-184.34%)
Stddev    send-8192      680.48 (   0.00%)      336.65 (  50.53%)      482.=
57 (  29.08%)
Stddev    recv-64          6.80 (   0.00%)        3.56 (  47.64%)        6.=
62 (   2.60%)
Stddev    recv-256        31.00 (   0.00%)       10.11 (  67.39%)       14.=
94 (  51.80%)
Stddev    recv-2048       99.42 (   0.00%)       96.49 (   2.94%)       42.=
24 (  57.51%)
Stddev    recv-8192      759.75 (   0.00%)      108.46 (  85.72%)      745.=
22 (   1.91%)

And even for this benchmark, for which 'csc' does not perform very well in =
general, under load, it does good vs. 'noHT'.


NETPERF-TCP
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
1)                              BM-HT                BM-noHT
Hmean     64       2495.25 (   0.00%)     2509.94 *   0.59%*
Hmean     256      7331.05 (   0.00%)     7350.96 (   0.27%)
Hmean     2048    32003.90 (   0.00%)    31975.79 (  -0.09%)
Hmean     8192    50482.11 (   0.00%)    51254.29 (   1.53%)
Stddev    64         12.54 (   0.00%)        9.28 (  26.01%)
Stddev    256        20.90 (   0.00%)       35.47 ( -69.76%)
Stddev    2048      160.50 (   0.00%)      186.36 ( -16.12%)
Stddev    8192      944.33 (   0.00%)      365.62 (  61.28%)

Basically on par.

2)                           v-XEN-HT                 XEN-HT
Hmean     64        674.18 (   0.00%)      677.61 (   0.51%)
Hmean     256      2424.16 (   0.00%)     2448.40 *   1.00%*
Hmean     2048    15114.37 (   0.00%)    15160.59 (   0.31%)
Hmean     8192    32626.11 (   0.00%)    32056.40 (  -1.75%)
Stddev    64          5.99 (   0.00%)        5.93 (   0.98%)
Stddev    256        12.07 (   0.00%)       15.11 ( -25.17%)
Stddev    2048      106.56 (   0.00%)      180.05 ( -68.97%)
Stddev    8192      649.77 (   0.00%)      329.45 (  49.30%)

3)                         v-XEN-noHT               XEN-noHT
Hmean     64        674.89 (   0.00%)      679.64 (   0.70%)
Hmean     256      2426.14 (   0.00%)     2443.24 *   0.70%*
Hmean     2048    15273.97 (   0.00%)    15372.31 *   0.64%*
Hmean     8192    32895.01 (   0.00%)    32473.01 *  -1.28%*
Stddev    64          3.90 (   0.00%)        6.01 ( -54.19%)
Stddev    256         8.14 (   0.00%)       18.76 (-130.35%)
Stddev    2048       35.02 (   0.00%)       86.00 (-145.62%)
Stddev    8192      123.38 (   0.00%)      448.67 (-263.64%)

4)                             XEN-HT               XEN-noHT               =
 XEN-csc
Hmean     64        677.61 (   0.00%)      679.64 (   0.30%)      660.08 ( =
 -2.59%)
Hmean     256      2448.40 (   0.00%)     2443.24 (  -0.21%)     2402.64 * =
 -1.87%*
Hmean     2048    15160.59 (   0.00%)    15372.31 *   1.40%*    14591.20 * =
 -3.76%*
Hmean     8192    32056.40 (   0.00%)    32473.01 (   1.30%)    32024.74 ( =
 -0.10%)
Stddev    64          5.93 (   0.00%)        6.01 (  -1.39%)       31.04 (-=
423.45%)
Stddev    256        15.11 (   0.00%)       18.76 ( -24.13%)       46.90 (-=
210.39%)
Stddev    2048      180.05 (   0.00%)       86.00 (  52.23%)      339.19 ( =
-88.39%)
Stddev    8192      329.45 (   0.00%)      448.67 ( -36.18%)     1120.36 (-=
240.07%)

Also basically on par. Well, 'csc' is a little worse, but not as much as th=
e UDP case was. This suggests looking at differences in ways in which, from=
 a scheduling point of view, the two protocols are handled, could help unde=
rstand what is
happening.

5)                          HVM-v8-HT            HVM-v8-noHT             HV=
M-v8-csc
Hmean     64       1756.72 (   0.00%)     1687.44 *  -3.94%*     1644.27 * =
 -6.40%*
Hmean     256      6335.31 (   0.00%)     6142.90 *  -3.04%*     5850.62 * =
 -7.65%*
Hmean     2048    29738.54 (   0.00%)    28871.57 *  -2.92%*    27437.72 * =
 -7.74%*
Hmean     8192    46926.01 (   0.00%)    46011.63 *  -1.95%*    42627.47 * =
 -9.16%*
Stddev    64         35.93 (   0.00%)       13.81 (  61.56%)       14.56 ( =
 59.48%)
Stddev    256       110.09 (   0.00%)       53.63 (  51.28%)      142.11 ( =
-29.08%)
Stddev    2048      172.37 (   0.00%)      189.21 (  -9.77%)     1004.81 (-=
482.94%)
Stddev    8192      453.49 (   0.00%)      239.72 (  47.14%)     1262.32 (-=
178.36%)

'csc' not vastly, but consistently worse than 'noHT'.

6)                          HVM-v4-HT            HVM-v4-noHT             HV=
M-v4-csc
Stddev    64         20.10 (   0.00%)       10.70 (  46.75%)       45.83 (-=
128.07%)
Stddev    256        47.00 (   0.00%)       32.37 (  31.14%)       45.15 ( =
  3.95%)
Stddev    2048      205.29 (   0.00%)      148.42 (  27.70%)     1950.42 (-=
850.08%)
Stddev    8192      515.92 (   0.00%)       62.10 (  87.96%)    11909.19 (-=
2208.33%)
CoeffVar  64          1.19 (   0.00%)        0.64 (  46.37%)        2.79 (-=
135.02%)
CoeffVar  256         0.77 (   0.00%)        0.53 (  31.25%)        0.76 ( =
  1.48%)
CoeffVar  2048        0.71 (   0.00%)        0.51 (  27.61%)        7.00 (-=
887.77%)
CoeffVar  8192        1.13 (   0.00%)        0.13 (  88.04%)       24.76 (-=
2096.20%)

7)                        HVMx2-v8-HT          HVMx2-v8-noHT           HVMx=
2-v8-csc
Hmean     64       1272.66 (   0.00%)      996.12 * -21.73%*      968.44 * =
-23.90%*
Hmean     256      4376.58 (   0.00%)     3565.25 * -18.54%*     4088.77 * =
 -6.58%*
Hmean     2048    24077.77 (   0.00%)    17496.21 * -27.33%*    21709.20 * =
 -9.84%*
Hmean     8192    43332.46 (   0.00%)    32506.09 * -24.98%*    36700.18 * =
-15.31%*
Stddev    64         13.14 (   0.00%)        3.25 (  75.23%)      221.08 (-=
1582.74%)
Stddev    256        38.64 (   0.00%)       43.54 ( -12.66%)      316.66 (-=
719.41%)
Stddev    2048      202.53 (   0.00%)      117.33 (  42.07%)      208.33 ( =
 -2.86%)
Stddev    8192      274.71 (   0.00%)      299.39 (  -8.98%)      412.99 ( =
-50.33%)

Mixed. Some transfer size are better with 'csc' than 'noHT', some are worse=
.


NETPERF-UNIX
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
1)                              BM-HT                BM-noHT
Hmean     64        998.53 (   0.00%)     1000.92 (   0.24%)
Hmean     256      3672.82 (   0.00%)     3822.29 *   4.07%*
Hmean     2048     7951.98 (   0.00%)     7987.46 (   0.45%)
Hmean     8192     8218.97 (   0.00%)     8329.87 (   1.35%)
Stddev    64         38.66 (   0.00%)       15.94 (  58.78%)
Stddev    256        99.05 (   0.00%)       93.25 (   5.86%)
Stddev    2048       87.53 (   0.00%)       40.49 (  53.75%)
Stddev    8192      133.15 (   0.00%)       74.00 (  44.42%)

Substantially on par.

2)                           v-XEN-HT                 XEN-HT
Hmean     64        499.62 (   0.00%)      492.89 (  -1.35%)
Hmean     256      1900.97 (   0.00%)     1852.77 (  -2.54%)
Hmean     2048     2892.22 (   0.00%)     2765.65 *  -4.38%*
Hmean     8192     3105.85 (   0.00%)     2996.64 *  -3.52%*
Stddev    64          4.49 (   0.00%)       10.64 (-137.15%)
Stddev    256        87.54 (   0.00%)       54.63 (  37.59%)
Stddev    2048       35.26 (   0.00%)       18.20 (  48.39%)
Stddev    8192       21.32 (   0.00%)       15.74 (  26.15%)

3)                         v-XEN-noHT               XEN-noHT
Hmean     64        509.03 (   0.00%)      485.34 *  -4.65%*
Hmean     256      1894.53 (   0.00%)     1835.34 *  -3.12%*
Hmean     2048     2906.15 (   0.00%)     2747.32 *  -5.47%*
Hmean     8192     3158.33 (   0.00%)     2968.85 *  -6.00%*
Stddev    64          3.39 (   0.00%)       20.01 (-489.71%)
Stddev    256        51.32 (   0.00%)       15.13 (  70.52%)
Stddev    2048       33.35 (   0.00%)        9.37 (  71.89%)
Stddev    8192       32.53 (   0.00%)       11.30 (  65.26%)

In both 'HT' and 'noHT' cases, overhead of just having the patch applied is=
 not too big, but it's there. It may be worth studying this workload, tryin=
g to figure what are the paths that are introducing such overhead (with the=
 goal of optimizing them).

4)                             XEN-HT               XEN-noHT               =
 XEN-csc
Hmean     64        492.89 (   0.00%)      485.34 (  -1.53%)      451.13 * =
 -8.47%*
Hmean     256      1852.77 (   0.00%)     1835.34 (  -0.94%)     1272.07 * =
-31.34%*
Hmean     2048     2765.65 (   0.00%)     2747.32 *  -0.66%*     3086.19 ( =
 11.59%)
Hmean     8192     2996.64 (   0.00%)     2968.85 *  -0.93%*     2731.31 * =
 -8.85%*
Stddev    64         10.64 (   0.00%)       20.01 ( -88.04%)       25.28 (-=
137.53%)
Stddev    256        54.63 (   0.00%)       15.13 (  72.31%)      393.61 (-=
620.45%)
Stddev    2048       18.20 (   0.00%)        9.37 (  48.48%)      946.82 (-=
5103.09%)
Stddev    8192       15.74 (   0.00%)       11.30 (  28.21%)      104.54 (-=
564.07%)

Mixed-bag, with higher (both positive and negative, mostly negative) peaks.

5)                          HVM-v8-HT            HVM-v8-noHT             HV=
M-v8-csc
Hmean     64        275.22 (   0.00%)      288.06 (   4.66%)      277.23 ( =
  0.73%)
Hmean     256       977.34 (   0.00%)      877.63 ( -10.20%)      761.25 * =
-22.11%*
Hmean     2048     4702.72 (   0.00%)     5819.12 (  23.74%)     5531.96 ( =
 17.63%)
Hmean     8192     5962.89 (   0.00%)     6462.60 (   8.38%)     5387.48 ( =
 -9.65%)
Stddev    64         48.37 (   0.00%)       46.27 (   4.34%)       59.79 ( =
-23.61%)
Stddev    256       123.98 (   0.00%)       48.93 (  60.54%)      163.00 ( =
-31.47%)
Stddev    2048     1181.41 (   0.00%)      761.99 (  35.50%)      827.15 ( =
 29.99%)
Stddev    8192     1708.12 (   0.00%)     1247.83 (  26.95%)     1065.82 ( =
 37.60%)

What we see here, is that 'noHT' deviates more from 'HT'. For 3 configurati=
ons out of 4, for the better (i.e., 'noHT' is faster than 'HT'). 'csc' is, =
again, generally worse than 'noHT'.

6)                          HVM-v4-HT            HVM-v4-noHT             HV=
M-v4-csc
Hmean     64        225.32 (   0.00%)      239.36 (   6.23%)      203.05 ( =
 -9.88%)
Hmean     256       707.19 (   0.00%)      782.19 (  10.60%)      751.77 ( =
  6.30%)
Hmean     2048     2719.26 (   0.00%)     4156.29 *  52.85%*     3624.27 ( =
 33.28%)
Hmean     8192     4263.18 (   0.00%)     5724.08 *  34.27%*     3579.16 ( =
-16.04%)
Stddev    64         46.49 (   0.00%)       31.12 (  33.07%)       11.06 ( =
 76.21%)
Stddev    256       119.32 (   0.00%)      130.87 (  -9.67%)       87.78 ( =
 26.44%)
Stddev    2048     1030.34 (   0.00%)      907.53 (  11.92%)     1715.05 ( =
-66.46%)
Stddev    8192      821.15 (   0.00%)      275.68 (  66.43%)     1131.40 ( =
-37.78%)

7)                        HVMx2-v8-HT          HVMx2-v8-noHT           HVMx=
2-v8-csc
Hmean     64        243.29 (   0.00%)      165.06 * -32.16%*      188.01 * =
-22.72%*
Hmean     256       711.91 (   0.00%)      472.92 * -33.57%*      504.46 * =
-29.14%*
Hmean     2048     3163.60 (   0.00%)     1955.93 * -38.17%*     2880.11 ( =
 -8.96%)
Hmean     8192     4277.51 (   0.00%)     2377.98 * -44.41%*     3086.59 * =
-27.84%*
Stddev    64         21.43 (   0.00%)       19.08 (  10.96%)       29.45 ( =
-37.42%)
Stddev    256        86.25 (   0.00%)       50.56 (  41.38%)      112.78 ( =
-30.76%)
Stddev    2048      311.30 (   0.00%)      317.03 (  -1.84%)      610.38 ( =
-96.07%)
Stddev    8192      208.86 (   0.00%)      314.18 ( -50.42%)      580.38 (-=
177.88%)
---
STREAM
=3D=3D=3D=3D=3D=3D
Dom0
----
                           v-XEN-HT             v-XEN-noHT                 =
XEN-HT                XEN-noHT                 XEN-csc
MB/sec copy     33076.00 (   0.00%)    33054.78 (  -0.06%)    33112.76 (   =
0.11%)    33070.62       -0.02    31811.06       -3.82
MB/sec scale    24170.98 (   0.00%)    24198.12 (   0.11%)    24225.04 (   =
0.22%)    24335.76        0.68    22745.18       -5.90
MB/sec add      27060.58 (   0.00%)    27084.58 (   0.09%)    27195.52 (   =
0.50%)    27360.86        1.11    25088.74       -7.29
MB/sec triad    27172.34 (   0.00%)    27199.12 (   0.10%)    27296.42 (   =
0.46%)    27468.54        1.09    25170.02       -7.37

HVM-v8
------
                        v-HVM-v8-HT          v-HVM-v8-noHT              HVM=
-v8-HT             HVM-v8-noHT              HVM-v8-csc
MB/sec copy     32690.84 (   0.00%)    33611.24 (   2.82%)    33338.56 (   =
1.98%)    34168.32        4.52    29568.34       -9.55
MB/sec scale    21899.94 (   0.00%)    22677.44 (   3.55%)    22001.94 (   =
0.47%)    23023.06        5.13    18635.30      -14.91
MB/sec add      25256.10 (   0.00%)    26822.30 (   6.20%)    25442.48 (   =
0.74%)    26676.96        5.63    21632.14      -14.35
MB/sec triad    25104.72 (   0.00%)    26821.96 (   6.84%)    26376.48 (   =
5.07%)    26542.96        5.73    21751.54      -13.36

HVM-v4
------
                        v-HVM-v4-HT          v-HVM-v4-noHT              HVM=
-v4-HT             HVM-v4-noHT              HVM-v4-csc
MB/sec copy     34027.40 (   0.00%)    32887.74 (  -3.35%)    31917.34 (  -=
6.20%)    33820.44       -0.61    31186.82       -8.35
MB/sec scale    22269.94 (   0.00%)    20785.18 (  -6.67%)    20741.28 (  -=
6.86%)    22320.82        0.23    19471.54      -12.57
MB/sec add      26549.00 (   0.00%)    25561.32 (  -3.72%)    25120.08 (  -=
5.38%)    26553.58        0.02    22348.62      -15.82
MB/sec triad    26431.74 (   0.00%)    26365.78 (  -0.25%)    24979.40 (  -=
5.49%)    26075.40       -1.35    21988.46      -16.81

HVMx2
-----
                      v-HVMx2-v8-HT        v-HVMx2-v8-noHT            HVMx2=
-v8-HT           HVMx2-v8-noHT            HVMx2-v8-csc
MB/sec copy     29073.86 (   0.00%)    22403.74 ( -22.94%)    28821.94 (  -=
0.87%)    22508.84      -22.58    27223.16       -6.37
MB/sec scale    20555.88 (   0.00%)    15184.40 ( -26.13%)    20544.64 (  -=
0.05%)    15269.06      -25.72    17813.02      -13.34
MB/sec add      22447.72 (   0.00%)    16661.36 ( -25.78%)    22774.16 (   =
1.45%)    16733.48      -25.46    19659.98      -12.42
MB/sec triad    22261.18 (   0.00%)    16654.90 ( -25.18%)    22163.52 (  -=
0.44%)    16508.20      -25.84    19722.54      -11.40


KERNBENCH
=3D=3D=3D=3D=3D=3D=3D=3D=3D
Dom0
----
                                v-XEN-HT             v-XEN-noHT            =
     XEN-HT               XEN-noHT                XEN-csc
Amean     elsp-2       234.13 (   0.00%)      233.23 *   0.38%*      233.63=
 (   0.21%)      233.16 *   0.42%*      248.12 *  -5.98%*
Amean     elsp-4       139.89 (   0.00%)      130.00 *   7.07%*      140.21=
 *  -0.23%*      130.43 *   6.77%*      145.65 *  -4.12%*
Amean     elsp-8        98.15 (   0.00%)      132.86 * -35.37%*       98.22=
 (  -0.08%)      132.34 * -34.84%*       98.15 (  -0.01%)
Amean     elsp-16       99.05 (   0.00%)      135.61 * -36.90%*       99.65=
 *  -0.61%*      135.51 * -36.81%*       99.58 (  -0.53%)
Stddev    elsp-2         0.40 (   0.00%)        0.10 (  74.63%)        0.14=
 (  64.63%)        0.06 (  84.75%)        0.19 (  51.61%)
Stddev    elsp-4         0.11 (   0.00%)        0.04 (  66.87%)        0.14=
 ( -33.77%)        0.67 (-528.22%)        0.57 (-442.09%)
Stddev    elsp-8         0.23 (   0.00%)        0.37 ( -58.43%)        0.40=
 ( -68.71%)        0.04 (  82.95%)        0.03 (  86.30%)
Stddev    elsp-16        0.05 (   0.00%)        0.20 (-306.12%)        0.47=
 (-855.23%)        0.34 (-589.65%)        0.47 (-850.20%)

HVM-v8
------
                             v-HVM-v8-HT          v-HVM-v8-noHT            =
  HVM-v8-HT            HVM-v8-noHT             HVM-v8-csc
Amean     elsp-2       204.73 (   0.00%)      206.77 *  -1.00%*      202.45=
 *   1.11%*      205.87 *  -0.56%*      218.87 *  -6.91%*
Amean     elsp-4       123.10 (   0.00%)      115.66 *   6.04%*      121.90=
 *   0.98%*      115.41 *   6.25%*      128.78 *  -4.61%*
Amean     elsp-8        87.42 (   0.00%)      125.83 * -43.94%*       85.94=
 *   1.70%*      125.71 * -43.79%*       87.26 (   0.19%)
Amean     elsp-16       87.78 (   0.00%)      128.51 * -46.41%*       87.37=
 (   0.46%)      128.52 * -46.42%*       88.03 (  -0.29%)
Stddev    elsp-2         0.08 (   0.00%)        0.11 ( -32.29%)        0.09=
 (  -5.22%)        0.34 (-320.09%)        1.30 (-1513.29%)
Stddev    elsp-4         0.41 (   0.00%)        0.07 (  82.57%)        0.44=
 (  -8.26%)        0.27 (  33.60%)        0.60 ( -47.86%)
Stddev    elsp-8         1.11 (   0.00%)        0.42 (  61.72%)        0.14=
 (  87.69%)        0.22 (  79.83%)        0.35 (  68.79%)
Stddev    elsp-16        0.45 (   0.00%)        0.41 (   8.89%)        0.02=
 (  94.90%)        0.40 (  12.00%)        0.32 (  28.63%)

HVM-v4
------
                             v-HVM-v4-HT          v-HVM-v4-noHT            =
  HVM-v4-HT            HVM-v4-noHT             HVM-v4-csc
Amean     elsp-2       208.43 (   0.00%)      205.99 *   1.17%*      206.05=
 *   1.14%*      208.49 (  -0.03%)      237.58 * -13.99%*
Amean     elsp-4       116.18 (   0.00%)      113.77 *   2.07%*      114.53=
 *   1.42%*      115.46 (   0.62%)      162.61 * -39.96%*
Amean     elsp-8       135.79 (   0.00%)      116.07 *  14.52%*      127.22=
 *   6.31%*      117.63 *  13.37%*      166.22 * -22.41%*
Amean     elsp-16      139.37 (   0.00%)      119.35 *  14.37%*      133.70=
 *   4.07%*      120.53 *  13.52%*      170.05 * -22.01%*
Stddev    elsp-2         0.12 (   0.00%)        0.08 (  31.03%)        0.26=
 (-118.28%)        0.24 (-102.17%)        0.34 (-185.87%)
Stddev    elsp-4         0.64 (   0.00%)        0.02 (  96.39%)        0.29=
 (  54.24%)        0.23 (  63.79%)        0.24 (  62.09%)
Stddev    elsp-8         1.69 (   0.00%)        0.21 (  87.34%)        2.21=
 ( -31.12%)        0.12 (  92.76%)        0.24 (  85.59%)
Stddev    elsp-16        1.55 (   0.00%)        0.13 (  91.93%)        2.00=
 ( -28.78%)        0.57 (  63.08%)        0.34 (  77.94%)

HVMx2
-----
                           v-HVMx2-v8-HT        v-HVMx2-v8-noHT            =
HVMx2-v8-HT          HVMx2-v8-noHT           HVMx2-v8-csc
Amean     elsp-2       288.41 (   0.00%)      433.37 * -50.26%*      288.82=
 (  -0.14%)      437.79 * -51.79%*      339.86 * -17.84%*
Amean     elsp-4       195.93 (   0.00%)      292.53 * -49.30%*      196.18=
 (  -0.13%)      294.95 * -50.54%*      242.91 * -23.98%*
Amean     elsp-8       152.94 (   0.00%)      226.94 * -48.38%*      153.27=
 (  -0.21%)      229.25 * -49.89%*      182.50 * -19.33%*
Amean     elsp-16      156.21 (   0.00%)      233.02 * -49.17%*      156.59=
 (  -0.24%)      235.63 * -50.84%*      185.82 * -18.95%*
Stddev    elsp-2         0.52 (   0.00%)        0.36 (  30.55%)        0.20=
 (  61.63%)        0.34 (  35.83%)        2.56 (-389.55%)
Stddev    elsp-4         0.58 (   0.00%)        0.32 (  44.47%)        0.48=
 (  16.07%)        0.07 (  88.46%)        0.41 (  29.44%)
Stddev    elsp-8         0.15 (   0.00%)        0.87 (-477.96%)        0.39=
 (-157.52%)        0.81 (-438.90%)        1.30 (-764.70%)
Stddev    elsp-16        0.71 (   0.00%)        0.16 (  77.40%)        0.88=
 ( -25.43%)        0.87 ( -22.96%)        1.75 (-148.69%)


HACKBENCH-PROCESS-PIPE
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Dom0
----
                           v-XEN-HT             v-XEN-noHT                 =
XEN-HT               XEN-noHT                XEN-csc
Amean     1       0.7356 (   0.00%)      1.2154 * -65.23%*      0.7470 (  -=
1.55%)      1.2200 * -65.85%*      0.7160 (   2.66%)
Amean     3       2.3506 (   0.00%)      3.9274 * -67.08%*      2.4632 (  -=
4.79%)      3.9302 * -67.20%*      2.2284 (   5.20%)
Amean     5       4.1084 (   0.00%)      6.6430 * -61.69%*      4.0418 (   =
1.62%)      6.6584 * -62.07%*      4.0492 (   1.44%)
Amean     7       5.8314 (   0.00%)      9.2772 * -59.09%*      5.9784 (  -=
2.52%)      9.8144 * -68.30%*      5.8718 (  -0.69%)
Amean     12      9.9694 (   0.00%)     14.8220 * -48.67%*     10.4374 *  -=
4.69%*     14.4464 * -44.91%*     10.1488 (  -1.80%)
Amean     18     14.2844 (   0.00%)     21.6266 * -51.40%*     14.1366 (   =
1.03%)     20.2166 * -41.53%*     14.7450 *  -3.22%*
Amean     24     19.0304 (   0.00%)     27.2974 * -43.44%*     17.6314 (   =
7.35%)     26.1082 * -37.19%*     18.0072 (   5.38%)
Amean     30     21.8334 (   0.00%)     32.2406 * -47.67%*     21.9030 (  -=
0.32%)     31.1702 * -42.76%*     21.1058 (   3.33%)
Amean     32     22.8946 (   0.00%)     34.8984 * -52.43%*     22.0216 *   =
3.81%*     33.8204 * -47.72%*     22.7300 (   0.72%)
Stddev    1       0.0213 (   0.00%)      0.0727 (-241.00%)      0.0327 ( -5=
3.61%)      0.0560 (-162.76%)      0.0168 (  21.21%)
Stddev    3       0.1634 (   0.00%)      0.2564 ( -56.92%)      0.0952 (  4=
1.73%)      0.1332 (  18.47%)      0.0944 (  42.24%)
Stddev    5       0.3934 (   0.00%)      0.6043 ( -53.61%)      0.1954 (  5=
0.33%)      0.5454 ( -38.63%)      0.3064 (  22.12%)
Stddev    7       0.1796 (   0.00%)      0.6785 (-277.74%)      0.2809 ( -5=
6.40%)      0.4508 (-150.96%)      0.5762 (-220.78%)
Stddev    12      0.1695 (   0.00%)      0.5074 (-199.31%)      0.3725 (-11=
9.74%)      0.8115 (-378.66%)      0.3594 (-111.98%)
Stddev    18      0.1392 (   0.00%)      0.9622 (-591.50%)      0.4003 (-18=
7.67%)      0.8868 (-537.31%)      0.2580 ( -85.37%)
Stddev    24      1.5323 (   0.00%)      0.4904 (  68.00%)      0.7330 (  5=
2.16%)      0.8453 (  44.83%)      0.8976 (  41.42%)
Stddev    30      0.4214 (   0.00%)      0.5542 ( -31.51%)      1.0668 (-15=
3.14%)      0.6499 ( -54.22%)      0.8666 (-105.64%)
Stddev    32      0.8221 (   0.00%)      0.4986 (  39.35%)      0.3849 (  5=
3.18%)      0.7965 (   3.11%)      1.4428 ( -75.50%)

HVM-v8
------
                        v-HVM-v8-HT          v-HVM-v8-noHT              HVM=
-v8-HT            HVM-v8-noHT             HVM-v8-csc
Amean     1       0.9110 (   0.00%)      1.1916 * -30.80%*      0.8992 (   =
1.30%)      1.1826 * -29.81%*      0.9462 (  -3.86%)
Amean     3       2.5652 (   0.00%)      2.5224 (   1.67%)      2.4524 *   =
4.40%*      2.4990 (   2.58%)      2.5514 (   0.54%)
Amean     5       3.7944 (   0.00%)      3.6360 (   4.17%)      3.6710 (   =
3.25%)      3.5258 (   7.08%)      3.9270 (  -3.49%)
Amean     7       4.9098 (   0.00%)      4.7782 (   2.68%)      4.6588 (   =
5.11%)      4.6430 (   5.43%)      5.0420 (  -2.69%)
Amean     12      7.7490 (   0.00%)      7.8662 (  -1.51%)      7.7872 (  -=
0.49%)      7.6310 (   1.52%)      7.6498 (   1.28%)
Amean     18     11.5028 (   0.00%)     13.6472 * -18.64%*     10.9800 (   =
4.54%)     12.2772 (  -6.73%)     11.1940 (   2.68%)
Amean     24     14.5122 (   0.00%)     18.7738 * -29.37%*     16.5552 * -1=
4.08%*     18.1368 * -24.98%*     15.1922 (  -4.69%)
Amean     30     19.9878 (   0.00%)     23.7490 * -18.82%*     17.1778 *  1=
4.06%*     24.0352 * -20.25%*     17.7776 *  11.06%*
Amean     32     17.0554 (   0.00%)     25.6216 * -50.23%*     19.1966 ( -1=
2.55%)     25.3104 * -48.40%*     19.8716 * -16.51%*
Stddev    1       0.0403 (   0.00%)      0.0441 (  -9.28%)      0.0306 (  2=
4.17%)      0.0440 (  -9.25%)      0.0419 (  -3.84%)
Stddev    3       0.0681 (   0.00%)      0.0243 (  64.28%)      0.0681 (   =
0.11%)      0.1289 ( -89.14%)      0.0975 ( -43.14%)
Stddev    5       0.2333 (   0.00%)      0.1336 (  42.73%)      0.1214 (  4=
7.96%)      0.2722 ( -16.65%)      0.2080 (  10.83%)
Stddev    7       0.3640 (   0.00%)      0.3416 (   6.16%)      0.5810 ( -5=
9.58%)      0.2687 (  26.18%)      0.3038 (  16.56%)
Stddev    12      1.4176 (   0.00%)      0.7817 (  44.85%)      1.4867 (  -=
4.88%)      1.3196 (   6.91%)      1.5775 ( -11.28%)
Stddev    18      2.0262 (   0.00%)      1.4042 (  30.70%)      1.9110 (   =
5.69%)      1.8377 (   9.30%)      1.3230 (  34.71%)
Stddev    24      1.9163 (   0.00%)      1.2319 (  35.71%)      1.4038 (  2=
6.75%)      1.2938 (  32.49%)      1.2301 (  35.81%)
Stddev    30      0.8934 (   0.00%)      0.5216 (  41.62%)      2.0035 (-12=
4.27%)      1.3529 ( -51.44%)      2.4480 (-174.03%)
Stddev    32      1.9707 (   0.00%)      1.1169 (  43.32%)      1.8277 (   =
7.26%)      1.1786 (  40.20%)      2.4069 ( -22.13%)

HVM-v4
------
                        v-HVM-v4-HT          v-HVM-v4-noHT              HVM=
-v4-HT            HVM-v4-noHT             HVM-v4-csc
Amean     1       1.4166 (   0.00%)      1.5276 (  -7.84%)      1.4962 (  -=
5.62%)      1.4424 (  -1.82%)      1.6824 * -18.76%*
Amean     3       2.8812 (   0.00%)      2.5782 (  10.52%)      2.5826 (  1=
0.36%)      2.9692 (  -3.05%)      2.9984 (  -4.07%)
Amean     5       3.6958 (   0.00%)      2.9828 *  19.29%*      3.4330 (   =
7.11%)      3.5064 (   5.12%)      4.7144 * -27.56%*
Amean     7       4.0368 (   0.00%)      4.3646 (  -8.12%)      5.3896 ( -3=
3.51%)      4.5122 ( -11.78%)      5.7828 * -43.25%*
Amean     12      8.5918 (   0.00%)      7.5160 (  12.52%)      7.6862 (  1=
0.54%)      8.1164 (   5.53%)     10.3868 * -20.89%*
Amean     18     11.8664 (   0.00%)      9.6676 (  18.53%)     10.8628 (   =
8.46%)     10.8600 (   8.48%)     14.5226 * -22.38%*
Amean     24     15.1868 (   0.00%)     14.3044 (   5.81%)     16.1058 (  -=
6.05%)     13.9238 (   8.32%)     17.3746 ( -14.41%)
Amean     30     18.1732 (   0.00%)     13.3870 *  26.34%*     17.9462 (   =
1.25%)     20.1588 ( -10.93%)     22.2760 * -22.58%*
Amean     32     20.1886 (   0.00%)     18.9476 (   6.15%)     20.8922 (  -=
3.49%)     15.2004 *  24.71%*     22.5168 ( -11.53%)
Stddev    1       0.1570 (   0.00%)      0.0459 (  70.75%)      0.0353 (  7=
7.49%)      0.0996 (  36.54%)      0.0573 (  63.51%)
Stddev    3       0.2794 (   0.00%)      0.3201 ( -14.55%)      0.4556 ( -6=
3.07%)      0.6097 (-118.20%)      0.4727 ( -69.16%)
Stddev    5       0.5446 (   0.00%)      0.2571 (  52.80%)      0.7936 ( -4=
5.73%)      0.6409 ( -17.68%)      1.0294 ( -89.03%)
Stddev    7       1.0122 (   0.00%)      0.5749 (  43.20%)      1.3387 ( -3=
2.26%)      0.9335 (   7.78%)      1.5652 ( -54.63%)
Stddev    12      1.3820 (   0.00%)      1.3625 (   1.41%)      1.1304 (  1=
8.21%)      1.8932 ( -36.98%)      1.6302 ( -17.96%)
Stddev    18      1.7693 (   0.00%)      2.4127 ( -36.37%)      2.6187 ( -4=
8.01%)      2.2309 ( -26.09%)      0.9304 (  47.41%)
Stddev    24      2.4119 (   0.00%)      3.0559 ( -26.70%)      2.2138 (   =
8.21%)      1.6892 (  29.96%)      1.4706 (  39.03%)
Stddev    30      1.5649 (   0.00%)      1.5202 (   2.85%)      1.6264 (  -=
3.93%)      2.1632 ( -38.24%)      1.6574 (  -5.91%)
Stddev    32      1.8988 (   0.00%)      2.5294 ( -33.21%)      3.5272 ( -8=
5.76%)      2.5166 ( -32.54%)      2.0956 ( -10.36%)

HVMx2
-----
                    v-HVMx2-v8-HT        v-HVMx2-v8-noHT            HVMx2-v=
8-HT           HVMx2-v8-noHT            HVMx2-v8-csc
Amean     1       1.4746 (   0.00%)      1.1486 *  22.11%*      1.4736 (   =
0.07%)      1.2224 *  17.10%*      1.6544 * -12.19%*
Amean     3       3.2278 (   0.00%)      2.3356 *  27.64%*      3.1764 (   =
1.59%)      2.4984 *  22.60%*      2.9720 *   7.92%*
Amean     5       4.8324 (   0.00%)      3.4158 *  29.31%*      4.7694 (   =
1.30%)      3.4870 *  27.84%*      4.4406 *   8.11%*
Amean     7       6.2532 (   0.00%)      4.4590 *  28.69%*      6.3958 (  -=
2.28%)      4.6320 *  25.93%*      5.9150 (   5.41%)
Amean     12     11.6814 (   0.00%)      7.5236 *  35.59%*     11.0484 (   =
5.42%)      7.6534 *  34.48%*      9.7064 *  16.91%*
Amean     18     16.7618 (   0.00%)     11.7750 *  29.75%*     16.8658 (  -=
0.62%)     12.8028 *  23.62%*     17.0654 (  -1.81%)
Amean     24     23.3174 (   0.00%)     17.8512 *  23.44%*     23.6798 (  -=
1.55%)     18.8692 *  19.08%*     24.1742 (  -3.67%)
Amean     30     29.7604 (   0.00%)     25.2918 *  15.02%*     29.6202 (   =
0.47%)     25.4126 *  14.61%*     30.5034 (  -2.50%)
Amean     32     31.9166 (   0.00%)     26.6520 *  16.49%*     31.7582 (   =
0.50%)     28.5946 *  10.41%*     33.0222 *  -3.46%*
Stddev    1       0.0496 (   0.00%)      0.0159 (  67.85%)      0.0309 (  3=
7.60%)      0.0294 (  40.77%)      0.0526 (  -6.03%)
Stddev    3       0.0469 (   0.00%)      0.1044 (-122.37%)      0.1102 (-13=
4.80%)      0.0670 ( -42.65%)      0.0956 (-103.57%)
Stddev    5       0.1882 (   0.00%)      0.1189 (  36.79%)      0.2023 (  -=
7.51%)      0.1089 (  42.12%)      0.0694 (  63.10%)
Stddev    7       0.3875 (   0.00%)      0.1279 (  66.99%)      0.3783 (   =
2.36%)      0.1408 (  63.67%)      0.2421 (  37.52%)
Stddev    12      1.1041 (   0.00%)      0.3356 (  69.61%)      1.5160 ( -3=
7.30%)      0.3483 (  68.45%)      1.3210 ( -19.64%)
Stddev    18      1.1648 (   0.00%)      0.9867 (  15.29%)      1.3000 ( -1=
1.61%)      1.2858 ( -10.39%)      0.8736 (  25.00%)
Stddev    24      1.8746 (   0.00%)      1.7346 (   7.47%)      0.8749 (  5=
3.33%)      0.8663 (  53.79%)      0.8197 (  56.27%)
Stddev    30      0.8898 (   0.00%)      0.8720 (   2.01%)      1.3074 ( -4=
6.92%)      1.4297 ( -60.67%)      1.2882 ( -44.77%)
Stddev    32      0.8406 (   0.00%)      0.9333 ( -11.03%)      1.2521 ( -4=
8.95%)      1.0791 ( -28.38%)      0.7319 (  12.93%)


MUTILATE
=3D=3D=3D=3D=3D=3D=3D=3D
Dom0
----
                          v-XEN-HT             v-XEN-noHT                 X=
EN-HT               XEN-noHT                XEN-csc
Hmean     1    31121.40 (   0.00%)    31182.90 (   0.20%)    31063.01 (  -0=
.19%)    31107.06 (  -0.05%)    29609.98 *  -4.86%*
Hmean     3    75847.21 (   0.00%)    83473.18 *  10.05%*    75373.02 (  -0=
.63%)    84387.92 *  11.26%*    73419.60 *  -3.20%*
Hmean     5   113823.13 (   0.00%)    90322.68 * -20.65%*   113127.84 (  -0=
.61%)    91396.40 * -19.70%*   100843.37 * -11.40%*
Hmean     7   112553.93 (   0.00%)    91082.97 * -19.08%*   112467.16 (  -0=
.08%)    91296.28 * -18.89%*   108439.16 *  -3.66%*
Hmean     8   103472.02 (   0.00%)    89529.42 * -13.47%*   103246.75 (  -0=
.22%)    89442.61 * -13.56%*   101164.18 *  -2.23%*
Stddev    1      147.14 (   0.00%)      369.37 (-151.04%)      175.64 ( -19=
.37%)      336.37 (-128.61%)      271.28 ( -84.38%)
Stddev    3      920.80 (   0.00%)      300.44 (  67.37%)     1017.40 ( -10=
.49%)      333.46 (  63.79%)      367.95 (  60.04%)
Stddev    5      339.23 (   0.00%)      842.22 (-148.27%)      781.99 (-130=
.52%)      816.23 (-140.61%)      549.77 ( -62.06%)
Stddev    7      248.83 (   0.00%)      907.80 (-264.83%)      404.74 ( -62=
.66%)     1084.18 (-335.72%)      376.92 ( -51.48%)
Stddev    8      132.22 (   0.00%)      362.90 (-174.47%)      274.16 (-107=
.35%)      890.80 (-573.74%)      987.59 (-646.94%)

HVM-v8
------
                       v-HVM-v8-HT          v-HVM-v8-noHT              HVM-=
v8-HT            HVM-v8-noHT             HVM-v8-csc
Hmean     1    40028.72 (   0.00%)    37434.58 *  -6.48%*    39583.53 *  -1=
.11%*    38828.65 *  -3.00%*    35103.76 * -12.30%*
Hmean     3    86535.13 (   0.00%)    55588.26 * -35.76%*    87210.00 (   0=
.78%)    57874.31 * -33.12%*    47160.22 * -45.50%*
Hmean     5   129214.62 (   0.00%)    40925.40 * -68.33%*   130676.61 (   1=
.13%)    42883.21 * -66.81%*    85504.60 * -33.83%*
Hmean     7   156682.49 (   0.00%)    51225.56 * -67.31%*   157586.93 (   0=
.58%)    59146.02 * -62.25%*   136717.21 * -12.74%*
Hmean     8   170156.78 (   0.00%)    67430.68 * -60.37%*   174113.49 *   2=
.33%*    75503.09 * -55.63%*   159666.07 *  -6.17%*
Stddev    1      151.77 (   0.00%)      288.75 ( -90.25%)      160.68 (  -5=
.87%)      232.01 ( -52.87%)      547.91 (-261.01%)
Stddev    3      322.96 (   0.00%)      557.82 ( -72.72%)     1158.62 (-258=
.75%)      654.05 (-102.51%)    18841.25 (-5733.90%)
Stddev    5     1396.24 (   0.00%)     1741.63 ( -24.74%)      298.35 (  78=
.63%)      542.51 (  61.14%)     1274.93 (   8.69%)
Stddev    7      808.54 (   0.00%)     2547.30 (-215.05%)     2569.12 (-217=
.75%)     1034.22 ( -27.91%)     4163.80 (-414.98%)
Stddev    8     2411.73 (   0.00%)     3538.44 ( -46.72%)      982.48 (  59=
.26%)      692.10 (  71.30%)     1324.30 (  45.09%)

HVM-v4
------
                       v-HVM-v4-HT          v-HVM-v4-noHT              HVM-=
v4-HT            HVM-v4-noHT             HVM-v4-csc
Hmean     1    38127.59 (   0.00%)    37939.84 (  -0.49%)    37156.88 *  -2=
.55%*    36938.92 *  -3.12%*    34869.19 *  -8.55%*
Hmean     3    91447.41 (   0.00%)    91291.57 (  -0.17%)    91170.71 (  -0=
.30%)    91469.09 (   0.02%)    76214.51 * -16.66%*
Hmean     5   119169.44 (   0.00%)   130797.85 *   9.76%*   119020.55 (  -0=
.12%)   126949.11 *   6.53%*   109062.82 *  -8.48%*
Hmean     7   122588.88 (   0.00%)   129802.50 (   5.88%)   119924.66 (  -2=
.17%)   133372.57 *   8.80%*   110466.18 *  -9.89%*
Hmean     8   127027.63 (   0.00%)   137217.76 *   8.02%*   121329.34 (  -4=
.49%)   136100.78 (   7.14%)   114071.36 * -10.20%*
Stddev    1      100.77 (   0.00%)      271.37 (-169.31%)      214.02 (-112=
.39%)      362.58 (-259.82%)      516.53 (-412.61%)
Stddev    3      980.00 (   0.00%)     1264.82 ( -29.06%)     2554.47 (-160=
.66%)     1549.81 ( -58.14%)      748.72 (  23.60%)
Stddev    5      545.35 (   0.00%)     2910.89 (-433.76%)     1061.32 ( -94=
.61%)     2250.11 (-312.60%)     2377.12 (-335.89%)
Stddev    7     6082.18 (   0.00%)     9179.69 ( -50.93%)     5486.68 (   9=
.79%)     3214.60 (  47.15%)     4147.45 (  31.81%)
Stddev    8     6445.70 (   0.00%)      433.52 (  93.27%)     1857.60 (  71=
.18%)    12837.92 ( -99.17%)     3400.78 (  47.24%)

HVMx2
-----
                     v-HVMx2-v8-HT        v-HVMx2-v8-noHT            HVMx2-=
v8-HT          HVMx2-v8-noHT           HVMx2-v8-csc
Hmean     1    30318.06 (   0.00%)     1864.40 * -93.85%*    30194.08 (  -0=
.41%)     2457.66 * -91.89%*     4940.93 * -83.70%*
Hmean     3    34617.67 (   0.00%)     7414.77 * -78.58%*    33860.02 (  -2=
.19%)    11209.64 * -67.62%*    23274.26 * -32.77%*
Hmean     5    44382.41 (   0.00%)    11534.71 * -74.01%*    45606.53 (   2=
.76%)    15984.89 * -63.98%*    38599.75 ( -13.03%)
Hmean     7    65170.13 (   0.00%)    23530.68 * -63.89%*    70754.93 *   8=
.57%*    23045.58 * -64.64%*    55799.74 * -14.38%*
Hmean     8    85619.81 (   0.00%)    36969.39 * -56.82%*    88529.15 (   3=
.40%)    36532.64 * -57.33%*    70367.33 * -17.81%*
Stddev    1      532.15 (   0.00%)        3.55 (  99.33%)      214.55 (  59=
.68%)        2.87 (  99.46%)    13159.62 (-2372.92%)
Stddev    3      520.12 (   0.00%)       66.14 (  87.28%)      440.61 (  15=
.29%)      179.15 (  65.56%)     4463.14 (-758.09%)
Stddev    5      730.81 (   0.00%)       52.70 (  92.79%)      900.27 ( -23=
.19%)      161.20 (  77.94%)     6286.95 (-760.27%)
Stddev    7     1851.68 (   0.00%)     1217.81 (  34.23%)      706.22 (  61=
.86%)      708.81 (  61.72%)     3845.49 (-107.68%)
Stddev    8     2002.34 (   0.00%)      868.00 (  56.65%)     3197.46 ( -59=
.69%)      818.97 (  59.10%)     4477.51 (-123.61%)


PGIOPERFBENCH
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Dom0
----
                               v-XEN-HT             v-XEN-noHT             =
    XEN-HT               XEN-noHT                XEN-csc
Amean     commit        7.88 (   0.00%)        8.53 (  -8.25%)        8.78 =
* -11.43%*        7.64 (   3.09%)        8.20 (  -4.04%)
Amean     read          6.85 (   0.00%)        7.30 *  -6.63%*        7.71 =
* -12.54%*        6.86 (  -0.21%)        7.21 *  -5.30%*
Amean     wal           0.07 (   0.00%)        0.08 * -14.01%*        0.07 =
(   1.15%)        0.08 * -11.04%*        0.08 (  -6.71%)
Stddev    commit        1.86 (   0.00%)        4.27 (-129.47%)        3.59 =
( -92.56%)        1.35 (  27.62%)        3.50 ( -88.00%)
Stddev    read          0.53 (   0.00%)        3.12 (-494.65%)        2.89 =
(-450.88%)        0.39 (  25.38%)        2.50 (-376.42%)
Stddev    wal           0.05 (   0.00%)        0.04 (   4.58%)        0.05 =
(  -0.86%)        0.04 (  10.58%)        0.04 (   5.91%)

HVM-v8
------
                            v-HVM-v8-HT          v-HVM-v8-noHT             =
 HVM-v8-HT            HVM-v8-noHT             HVM-v8-csc
Amean     commit        7.71 (   0.00%)        7.64 (   0.79%)        7.83 =
(  -1.62%)        7.74 (  -0.44%)        7.68 (   0.28%)
Amean     read          6.96 (   0.00%)        6.88 *   1.12%*        6.97 =
(  -0.12%)        6.97 (  -0.15%)        6.92 *   0.51%*
Amean     wal           0.04 (   0.00%)        0.00 *  94.25%*        0.04 =
*  19.02%*        0.01 *  83.68%*        0.07 * -49.56%*
Stddev    commit        1.55 (   0.00%)        1.69 (  -8.82%)        1.60 =
(  -3.09%)        1.54 (   0.81%)        1.59 (  -2.73%)
Stddev    read          0.61 (   0.00%)        0.81 ( -32.60%)        0.53 =
(  12.82%)        0.55 (   9.68%)        0.68 ( -11.02%)
Stddev    wal           0.05 (   0.00%)        0.02 (  68.16%)        0.05 =
(   3.33%)        0.03 (  47.69%)        0.05 (   5.37%)

HVM-v4
------
                            v-HVM-v4-HT          v-HVM-v4-noHT             =
 HVM-v4-HT            HVM-v4-noHT             HVM-v4-csc
Amean     commit        7.85 (   0.00%)        7.57 (   3.57%)        7.71 =
(   1.77%)        7.67 (   2.33%)        7.82 (   0.38%)
Amean     read          6.92 (   0.00%)        6.83 *   1.26%*        6.90 =
(   0.23%)        6.90 (   0.28%)        6.91 (   0.10%)
Amean     wal           0.05 (   0.00%)        0.05 (  -1.47%)        0.07 =
* -29.63%*        0.05 (   5.48%)        0.04 (  13.85%)
Stddev    commit        1.78 (   0.00%)        1.47 (  17.89%)        1.62 =
(   8.98%)        1.51 (  15.57%)        1.65 (   7.34%)
Stddev    read          0.61 (   0.00%)        0.53 (  13.75%)        0.55 =
(   9.47%)        0.66 (  -8.62%)        0.57 (   7.64%)
Stddev    wal           0.05 (   0.00%)        0.05 (   0.07%)        0.05 =
(   5.86%)        0.05 (  -0.02%)        0.05 (   0.56%)

HVMx2
-----
                          v-HVMx2-v8-HT        v-HVMx2-v8-noHT            H=
VMx2-v8-HT          HVMx2-v8-noHT           HVMx2-v8-csc
Amean     commit        7.86 (   0.00%)        8.16 *  -3.81%*        7.94 =
(  -1.01%)        8.31 *  -5.63%*       10.28 * -30.76%*
Amean     read          7.00 (   0.00%)        7.52 *  -7.32%*        6.98 =
(   0.30%)        7.91 * -12.85%*        9.47 * -35.17%*
Amean     wal           0.00 (   0.00%)        0.00 (  -2.18%)        0.01 =
*-231.22%*        0.07 *-1605.80%*        0.24 *-6035.64%*
Stddev    commit        1.63 (   0.00%)        1.43 (  11.96%)        1.75 =
(  -7.70%)        1.30 (  20.41%)        2.17 ( -33.15%)
Stddev    read          0.62 (   0.00%)        0.69 ( -12.39%)        0.67 =
(  -8.79%)        0.79 ( -27.80%)        2.21 (-257.25%)
Stddev    wal           0.02 (   0.00%)        0.02 ( -16.40%)        0.03 =
( -73.40%)        0.09 (-346.15%)        0.39 (-1907.58%)


NETPERF-UDP
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Dom0
----
                                  v-XEN-HT             v-XEN-noHT          =
       XEN-HT               XEN-noHT                XEN-csc
Hmean     send-64        223.35 (   0.00%)      222.53 (  -0.36%)      220.=
23 *  -1.39%*      220.12 *  -1.44%*      199.70 * -10.59%*
Hmean     send-256       876.26 (   0.00%)      874.65 (  -0.18%)      863.=
81 *  -1.42%*      866.59 (  -1.10%)      791.34 *  -9.69%*
Hmean     send-2048     6575.95 (   0.00%)     6595.97 (   0.30%)     6542.=
13 (  -0.51%)     6568.38 (  -0.12%)     5758.09 * -12.44%*
Hmean     send-8192    20882.75 (   0.00%)    21537.45 *   3.14%*    20999.=
88 (   0.56%)    21163.69 *   1.35%*    19706.48 *  -5.63%*
Hmean     recv-64        223.35 (   0.00%)      222.52 (  -0.37%)      220.=
23 *  -1.39%*      220.08 *  -1.46%*      199.70 * -10.59%*
Hmean     recv-256       876.22 (   0.00%)      874.55 (  -0.19%)      863.=
81 *  -1.42%*      866.47 (  -1.11%)      791.09 *  -9.72%*
Hmean     recv-2048     6575.00 (   0.00%)     6595.64 (   0.31%)     6541.=
22 (  -0.51%)     6566.75 (  -0.13%)     5757.50 * -12.43%*
Hmean     recv-8192    20881.63 (   0.00%)    21534.73 *   3.13%*    20996.=
13 (   0.55%)    21157.86 *   1.32%*    19703.65 *  -5.64%*
Stddev    send-64          1.16 (   0.00%)        1.45 ( -25.00%)        0.=
94 (  19.15%)        1.64 ( -41.40%)       21.30 (-1738.47%)
Stddev    send-256         7.50 (   0.00%)        4.96 (  33.77%)        7.=
71 (  -2.79%)        8.92 ( -18.97%)       63.89 (-752.31%)
Stddev    send-2048       29.58 (   0.00%)       35.06 ( -18.54%)       57.=
84 ( -95.56%)       64.88 (-119.37%)      112.05 (-278.84%)
Stddev    send-8192      106.01 (   0.00%)      199.63 ( -88.31%)      172.=
69 ( -62.90%)      161.66 ( -52.49%)      276.33 (-160.67%)
Stddev    recv-64          1.16 (   0.00%)        1.44 ( -24.28%)        0.=
94 (  19.15%)        1.62 ( -39.82%)       21.30 (-1738.30%)
Stddev    recv-256         7.50 (   0.00%)        4.94 (  34.09%)        7.=
70 (  -2.70%)        9.03 ( -20.39%)       64.08 (-754.67%)
Stddev    recv-2048       28.84 (   0.00%)       34.99 ( -21.34%)       56.=
58 ( -96.20%)       65.80 (-128.14%)      112.00 (-288.34%)
Stddev    recv-8192      105.96 (   0.00%)      201.10 ( -89.80%)      167.=
07 ( -57.68%)      162.03 ( -52.92%)      276.84 (-161.28%)

HVM-v8
------
                               v-HVM-v8-HT          v-HVM-v8-noHT          =
    HVM-v8-HT            HVM-v8-noHT             HVM-v8-csc
Hmean     send-64        496.94 (   0.00%)      447.92 *  -9.86%*      518.=
85 (   4.41%)      487.85 (  -1.83%)      505.10 (   1.64%)
Hmean     send-256      1952.73 (   0.00%)     1720.99 * -11.87%*     1955.=
77 (   0.16%)     1784.00 *  -8.64%*     1931.18 (  -1.10%)
Hmean     send-2048    13443.20 (   0.00%)    12361.56 *  -8.05%*    12849.=
78 (  -4.41%)    13027.81 (  -3.09%)    13485.59 (   0.32%)
Hmean     send-8192    37350.97 (   0.00%)    34440.52 *  -7.79%*    37659.=
20 (   0.83%)    35773.79 *  -4.22%*    35040.88 *  -6.18%*
Hmean     recv-64        495.88 (   0.00%)      447.65 *  -9.73%*      518.=
32 (   4.52%)      487.76 (  -1.64%)      504.86 (   1.81%)
Hmean     recv-256      1951.43 (   0.00%)     1720.97 * -11.81%*     1954.=
42 (   0.15%)     1782.90 *  -8.64%*     1930.33 (  -1.08%)
Hmean     recv-2048    13418.66 (   0.00%)    12358.40 *  -7.90%*    12830.=
91 (  -4.38%)    13018.47 (  -2.98%)    13475.39 (   0.42%)
Hmean     recv-8192    37326.31 (   0.00%)    34420.53 *  -7.78%*    37619.=
84 (   0.79%)    35768.42 *  -4.17%*    35035.40 *  -6.14%*
Stddev    send-64         15.80 (   0.00%)       11.38 (  27.94%)       29.=
69 ( -87.96%)        6.43 (  59.29%)       17.36 (  -9.89%)
Stddev    send-256        18.04 (   0.00%)       17.00 (   5.75%)       64.=
17 (-255.76%)       26.82 ( -48.67%)       33.37 ( -85.02%)
Stddev    send-2048      924.84 (   0.00%)       47.89 (  94.82%)     1342.=
98 ( -45.21%)      246.21 (  73.38%)      353.97 (  61.73%)
Stddev    send-8192      477.71 (   0.00%)      673.42 ( -40.97%)      224.=
20 (  53.07%)      467.40 (   2.16%)      928.70 ( -94.41%)
Stddev    recv-64         16.27 (   0.00%)       11.73 (  27.93%)       29.=
96 ( -84.12%)        6.54 (  59.80%)       17.64 (  -8.43%)
Stddev    recv-256        19.80 (   0.00%)       17.02 (  14.06%)       64.=
29 (-224.73%)       27.28 ( -37.81%)       34.17 ( -72.59%)
Stddev    recv-2048      948.89 (   0.00%)       48.42 (  94.90%)     1353.=
73 ( -42.66%)      251.38 (  73.51%)      368.14 (  61.20%)
Stddev    recv-8192      500.51 (   0.00%)      685.63 ( -36.99%)      206.=
98 (  58.65%)      467.59 (   6.58%)      928.73 ( -85.56%)

HVM-v4
------
                               v-HVM-v4-HT          v-HVM-v4-noHT          =
    HVM-v4-HT            HVM-v4-noHT             HVM-v4-csc
Hmean     send-64        501.41 (   0.00%)      502.90 (   0.30%)      513.=
95 (   2.50%)      511.96 *   2.11%*      458.46 *  -8.57%*
Hmean     send-256      1881.72 (   0.00%)     1898.71 (   0.90%)     1928.=
30 (   2.48%)     1930.57 (   2.60%)     1831.70 (  -2.66%)
Hmean     send-2048    13544.27 (   0.00%)    13626.68 (   0.61%)    13509.=
70 (  -0.26%)    13802.90 (   1.91%)    12739.81 *  -5.94%*
Hmean     send-8192    36486.91 (   0.00%)    36897.96 (   1.13%)    35966.=
73 (  -1.43%)    36086.45 (  -1.10%)    35293.89 (  -3.27%)
Hmean     recv-64        501.13 (   0.00%)      502.67 (   0.31%)      513.=
90 (   2.55%)      511.91 *   2.15%*      458.34 *  -8.54%*
Hmean     recv-256      1880.67 (   0.00%)     1897.95 (   0.92%)     1927.=
94 (   2.51%)     1930.48 (   2.65%)     1831.50 (  -2.61%)
Hmean     recv-2048    13540.53 (   0.00%)    13623.45 (   0.61%)    13506.=
19 (  -0.25%)    13799.61 (   1.91%)    12734.53 *  -5.95%*
Hmean     recv-8192    36462.71 (   0.00%)    36888.91 (   1.17%)    35936.=
42 (  -1.44%)    36069.50 (  -1.08%)    35266.17 (  -3.28%)
Stddev    send-64         11.94 (   0.00%)        7.15 (  40.09%)       12.=
88 (  -7.85%)        3.89 (  67.41%)       16.11 ( -34.93%)
Stddev    send-256        68.31 (   0.00%)       53.85 (  21.17%)       37.=
13 (  45.65%)       19.62 (  71.28%)       30.54 (  55.30%)
Stddev    send-2048      310.13 (   0.00%)      314.36 (  -1.36%)       86.=
00 (  72.27%)      100.64 (  67.55%)      311.99 (  -0.60%)
Stddev    send-8192      443.37 (   0.00%)      260.08 (  41.34%)      926.=
89 (-109.06%)     1088.50 (-145.50%)     2801.65 (-531.89%)
Stddev    recv-64         12.13 (   0.00%)        7.36 (  39.32%)       12.=
93 (  -6.59%)        3.96 (  67.34%)       16.15 ( -33.13%)
Stddev    recv-256        69.46 (   0.00%)       54.17 (  22.01%)       37.=
76 (  45.64%)       19.75 (  71.56%)       30.68 (  55.82%)
Stddev    recv-2048      314.18 (   0.00%)      318.63 (  -1.41%)       88.=
84 (  71.72%)      100.51 (  68.01%)      313.79 (   0.13%)
Stddev    recv-8192      461.94 (   0.00%)      261.06 (  43.49%)      937.=
92 (-103.04%)     1098.48 (-137.80%)     2822.43 (-511.00%)

HVMx2
-----
                             v-HVMx2-v8-HT        v-HVMx2-v8-noHT          =
  HVMx2-v8-HT          HVMx2-v8-noHT           HVMx2-v8-csc
Hmean     send-64        334.22 (   0.00%)      238.90 * -28.52%*      359.=
65 *   7.61%*      251.84 * -24.65%*      348.95 (   4.41%)
Hmean     send-256      1303.20 (   0.00%)      916.12 * -29.70%*     1376.=
16 *   5.60%*      969.58 * -25.60%*     1293.19 (  -0.77%)
Hmean     send-2048     9759.14 (   0.00%)     6606.50 * -32.30%*    10212.=
34 *   4.64%*     6893.41 * -29.36%*     8933.39 *  -8.46%*
Hmean     send-8192    29504.19 (   0.00%)    19067.47 * -35.37%*    30442.=
79 *   3.18%*    18372.42 * -37.73%*    25486.82 * -13.62%*
Hmean     recv-64        333.71 (   0.00%)      217.71 * -34.76%*      359.=
01 *   7.58%*      240.67 * -27.88%*      319.95 *  -4.13%*
Hmean     recv-256      1300.47 (   0.00%)      804.88 * -38.11%*     1372.=
71 *   5.55%*      923.23 * -29.01%*     1206.20 *  -7.25%*
Hmean     recv-2048     9740.73 (   0.00%)     5448.32 * -44.07%*    10185.=
94 *   4.57%*     6258.59 * -35.75%*     8371.03 * -14.06%*
Hmean     recv-8192    29416.78 (   0.00%)    14566.32 * -50.48%*    30272.=
47 *   2.91%*    16888.08 * -42.59%*    22719.70 * -22.77%*
Stddev    send-64          8.65 (   0.00%)        6.86 (  20.73%)        6.=
49 (  25.00%)        7.35 (  14.99%)       18.06 (-108.81%)
Stddev    send-256        35.52 (   0.00%)       10.83 (  69.50%)       29.=
41 (  17.19%)       15.84 (  55.41%)       25.77 (  27.45%)
Stddev    send-2048      167.61 (   0.00%)       42.08 (  74.89%)       97.=
12 (  42.06%)      238.24 ( -42.14%)      276.14 ( -64.75%)
Stddev    send-8192      291.17 (   0.00%)      305.17 (  -4.81%)      680.=
48 (-133.70%)      336.65 ( -15.62%)      482.57 ( -65.73%)
Stddev    recv-64          8.88 (   0.00%)        6.20 (  30.19%)        6.=
80 (  23.42%)        3.56 (  59.90%)        6.62 (  25.41%)
Stddev    recv-256        35.77 (   0.00%)       10.66 (  70.21%)       31.=
00 (  13.35%)       10.11 (  71.74%)       14.94 (  58.23%)
Stddev    recv-2048      169.57 (   0.00%)       52.21 (  69.21%)       99.=
42 (  41.37%)       96.49 (  43.10%)       42.24 (  75.09%)
Stddev    recv-8192      308.98 (   0.00%)      156.60 (  49.32%)      759.=
75 (-145.89%)      108.46 (  64.90%)      745.22 (-141.18%)


NETPERF-TCP
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Dom0
----
                             v-XEN-HT             v-XEN-noHT               =
  XEN-HT               XEN-noHT                XEN-csc
Hmean     64        674.18 (   0.00%)      674.89 (   0.11%)      677.61 ( =
  0.51%)      679.64 (   0.81%)      660.08 (  -2.09%)
Hmean     256      2424.16 (   0.00%)     2426.14 (   0.08%)     2448.40 * =
  1.00%*     2443.24 *   0.79%*     2402.64 (  -0.89%)
Hmean     2048    15114.37 (   0.00%)    15273.97 *   1.06%*    15160.59 ( =
  0.31%)    15372.31 *   1.71%*    14591.20 *  -3.46%*
Hmean     8192    32626.11 (   0.00%)    32895.01 (   0.82%)    32056.40 ( =
 -1.75%)    32473.01 (  -0.47%)    32024.74 (  -1.84%)
Stddev    64          5.99 (   0.00%)        3.90 (  34.89%)        5.93 ( =
  0.98%)        6.01 (  -0.40%)       31.04 (-418.30%)
Stddev    256        12.07 (   0.00%)        8.14 (  32.55%)       15.11 ( =
-25.17%)       18.76 ( -55.37%)       46.90 (-288.51%)
Stddev    2048      106.56 (   0.00%)       35.02 (  67.14%)      180.05 ( =
-68.97%)       86.00 (  19.29%)      339.19 (-218.32%)
Stddev    8192      649.77 (   0.00%)      123.38 (  81.01%)      329.45 ( =
 49.30%)      448.67 (  30.95%)     1120.36 ( -72.42%)

HVM-v8
------
                          v-HVM-v8-HT          v-HVM-v8-noHT              H=
VM-v8-HT            HVM-v8-noHT             HVM-v8-csc
Hmean     64       1682.93 (   0.00%)     1685.11 (   0.13%)     1756.72 * =
  4.38%*     1687.44 (   0.27%)     1644.27 *  -2.30%*
Hmean     256      6203.93 (   0.00%)     6125.84 *  -1.26%*     6335.31 * =
  2.12%*     6142.90 *  -0.98%*     5850.62 *  -5.69%*
Hmean     2048    29253.76 (   0.00%)    28671.53 *  -1.99%*    29738.54 * =
  1.66%*    28871.57 *  -1.31%*    27437.72 *  -6.21%*
Hmean     8192    46374.69 (   0.00%)    45277.03 *  -2.37%*    46926.01 * =
  1.19%*    46011.63 *  -0.78%*    42627.47 *  -8.08%*
Stddev    64         22.20 (   0.00%)       20.70 (   6.78%)       35.93 ( =
-61.82%)       13.81 (  37.79%)       14.56 (  34.43%)
Stddev    256        21.74 (   0.00%)       72.01 (-231.20%)      110.09 (-=
406.36%)       53.63 (-146.70%)      142.11 (-553.63%)
Stddev    2048      286.90 (   0.00%)      147.25 (  48.68%)      172.37 ( =
 39.92%)      189.21 (  34.05%)     1004.81 (-250.23%)
Stddev    8192      259.59 (   0.00%)      232.26 (  10.53%)      453.49 ( =
-74.70%)      239.72 (   7.65%)     1262.32 (-386.28%)

HVM-v4
------
                          v-HVM-v4-HT          v-HVM-v4-noHT              H=
VM-v4-HT            HVM-v4-noHT             HVM-v4-csc
Hmean     64       1685.06 (   0.00%)     1699.80 (   0.87%)     1693.76 ( =
  0.52%)     1681.73 (  -0.20%)     1642.82 *  -2.51%*
Hmean     256      6210.06 (   0.00%)     6134.29 *  -1.22%*     6131.33 * =
 -1.27%*     6141.35 *  -1.11%*     5977.71 *  -3.74%*
Hmean     2048    28890.04 (   0.00%)    28999.17 (   0.38%)    28965.94 ( =
  0.26%)    28931.03 (   0.14%)    27758.99 (  -3.92%)
Hmean     8192    45729.95 (   0.00%)    45801.43 (   0.16%)    45750.33 ( =
  0.04%)    46037.28 *   0.67%*    46301.78 (   1.25%)
Stddev    64         20.94 (   0.00%)       22.24 (  -6.24%)       20.10 ( =
  4.03%)       10.70 (  48.90%)       45.83 (-118.87%)
Stddev    256        26.43 (   0.00%)       51.40 ( -94.47%)       47.00 ( =
-77.85%)       32.37 ( -22.46%)       45.15 ( -70.82%)
Stddev    2048      169.64 (   0.00%)      149.97 (  11.60%)      205.29 ( =
-21.01%)      148.42 (  12.51%)     1950.42 (-1049.71%)
Stddev    8192      227.60 (   0.00%)      116.14 (  48.97%)      515.92 (-=
126.67%)       62.10 (  72.72%)    11909.19 (-5132.40%)
CoeffVar  64          1.24 (   0.00%)        1.31 (  -5.31%)        1.19 ( =
  4.52%)        0.64 (  48.79%)        2.79 (-124.39%)
CoeffVar  256         0.43 (   0.00%)        0.84 ( -96.86%)        0.77 ( =
-80.12%)        0.53 ( -23.83%)        0.76 ( -77.46%)
CoeffVar  2048        0.59 (   0.00%)        0.52 (  11.93%)        0.71 ( =
-20.69%)        0.51 (  12.63%)        7.00 (-1092.17%)
CoeffVar  8192        0.50 (   0.00%)        0.25 (  49.05%)        1.13 (-=
126.56%)        0.13 (  72.90%)       24.76 (-4875.60%)

HVMx2
-----
                        v-HVMx2-v8-HT        v-HVMx2-v8-noHT            HVM=
x2-v8-HT          HVMx2-v8-noHT           HVMx2-v8-csc
Hmean     64       1252.34 (   0.00%)     1020.91 * -18.48%*     1272.66 * =
  1.62%*      996.12 * -20.46%*      968.44 * -22.67%*
Hmean     256      4369.71 (   0.00%)     3680.51 * -15.77%*     4376.58 ( =
  0.16%)     3565.25 * -18.41%*     4088.77 *  -6.43%*
Hmean     2048    23712.23 (   0.00%)    18259.78 * -22.99%*    24077.77 * =
  1.54%*    17496.21 * -26.21%*    21709.20 *  -8.45%*
Hmean     8192    43290.16 (   0.00%)    35700.62 * -17.53%*    43332.46 ( =
  0.10%)    32506.09 * -24.91%*    36700.18 * -15.22%*
Stddev    64         13.74 (   0.00%)        3.98 (  71.03%)       13.14 ( =
  4.38%)        3.25 (  76.32%)      221.08 (-1509.09%)
Stddev    256        40.68 (   0.00%)        5.67 (  86.06%)       38.64 ( =
  5.01%)       43.54 (  -7.02%)      316.66 (-678.40%)
Stddev    2048      304.70 (   0.00%)       62.11 (  79.62%)      202.53 ( =
 33.53%)      117.33 (  61.49%)      208.33 (  31.63%)
Stddev    8192      659.30 (   0.00%)      116.45 (  82.34%)      274.71 ( =
 58.33%)      299.39 (  54.59%)      412.99 (  37.36%)


NETPERF-UNIX
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Dom0
----
                             v-XEN-HT             v-XEN-noHT               =
  XEN-HT               XEN-noHT                XEN-csc
Hmean     64        499.62 (   0.00%)      509.03 *   1.88%*      492.89 ( =
 -1.35%)      485.34 (  -2.86%)      451.13 *  -9.70%*
Hmean     256      1900.97 (   0.00%)     1894.53 (  -0.34%)     1852.77 ( =
 -2.54%)     1835.34 (  -3.45%)     1272.07 * -33.08%*
Hmean     2048     2892.22 (   0.00%)     2906.15 (   0.48%)     2765.65 * =
 -4.38%*     2747.32 *  -5.01%*     3086.19 (   6.71%)
Hmean     8192     3105.85 (   0.00%)     3158.33 *   1.69%*     2996.64 * =
 -3.52%*     2968.85 *  -4.41%*     2731.31 * -12.06%*
Stddev    64          4.49 (   0.00%)        3.39 (  24.38%)       10.64 (-=
137.15%)       20.01 (-345.94%)       25.28 (-463.31%)
Stddev    256        87.54 (   0.00%)       51.32 (  41.37%)       54.63 ( =
 37.59%)       15.13 (  82.72%)      393.61 (-349.64%)
Stddev    2048       35.26 (   0.00%)       33.35 (   5.41%)       18.20 ( =
 48.39%)        9.37 (  73.41%)      946.82 (-2585.23%)
Stddev    8192       21.32 (   0.00%)       32.53 ( -52.60%)       15.74 ( =
 26.15%)       11.30 (  46.98%)      104.54 (-390.43%)

HVM-v8
------
                          v-HVM-v8-HT          v-HVM-v8-noHT              H=
VM-v8-HT            HVM-v8-noHT             HVM-v8-csc
Hmean     64        312.04 (   0.00%)      291.15 (  -6.69%)      275.22 ( =
-11.80%)      288.06 (  -7.68%)      277.23 ( -11.15%)
Hmean     256       853.06 (   0.00%)      929.15 (   8.92%)      977.34 ( =
 14.57%)      877.63 (   2.88%)      761.25 ( -10.76%)
Hmean     2048     5564.16 (   0.00%)     5332.08 (  -4.17%)     4702.72 ( =
-15.48%)     5819.12 (   4.58%)     5531.96 (  -0.58%)
Hmean     8192     6570.41 (   0.00%)     8275.74 *  25.95%*     5962.89 ( =
 -9.25%)     6462.60 (  -1.64%)     5387.48 ( -18.00%)
Stddev    64         35.97 (   0.00%)       34.70 (   3.53%)       48.37 ( =
-34.46%)       46.27 ( -28.62%)       59.79 ( -66.21%)
Stddev    256       143.59 (   0.00%)       68.75 (  52.12%)      123.98 ( =
 13.65%)       48.93 (  65.92%)      163.00 ( -13.52%)
Stddev    2048     1182.43 (   0.00%)      842.67 (  28.73%)     1181.41 ( =
  0.09%)      761.99 (  35.56%)      827.15 (  30.05%)
Stddev    8192     1331.69 (   0.00%)     1099.39 (  17.44%)     1708.12 ( =
-28.27%)     1247.83 (   6.30%)     1065.82 (  19.96%)

HVM-v4
------
                          v-HVM-v4-HT          v-HVM-v4-noHT              H=
VM-v4-HT            HVM-v4-noHT             HVM-v4-csc
Hmean     64        248.93 (   0.00%)      245.55 (  -1.36%)      225.32 ( =
 -9.49%)      239.36 (  -3.84%)      203.05 * -18.43%*
Hmean     256       717.78 (   0.00%)      741.28 (   3.27%)      707.19 ( =
 -1.48%)      782.19 (   8.97%)      751.77 (   4.74%)
Hmean     2048     4658.71 (   0.00%)     5209.89 (  11.83%)     2719.26 * =
-41.63%*     4156.29 ( -10.78%)     3624.27 ( -22.20%)
Hmean     8192     4874.84 (   0.00%)     4483.10 (  -8.04%)     4263.18 ( =
-12.55%)     5724.08 *  17.42%*     3579.16 * -26.58%*
Stddev    64         23.09 (   0.00%)       58.27 (-152.37%)       46.49 (-=
101.39%)       31.12 ( -34.79%)       11.06 (  52.09%)
Stddev    256       104.17 (   0.00%)      133.06 ( -27.73%)      119.32 ( =
-14.54%)      130.87 ( -25.62%)       87.78 (  15.74%)
Stddev    2048      417.11 (   0.00%)      521.74 ( -25.09%)     1030.34 (-=
147.02%)      907.53 (-117.58%)     1715.05 (-311.18%)
Stddev    8192      825.38 (   0.00%)     1426.19 ( -72.79%)      821.15 ( =
  0.51%)      275.68 (  66.60%)     1131.40 ( -37.08%)

HVMx2
-----
                        v-HVMx2-v8-HT        v-HVMx2-v8-noHT            HVM=
x2-v8-HT          HVMx2-v8-noHT           HVMx2-v8-csc
Hmean     64        230.53 (   0.00%)      148.42 * -35.62%*      243.29 ( =
  5.53%)      165.06 * -28.40%*      188.01 * -18.45%*
Hmean     256       790.90 (   0.00%)      482.51 * -38.99%*      711.91 ( =
 -9.99%)      472.92 * -40.21%*      504.46 * -36.22%*
Hmean     2048     3783.93 (   0.00%)     2172.49 * -42.59%*     3163.60 * =
-16.39%*     1955.93 * -48.31%*     2880.11 * -23.89%*
Hmean     8192     4051.12 (   0.00%)     2764.79 * -31.75%*     4277.51 ( =
  5.59%)     2377.98 * -41.30%*     3086.59 * -23.81%*
Stddev    64         26.71 (   0.00%)       15.99 (  40.13%)       21.43 ( =
 19.76%)       19.08 (  28.56%)       29.45 ( -10.26%)
Stddev    256       112.58 (   0.00%)       24.49 (  78.25%)       86.25 ( =
 23.39%)       50.56 (  55.09%)      112.78 (  -0.18%)
Stddev    2048      535.34 (   0.00%)      395.47 (  26.13%)      311.30 ( =
 41.85%)      317.03 (  40.78%)      610.38 ( -14.02%)
Stddev    8192      490.41 (   0.00%)      835.97 ( -70.46%)      208.86 ( =
 57.41%)      314.18 (  35.94%)      580.38 ( -18.35%)

--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-1M+ohW2RqCLPOauDglt2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl0nPDkACgkQFkJ4iaW4
c+7AKBAAsp+lxpnqprd/hHoOeMsJaCPEhrCR1Z8yJx6mmETBZfRl5Q/kkSB4ddzk
VH00kKhi1koYJTRp6TBao8gsiNbxqWCzX90j5saoktQr6zifRW73y59bIgi5zGAS
sYBCdUKvWTigqhJ8eGQ4gmmXInfDtL+qQtpKWL9E/duq+gBBdXq6unIvQpZIs+Lj
5F0vNKoLmwui2QLxScy/KbMnarWxhTPBbehoiPfze22raXToU9efqtrv2vqkrHX0
tWbcdNlnLrVaX4uYF+lsu6m9rINSk5L3RpBEsxWahVffrtdOYCihbQfAPzonNGF3
jUq4J4HMnGZczzeCuyu0qcsOvRvNg55pAJMzDoyGA3H8dwb/ACZELyw0mZOM/uVv
DtgTv8IUwqDgTFogWKttBwa3SJfihepFWEn8ll9xrsxrCDHbGETcQKxzOUNHQoav
Ys3ypTfNtPRkEP7I3VkaC1MFjZTn/zi8qb68K9q67zyXwyQIy0ZlHl+AkXdLvv45
SkPuix6ScXq/q+tRbEFaWpZ4K2WWuSzTvlgrsT54o2JxS2hgNl3nK6jNqbUhYZ1t
GE5/ZuHcxMSFyicbLIuleP9TrWAdPJyz21zR/D4bVsZU40s3V09rGyMpJxASjBwN
GfBVieZJLa5c2YnWo1jfZkwPyxUMI2/cPg43wxKHa24ZY11OdXE=
=9chU
-----END PGP SIGNATURE-----

--=-1M+ohW2RqCLPOauDglt2--


--===============2827901010866463025==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2827901010866463025==--

