Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79515279203
	for <lists+xen-devel@lfdr.de>; Fri, 25 Sep 2020 22:22:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLuE6-0003fp-41; Fri, 25 Sep 2020 20:21:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jc5u=DC=epam.com=prvs=75372f1ac6=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1kLuE4-0003fk-HQ
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 20:21:52 +0000
X-Inumbo-ID: 9d9b8f98-2cdf-4ee3-b4ec-9a6c10e582ae
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d9b8f98-2cdf-4ee3-b4ec-9a6c10e582ae;
 Fri, 25 Sep 2020 20:21:50 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08PKErEF019287; Fri, 25 Sep 2020 20:21:48 GMT
Received: from eur02-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2051.outbound.protection.outlook.com [104.47.6.51])
 by mx0a-0039f301.pphosted.com with ESMTP id 33r71hyu08-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Sep 2020 20:21:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ByCSJjZ1GcgSScPayD59QfNz5jfD/C+TdrEsWuVtJpESCRmJNz2ydbbts3JUzO2G/k79A+s7KbQXz1+Q8W4SR6T/4/D594Bmeh3kxA/9f5Z5BiXiaJghJm8pA/SOIuABJKG+G+pzspovCcd4d2kI1UVq57Co3Ym4qN3RkISmuWCKI2LmxKX8qSYbbj6D5kJhTK9BLEIz/HLmScA6IrXrvMSA8Oj4VixvWgz1haxPGPljUG9Nr+nEFWcW0vWXSDMJtvp1VfM+B54rZ3KKSsO9Z8xExU3CTnJ+bBFEf51CyEYuT4n3+m1ffvSulTtsEmbWbFMMZ3AZIKqNP51gPHmp4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fPIUYITiwM1eftGekOu6gh8Ab/IcbX35K7FKHge+TYQ=;
 b=BaAgu+bDR85sLkfrTB8Hr1MWn154soosrYdr40n2rSXHWO5NGQ3WO7o8ada6qM4bXJza1jUz7OptEyckGYIyWDhxzeX8mYEGCVd0E/VHT4+AinzPZpXkg/oq/icQCioGjGinvIW12dQWC3Fq3145FglXpRv21BcGH0n7oEF3/5o70iWPJUHWcVCLeIugp0/+JtOxK9jwEE26h5092nDwVlTwsz3+FzbHFqyVzYAn0ryzEPLQ+kjAMuRxf/GptEdRZhKnX5XxDUxraexbbMFljXOgyIUVZwJYwnpStOt9rxbgtRmoV8IJwDzlxXJdEiuTnhP+DjQXSBoeGk2Q6rICUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fPIUYITiwM1eftGekOu6gh8Ab/IcbX35K7FKHge+TYQ=;
 b=AhGzxejfQjux2fajsZeeQuYdQPukTmgEzO85VXDQFJ48/0dj41S8HTWZIBXqZWaxv5/UfuBbDBTTbhZQF5fuOVRRl8KDwI7OppXqAiMKiIjbQCLKzXnCuXuqgFYzM6Cxm4IioCaPTqYu9KkbcHaM2vwobcm+JtMBBkZ5m4w9Rc1u2b/uT8yS6wfB0RVSRirbRKqQvVHx23cT3lbPwdIXOiMEUOsnqyZ4DxOFr25Wq/hfWcgNFG5kXpHQhzhaCbp/Mg05KvdlmkZBLmxl4HesXDtgWJuz88He5QjdRjkgFoK9+3tVuqwavACbq4V/LU1Vjof6/hq/LVexZN21iYolfw==
Received: from VI1PR03MB6400.eurprd03.prod.outlook.com (2603:10a6:800:17e::20)
 by VI1PR03MB4669.eurprd03.prod.outlook.com (2603:10a6:803:53::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Fri, 25 Sep
 2020 20:21:45 +0000
Received: from VI1PR03MB6400.eurprd03.prod.outlook.com
 ([fe80::71d4:858b:cc47:7da0]) by VI1PR03MB6400.eurprd03.prod.outlook.com
 ([fe80::71d4:858b:cc47:7da0%4]) with mapi id 15.20.3412.022; Fri, 25 Sep 2020
 20:21:44 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Dario Faggioli <dfaggioli@suse.com>
CC: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>,
 "jbeulich@suse.com" <jbeulich@suse.com>, "wl@xen.org" <wl@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Subject: Re: [RFC PATCH v1 2/6] sched: track time spent in hypervisor tasks
Thread-Topic: [RFC PATCH v1 2/6] sched: track time spent in hypervisor tasks
Thread-Index: AQHWQE+SUtF98x/3akmRxwBff1s+m6jUZ0iAgABx6YCAAALVgICj3sIAgAGFjYCAADIDgA==
Date: Fri, 25 Sep 2020 20:21:44 +0000
Message-ID: <87r1qpa9pk.fsf@epam.com>
References: <20200612002205.174295-1-volodymyr_babchuk@epam.com>
 <20200612002205.174295-3-volodymyr_babchuk@epam.com>
 <a40aac2a-326b-9efa-fed3-49826bb2ff9c@suse.com>
 <daf3aa1c6fa565076755437e7e74347b58e3a9b6.camel@epam.com>
 <918fa2e1-232c-a3ff-d0a9-776b470ee5db@suse.com> <87d02bavz7.fsf@epam.com>
 <66880caef018abdbf9fe99116594a2826efcb603.camel@suse.com>
In-Reply-To: <66880caef018abdbf9fe99116594a2826efcb603.camel@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.10; emacs 27.1
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 25aabcab-262a-410f-8dba-08d861909f55
x-ms-traffictypediagnostic: VI1PR03MB4669:
x-microsoft-antispam-prvs: <VI1PR03MB4669191E2F9BB1932C28A991E6360@VI1PR03MB4669.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5Onq9WvdyD/1nH5lVPyKEra2JTbKR3PaLY96ApTk2V7IOOVbuSPCbTv9ra0NahDXywvPYYhGf5YEvAD5hlQzZ5GMrbuAw8pP+m8aDyNVEOG6nkzuSgWLQxoYXhj/liG8b2HKDIT+JgTU0sRgzB7eG1HSXwSLsoB0B5bzqun1I9KPYatkJ6zxL8EBb288zDWV0LFcPK67goRafW82iRaWE350+30KPqI2j8KZxbkOm8YRKUgiSUcYwekQa9QNyZjHYT1tNPySkD0DjUGOTVf4ugCNERAZ9mtiIAnpXEjQkLv6UJdHFOr20ayBV+gAm7fvAdixc2a22P18pIpP+qtuAmZsobh6X/PmBAzKTNabszDMxSxjk93YraQmD+vV8vmr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB6400.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(136003)(366004)(39860400002)(55236004)(316002)(6506007)(478600001)(186003)(86362001)(6916009)(6486002)(2906002)(54906003)(71200400001)(26005)(64756008)(76116006)(7416002)(83380400001)(8676002)(4326008)(5660300002)(2616005)(66556008)(66446008)(6512007)(66476007)(36756003)(8936002)(91956017)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: E3q5wTYfWbSgx2NumDRGNWigNJHceYSCevbRiEwZDY7fsp0C5JUpgVIElm3dLVgnpXAFIy+ZjjqUPs5epD+Mx8xLWLuHxRS4cOT4pNgXRjjDkVxVkiFZKG23Xwed4SQhfsHy8hv7tUSY8glAoAdHilLlOum2S0hFU/jKdqHGM3mlDlUWlHiwH6U5uqT5NK5o5L59A6qxXPgogSbyLuRGUB1A+LIwD8wq6itcjQT8Le/qraXBOOpceS8TLwVffIDoCnKwBypQ7JAeb/ieyLC2y18RCUP5Noi7P8fKQzu9J4l/o0k4Ys3To9gvbxjU73Sic5ctw5hckwRAb2e2q1v5DqthOXZ3z/rf2hBp/NVWKhSYw49v0ou5vTGbmU4q4GE7PQ2lf2lsUk9nNk8W4cT87e5kOs3gfoB8CZeUZj64teK/sJPHrG6ixaMtCB+4NbAlNTB5pdZxVTwiKocR1EiFMhVPJk6BVNsf8m2MffnWvl5y3A8HRsSdvm7CMk+yjK46+vFBsfshw3btwiI/6XW19kkR+Rc85QLsz9BkC/5yURBnBExYhOBYhdxG3ZMex2lNjJuIr8nouSdEuGkl2+UkIkB90tNiDmMlyyBkX45CajSOpMP+KoO1xODgCh7NLJxAxMVnw2JRis8s+qVLXkqCsA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB6400.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25aabcab-262a-410f-8dba-08d861909f55
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2020 20:21:44.7561 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B/soiSxE00vK1qkvSduQXP7zXU5ZHoK1wClDXY/4YLI8lljcifCCSikvn9J+yxSdQKDoCouD8RyrmQ3hXqtj22yY1g+2A+3T9J+Gt/xCvpQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB4669
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-25_17:2020-09-24,
 2020-09-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 adultscore=0 mlxlogscore=980 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009250144
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


Hi Dario,


Dario Faggioli writes:

> On Thu, 2020-09-24 at 18:08 +0000, Volodymyr Babchuk wrote:
>> So, as I see this, functions are called in the following way (on
>> x86):
>>=20
>> 1. do_softirq() calls vcpu_begin_hyp_task() and then executes
>> __do_softirq()
>>=20
>> 2. __do_softirq() does different jobs and eventually calls schedule()
>>=20
>> 3. schedule() calls vcpu_end_hyp_task() and makes scheduling decision
>> which leads to call to context_switch()
>>=20
>> 4. On end context_switch() we will exit hypervisor and enter VM. At
>> least, this is how I understand
>>=20
>>        nextd->arch.ctxt_switch->tail(next);
>>=20
>> call.
>>=20
>> So, no need to call vcpu_begin_hyp_task() in context_switch() for
>> x86.
>>=20
> Mmm... This looks correct to me too.
>
> And what about the cases where schedule() does return?

Can it return on x86? I want to test this case, but how force it? Null
scheduler, perhaps?

> Are these also fine because they're handled within __do_softirq()
> (i.e., without actually going back to do_softirq() and hence never
> calling end_hyp_task() for a second time)?

I afraid, that there will be a bug. schedule() calls end_hyp_task(), and
if it will eventually return from __do_softirq() to do_softirq(),
end_hyp_task() will be called twice.

>
>> I have put bunch of ASSERTs to ensure that vcpu_begin_hyp_task() or
>> vcpu_end_hyp_task() are not called twice and that vcpu_end_hyp_task()
>> is
>> called after vcpu_begin_hyp_task(). Those asserts are not failing, so
>> I
>> assume that I did all this in the right way :)
>>=20
> Yeah, good to know. :-)
>
> Are you doing these tests with both core-scheduling disabled and
> enabled?

Good question. On x86 I am running Xen in QEMU. With -smp=3D2 it sees two
CPUs:

(XEN) Brought up 2 CPUs
(XEN) Scheduling granularity: cpu, 1 CPU per sched-resource

You are right, I need to try other variants of scheduling granularity.

Do you by any chance know how to emulate more complex setup in QEMU?
Also, what is the preferred way to test/debug Xen on x86?

--=20
Volodymyr Babchuk at EPAM=

