Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 058B354FE76
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jun 2022 22:40:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.351570.578243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2IkV-0002Zm-41; Fri, 17 Jun 2022 20:39:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 351570.578243; Fri, 17 Jun 2022 20:39:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2IkV-0002Xg-0G; Fri, 17 Jun 2022 20:39:23 +0000
Received: by outflank-mailman (input) for mailman id 351570;
 Fri, 17 Jun 2022 20:39:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JiXX=WY=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1o2IkT-0002Xa-Mf
 for xen-devel@lists.xenproject.org; Fri, 17 Jun 2022 20:39:22 +0000
Received: from sonic317-20.consmr.mail.gq1.yahoo.com
 (sonic317-20.consmr.mail.gq1.yahoo.com [98.137.66.146])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8dd9e7b6-ee7d-11ec-b725-ed86ccbb4733;
 Fri, 17 Jun 2022 22:39:18 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic317.consmr.mail.gq1.yahoo.com with HTTP; Fri, 17 Jun 2022 20:39:15 +0000
Received: by hermes--canary-production-bf1-8bb76d6cf-cdgdn (Yahoo Inc. Hermes
 SMTP Server) with ESMTPA ID da0b3df65b30f311b738c9ef19c10b95; 
 Fri, 17 Jun 2022 20:39:12 +0000 (UTC)
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
X-Inumbo-ID: 8dd9e7b6-ee7d-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1655498355; bh=rpIu/ci3eeyDIgBM0G1EcULgjyumv2YVl8OTfqaLwtc=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=XvWzLNYrbCQI37VPGreA9eO3psuargN16FA+mZwcnrZImep4U9tV2kv7NRxJVKEuo1Kxvd5LU7OBZ/fBX+UBfLbI94lDGf645d+a0TiaBR57UCkIehSi8XgvjBVITJUfWPbXJ/U65FND62BaKJ8f/Ccv7Vq5/wje9RdPRmelRuxbseaJCf2fkQhdRFSjICMoBlnj6C29M8UDTTTKcaNVVKcEPGuZpbYslSl4nkoQ31Mun7OZNbp/E3uP7tTdRtj3r/IHMlt14fbOk3/ppNpY/2HVzI+9CeO2AbGALhQJx0+24vDG99utf50Mw3ffcWOR9zCEo+8dlxhoE2M84zwq8g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1655498355; bh=NfOaH88yQj52FHpR1I4wUzavux55HfNzXePk9vQSWI6=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=CSfHMBLBFPdyVHvc9W03Lf3g5iLVgFzJpzMzRuLMgn8ameqvoXpouXtlE6fayYiMhurTdfVxZY6ZjTkcQIBfomgg6DLeaHHob4Qq4lkBfyJu/Nr1qRsywahSaHPa4pmEYOkpQQDpBXkrt/rge1NlKpXkvG1vo/rZfR4ozFl9fabNYJRAd/XtdLZRNnUwtlBGE2xbBXQY5yb6Z81tmHgBYL4YKlUryP5Fceo79UGXJ6PYcXPamST80zbz549rI4G0ly4/4YHRFxbMPzGhpOQyK+bX+Rp72YlkWQ0g7B/ffMlb2NxReOUO/LOD51aQb/jTc0i17D6yFzHVNV2xKecnAQ==
X-YMail-OSG: nlvO3rcVM1mn74oyZahPB0uBfU.777Rf5bWI53_mT7Rd6_jUS.GG8i0FEUJaZR5
 EX3wA43O2POI.fH45CuVE0zYQik5ZRtd5S2SAjDBugNkkc9Ph5zry3d38ppPagRsL9PpyJmoXiy6
 KuPjFT2g1mBbpvBafmlMbYqFFbFEC7W17Rds734FdlMG1V9myiy5mfMKGV8uhyK1h6DJUHc3jgW2
 UcUmY9yDaUq6N0ajB5EkfQUN1xpi8Q0xZ1jSUpaJGoZnN5ZbodsGzVnmAomKP9UbS5nakP.DoNNC
 ETyb9Z6Ur2gw2HDs.rB7eoELsinkqGmiq9.5Fjm5uCYAkgzUXmk0rL5SNvO4ICelX.4lGZp2_LOd
 6PDn3QwpwWuoeutS.i6UKkV_wms62TIMmnTvV0q46D4661DSr9v3ukTBMjkWzosQrC0epRtyNrKR
 vGGGouKvr7FChhns8qcMg3RLrep_qIgCAWf7EWN3mnjaF8ZPUBG3NkkWvJj6g_l8V4xkMfIWVQfC
 _ZcCpXk7UF4bk1W6jdeIUqQDidUAwWLNkquP6uavT90DZs1e5WTbo5guDz7REaFL5YTn0NyRgwud
 k46AAh2PRmvEhxtJ59it1g6M5x_qFCzjuZt5WZ2AECfvUsNtQGeMSvcOFtA79DuAWA_EfjFI0QXd
 pj7xZ8HkPzX5mut4I2Qg3psF.zUJT_GZykSJEwTO4vrDtCyefJNyDQW83b.C_sz1itS9_MZtwQjv
 OazqkaUW8KiCaugodvPu8zMDlPzfx7WYhUSzARNPjuscJCx37m9AjkJ67mW3bdaJRu33SmpZ11yB
 DouxeGFd1liXct7mZvkCMndDN6JuS02gqwJv0W2ntJdB7oIXAiSZlGwxvJvEQ1L5Y92DjVgzyMLN
 E2MuC9QMM_u8j4a9e6FrSVyL04njNEesoaLjPyv73sEjKRUrPHp7o_79nqKPj77KPb5HPO7mB_iT
 AjcgpMDfANZRSGVeWbNK2ntZBeQxJdttwWVNaHgsCIizKkB1A8fhMVwE8c480HwyhUo.w5uNHneE
 0p5i6C_SDLJOA9.t4AleY4BhusERYVRvpuUo0P5Ri43GweeN7G7yob1divEruUceG6a7HrridseX
 nZPZx8HBbHh7ewTpPScF5qKrsrtWjWa2EQuEslf2SVv5iwd_lgldvYHBo3izaoBneUHi_56SA5VU
 npI74aMUkfntJyaqYgCBT1IsmEweTP62Uok.aVr1KBRkoDRBs84TCGU8s8grWcNMmn48gOJ2FHPH
 Td1JwjBhUhEHF2iUhheba4SLjb7hZ6WfK4S1yka9ZByp5h2016uhfPmtMYR70SSE9nN.qDq90AEa
 Riw3KuM_QXzyGgdADPCuZclK1dhFlvFPPzwBoZpS9UzmVILSX0APLG6eUSUIMuPB8AuI42aJA8MX
 zwLyxtH4TYa5DfbKw7NwkD.a_rjQsR3bs_.BxZ2IniLxlFB9se.98h9hSgXv1dGrti_QmWF.4fLg
 Vm0_it8yAn4fveiJC7evEoJN4eGjeWJxmtKn9Iu0HbrzJxABlKNyOgwAtb4yR8wtU9azKtLYZUph
 4LGrJaQ_CBNT9SLpF2MVEAS.HAOj4rGX94DgrSY.7QZ1fp29.orwkhgwU4RhnEx8jPnHU7r9CY61
 3kVbA2XvrSGe5GFiBFntL5h5dGZ4zcq1egEgd6XqzV2SrPin0TINv6EvyMkGZbLttLtmexobtxX0
 2Ta.exA.mASmLE6aFhT5JLpiTSjyHGcnCGpUtUqvRd8Oe_bb9fGJXys5tTlzwiSdSSxsdD4sTPv0
 i0SU.8TAPmQCXM7kwKo3zvrkoiUEJfgOHybkfY995t1T8TZxsY2OHUQKDdfmFXBvmuTmwXw_g9v0
 _k3vON36cZsUejrjAlGUbwptc8TVwvcY_i5ZdKDdVSovMBNY6ocCDpLcwq2JxeGoMZYMy2XCmh2Y
 f_rBfeRPkliFF7qzd0tJXq80WcFSVGx3vRiJD3rB9dHxS0pS5TQ5UIpNMxDdy6Fo98IcUarEgfWo
 8JKz4H3vqHyxouz2MMaxytUlg1yA31uwsT_5.PEsD0AGKMXZ0zh8IAxlN7caJ7jHNGcVPI.ysBsH
 fGwjQfH_hkpT2nosZ5uMcAPujI78tOdFDBnJJPp8Pwt6V_8wBbeO5gElF7KQdJCRWkJ0GFS_D5WB
 Eyqiug6TTEw0tZ9RJ6mqkTVTtPV0taw8k5hWBIpkjoCgHpRvXJm8Udsns_EBaRbYhCoiVi3M3k.6
 FmSfAVM3PvlV6f3JMHxsd2bY-
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <7be7002d-8a6e-b6fb-f926-b8b4cdb0c404@netscape.net>
Date: Fri, 17 Jun 2022 16:39:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [XEN PATCH] tools/libs/light/libxl_pci.c: explicitly grant access
 to Intel IGD opregion
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Jason Andryuk <jandryuk@gmail.com>, Andrew Cooper <amc96@srcf.net>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
References: <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz.ref@netscape.net>
 <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz@netscape.net>
 <YkSQIoYhomhNKpYR@perard.uk.xensource.com>
 <408e5e07-453c-f377-a5b0-c421d002aec5@srcf.net>
 <46a8585e-2a2a-4d12-f221-e57bd157dec6@netscape.net>
 <CAKf6xpths4SX4wq-j4VhnXZnx0DW=468z3=9FYHso=Wy1i_Rsg@mail.gmail.com>
 <da62d06d-fd18-a313-9e69-2a4581e97c1a@netscape.net>
 <CAKf6xptZ9g79MphwYPAGq6ATBtCrW+pCd5+NYJPdFniW+tFzPg@mail.gmail.com>
 <ea5c1606-04d3-c847-643e-d242d8f6ba06@netscape.net>
 <YqyFoPJ8Bv9EnO5N@perard.uk.xensource.com>
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <YqyFoPJ8Bv9EnO5N@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.20280 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 6/17/22 9:46 AM, Anthony PERARD wrote:
> On Thu, Mar 31, 2022 at 03:44:33PM -0400, Chuck Zmudzinski wrote:
>> On 3/31/22 10:19 AM, Jason Andryuk wrote:
>>> On Thu, Mar 31, 2022 at 10:05 AM Chuck Zmudzinski <brchuckz@netscape.net> wrote:
>>>> That still doesn't answer my question - will the Qemu upstream
>>>> accept the patches that move the hypercalls to the toolstack? If
>>>> not, we have to live with what we have now, which is that the
>>>> hypercalls are done in Qemu.
>>> [...]
>> I know of another reason to check the Qemu upstream version,
>> and that is dealing with deprecated / removed device model
>> options that xl.cfg still uses. I looked at that a few years ago
>> with regard to the deprecated 'usbdevice tablet' Qemu option,
>> but I did not see anything in libxl to distinguish Qemu versions
>> except for upstream vs. traditional. AFAICT, detecting traditional
>> vs. upstream Qemu depends solely on the device_model_version
>> xl.cfg setting. So it might be useful for libxl to add the capability
>> to detect the upstream Qemu version or at least create an xl.cfg
>> setting to inform libxl about the Qemu version.
> Hi,
>
> There's already some code to deal with QEMU's version (QEMU = upstream
> Qemu) in libxl, but this code is dealing with an already running QEMU.
> When libxl interact with QEMU through QMP, to setup some more devices,
> QEMU also advertise it's version, which we can use on follow up qmp
> commands.
>
> I think adding passthrough pci devices is all done via QMP, so we can
> potentially move an hypercall from QEMU to libxl, and tell libxl that
> depending on which version of QEMU is talking to, it needs or not do the
> hypercall. Also, we could probably add a parameter so that QEMU know if
> it have to do the hypercall or not, and thus newer version of QEMU could
> also deal with older version of libxl.
>
> (There's maybe some example like that in both QEMU and libxl, when doing
> live migration, dm_state_save_to_fdset() in libxl as a pointer)
>
> Cheers,
>

Hi Anthony,

Thanks for this information, it is useful because I plan to work on
improved Xen / Qemu interactions to better support features
such as running the device model in a stub domain, in which case
it is probably better to do some hypercalls in libxl or maybe in
hvmloader that are currently done in Qemu.

I also would like to see Xen HVM using Q35 instead of i440fx
emulation which also requires improved Xen / Qemu interactions.
I know of the patch set for Q35 emulation that was proposed back
in 2018, but I have not tried anything like that yet. That looks like
a complex problem. Has there been any more recent work in that
area? I couldn't find much recent work on that by searching the
Internet. I have quite a bit to learn before I can make contributions
to support Q35 as a replacement for i440fx, but I plan to slowly
work on it. Any suggestions anyone has are welcome.

Best Regards,

Chuck

