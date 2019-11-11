Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD1AF790A
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2019 17:43:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUCip-0004jH-2V; Mon, 11 Nov 2019 16:39:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=88TC=ZD=gmail.com=aleksandar.m.mail@srs-us1.protection.inumbo.net>)
 id 1iUCgc-0004gA-LA
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2019 16:37:06 +0000
X-Inumbo-ID: 7e64983e-04a1-11ea-984a-bc764e2007e4
Received: from mail-oi1-x235.google.com (unknown [2607:f8b0:4864:20::235])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e64983e-04a1-11ea-984a-bc764e2007e4;
 Mon, 11 Nov 2019 16:37:04 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id a14so12030089oid.5
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2019 08:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=JYP7NG+HYTf3HXLqxjKEJMatac/ljNXPWh3jd9LTM+s=;
 b=M3WZTQberArhSLibbkTNNgKV1JuporTY+QUt37lswJrfwjI7GLilaN9ngG/KG4atf3
 NPKNkOy+Jtf96KGZig2awVEkQbrQO/dJYWkiVrB6CCL8TWrr1pLDNWrc55xAy5LwgxUu
 Lo+9E11MyVWK4YaQqKStQ/V9PMey2O0QG1F3Rx691sBnOClmcNmjOKmDhJiRk5W2GbhA
 XRLFQVpcjLoRkSutIesDNf1E1i2FF/3Zz8KpTEpDZnAbFt8KZbVX3U/XdHUmscdzAhDp
 YrqxT1S66Snn08rCnQMU/GfDRLn7gG8HKP2+obZpCU3EfaZT3hdP7x9gEo81O9FMm2kP
 VI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=JYP7NG+HYTf3HXLqxjKEJMatac/ljNXPWh3jd9LTM+s=;
 b=FxY4DJKwgo5gvxJ60eYzN0doCAzQbE12EReZvr/JG9Hj6mGrJRhu8tXIDvp5jtuGSq
 EJIhUHKNDBsspNU+lLj5eLV0dPOaBKTDjDSDB43vrlSMZzXej9Fo6099q9sfNz86Ox8D
 UC308zuCoU5Px/O37yC+EOWwYgTIjfZzyxu6dMt5slsbAFcrrb5tc9Xzjh9O2u3xS0Px
 RE4cH+HVnaWqMaoEl042kLcwl7Okt1hTS56lFBLEDOJwBq0nN9gvEa3rBf9OjFhT5e4Y
 wykQqLEa+Fr9ZJPWdl1wKSNYB5fXJue6cZLH2ZjjYEIIZx9RW/Tsk84aYVMgm+w9fpiI
 0KUg==
X-Gm-Message-State: APjAAAWckV7xPT6kQacpXk4D5rNqeoTkyvFPm1E9p9msQDhAREtY1ZCS
 w0A9ldcDI9GA10uaMF/z78EMw6mtktQdZzPCnEI=
X-Google-Smtp-Source: APXvYqzwWkjo6MpSd5dKItKEywGny0MgHFezLC9HzOf+HCav8E/RoESiXrkyT+AkzIKihgmhqiVLLM3OwTkCjsKR1Vg=
X-Received: by 2002:aca:d17:: with SMTP id 23mr1301748oin.136.1573490224084;
 Mon, 11 Nov 2019 08:37:04 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6830:1391:0:0:0:0 with HTTP; Mon, 11 Nov 2019 08:37:03
 -0800 (PST)
In-Reply-To: <20191011160552.22907-27-vsementsov@virtuozzo.com>
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
 <20191011160552.22907-27-vsementsov@virtuozzo.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Mon, 11 Nov 2019 17:37:03 +0100
Message-ID: <CAL1e-=hEk9=xGkoCsCUpcYhA+iJexja1E_4WpTKHvqa6W3nhKw@mail.gmail.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
X-Mailman-Approved-At: Mon, 11 Nov 2019 16:39:21 +0000
Subject: Re: [Xen-devel] [RFC v5 026/126] python: add commit-per-subsystem.py
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
Cc: Ronnie Sahlberg <ronniesahlberg@gmail.com>, Jeff Cody <codyprime@gmail.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Alberto Garcia <berto@igalia.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Laszlo Ersek <lersek@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Peter Lieven <pl@kamp.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Chris Wulff <crwulff@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Michael Walle <michael@walle.cc>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Igor Mammedov <imammedo@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 "sheepdog@lists.wpkg.org" <sheepdog@lists.wpkg.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Palmer Dabbelt <palmer@sifive.com>, Eric Farman <farman@linux.ibm.com>,
 Max Filippov <jcmvbkbc@gmail.com>, "Denis V. Lunev" <den@openvz.org>,
 Hannes Reinecke <hare@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Liu Yuan <namei.unix@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Amit Shah <amit@kernel.org>, Stefan Weil <sw@weilnetz.de>,
 Greg Kurz <groug@kaod.org>, Yuval Shaia <yuval.shaia@oracle.com>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Stafford Horne <shorne@gmail.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <pburton@wavecomp.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Paul Durrant <paul@xen.org>,
 Anthony Green <green@moxielogic.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Ari Sundholm <ari@tuxera.com>,
 Juan Quintela <quintela@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Jason Dillaman <dillaman@redhat.com>, Antony Pavlov <antonynpavlov@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "integration@gluster.org" <integration@gluster.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, Max Reitz <mreitz@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Vincenzo Maffione <v.maffione@gmail.com>, Marek Vasut <marex@denx.de>,
 "armbru@redhat.com" <armbru@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>, Luigi Rizzo <rizzo@iet.unipi.it>,
 David Gibson <david@gibson.dropbear.id.au>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Pierre Morel <pmorel@linux.ibm.com>, Wen Congyang <wencongyang2@huawei.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Content-Type: multipart/mixed; boundary="===============2461813351070637236=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============2461813351070637236==
Content-Type: multipart/alternative; boundary="000000000000dd3eff059714bd30"

--000000000000dd3eff059714bd30
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Friday, October 11, 2019, Vladimir Sementsov-Ogievskiy <
vsementsov@virtuozzo.com> wrote:

> Add script to automatically commit tree-wide changes per-subsystem.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---


Great idea!

Can you just add a comment somewhere close to the top of the file on script
usage? Or "--help" option? If you would like to be the script maintainer,
please change the MAINTAINERS too.

Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>


>
> CC: Gerd Hoffmann <kraxel@redhat.com>
> CC: "Gonglei (Arei)" <arei.gonglei@huawei.com>
> CC: Eduardo Habkost <ehabkost@redhat.com>
> CC: Igor Mammedov <imammedo@redhat.com>
> CC: Laurent Vivier <lvivier@redhat.com>
> CC: Amit Shah <amit@kernel.org>
> CC: Kevin Wolf <kwolf@redhat.com>
> CC: Max Reitz <mreitz@redhat.com>
> CC: John Snow <jsnow@redhat.com>
> CC: Ari Sundholm <ari@tuxera.com>
> CC: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
> CC: Paolo Bonzini <pbonzini@redhat.com>
> CC: Stefan Hajnoczi <stefanha@redhat.com>
> CC: Fam Zheng <fam@euphon.net>
> CC: Stefan Weil <sw@weilnetz.de>
> CC: Ronnie Sahlberg <ronniesahlberg@gmail.com>
> CC: Peter Lieven <pl@kamp.de>
> CC: Eric Blake <eblake@redhat.com>
> CC: "Denis V. Lunev" <den@openvz.org>
> CC: Markus Armbruster <armbru@redhat.com>
> CC: Alberto Garcia <berto@igalia.com>
> CC: Jason Dillaman <dillaman@redhat.com>
> CC: Wen Congyang <wencongyang2@huawei.com>
> CC: Xie Changlong <xiechanglong.d@gmail.com>
> CC: Liu Yuan <namei.unix@gmail.com>
> CC: "Richard W.M. Jones" <rjones@redhat.com>
> CC: Jeff Cody <codyprime@gmail.com>
> CC: "Marc-Andr=C3=A9 Lureau" <marcandre.lureau@redhat.com>
> CC: "Daniel P. Berrang=C3=A9" <berrange@redhat.com>
> CC: Richard Henderson <rth@twiddle.net>
> CC: Greg Kurz <groug@kaod.org>
> CC: "Michael S. Tsirkin" <mst@redhat.com>
> CC: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> CC: Beniamino Galvani <b.galvani@gmail.com>
> CC: Peter Maydell <peter.maydell@linaro.org>
> CC: "C=C3=A9dric Le Goater" <clg@kaod.org>
> CC: Andrew Jeffery <andrew@aj.id.au>
> CC: Joel Stanley <joel@jms.id.au>
> CC: Andrew Baumann <Andrew.Baumann@microsoft.com>
> CC: "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com>
> CC: Antony Pavlov <antonynpavlov@gmail.com>
> CC: Jean-Christophe Dubois <jcd@tribudubois.net>
> CC: Peter Chubb <peter.chubb@nicta.com.au>
> CC: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> CC: Eric Auger <eric.auger@redhat.com>
> CC: Alistair Francis <alistair@alistair23.me>
> CC: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Anthony Perard <anthony.perard@citrix.com>
> CC: Paul Durrant <paul@xen.org>
> CC: Paul Burton <pburton@wavecomp.com>
> CC: Aleksandar Rikalo <arikalo@wavecomp.com>
> CC: Chris Wulff <crwulff@gmail.com>
> CC: Marek Vasut <marex@denx.de>
> CC: David Gibson <david@gibson.dropbear.id.au>
> CC: Cornelia Huck <cohuck@redhat.com>
> CC: Halil Pasic <pasic@linux.ibm.com>
> CC: Christian Borntraeger <borntraeger@de.ibm.com>
> CC: "Herv=C3=A9 Poussineau" <hpoussin@reactos.org>
> CC: Xiao Guangrong <xiaoguangrong.eric@gmail.com>
> CC: Aurelien Jarno <aurelien@aurel32.net>
> CC: Aleksandar Markovic <amarkovic@wavecomp.com>
> CC: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> CC: Jason Wang <jasowang@redhat.com>
> CC: Laszlo Ersek <lersek@redhat.com>
> CC: Yuval Shaia <yuval.shaia@oracle.com>
> CC: Palmer Dabbelt <palmer@sifive.com>
> CC: Sagar Karandikar <sagark@eecs.berkeley.edu>
> CC: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> CC: David Hildenbrand <david@redhat.com>
> CC: Thomas Huth <thuth@redhat.com>
> CC: Eric Farman <farman@linux.ibm.com>
> CC: Matthew Rosato <mjrosato@linux.ibm.com>
> CC: Hannes Reinecke <hare@suse.com>
> CC: Michael Walle <michael@walle.cc>
> CC: Artyom Tarasenko <atar4qemu@gmail.com>
> CC: Stefan Berger <stefanb@linux.ibm.com>
> CC: Samuel Thibault <samuel.thibault@ens-lyon.org>
> CC: Alex Williamson <alex.williamson@redhat.com>
> CC: Tony Krowiak <akrowiak@linux.ibm.com>
> CC: Pierre Morel <pmorel@linux.ibm.com>
> CC: Michael Roth <mdroth@linux.vnet.ibm.com>
> CC: Hailiang Zhang <zhang.zhanghailiang@huawei.com>
> CC: Juan Quintela <quintela@redhat.com>
> CC: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> CC: Luigi Rizzo <rizzo@iet.unipi.it>
> CC: Giuseppe Lettieri <g.lettieri@iet.unipi.it>
> CC: Vincenzo Maffione <v.maffione@gmail.com>
> CC: Jan Kiszka <jan.kiszka@siemens.com>
> CC: Anthony Green <green@moxielogic.com>
> CC: Stafford Horne <shorne@gmail.com>
> CC: Guan Xuetao <gxt@mprc.pku.edu.cn>
> CC: Max Filippov <jcmvbkbc@gmail.com>
> CC: qemu-block@nongnu.org
> CC: integration@gluster.org
> CC: sheepdog@lists.wpkg.org
> CC: qemu-arm@nongnu.org
> CC: xen-devel@lists.xenproject.org
> CC: qemu-ppc@nongnu.org
> CC: qemu-s390x@nongnu.org
> CC: qemu-riscv@nongnu.org
>
>  python/commit-per-subsystem.py | 204 +++++++++++++++++++++++++++++++++
>  1 file changed, 204 insertions(+)
>  create mode 100755 python/commit-per-subsystem.py
>
> diff --git a/python/commit-per-subsystem.py b/python/commit-per-subsystem=
.
> py
> new file mode 100755
> index 0000000000..2ccf84cb15
> --- /dev/null
> +++ b/python/commit-per-subsystem.py
> @@ -0,0 +1,204 @@
> +#!/usr/bin/env python3
> +#
> +# Copyright (c) 2019 Virtuozzo International GmbH
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License as published by
> +# the Free Software Foundation; either version 2 of the License, or
> +# (at your option) any later version.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License
> +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
> +#
> +
> +import subprocess
> +import sys
> +import os
> +import glob
> +
> +
> +def git_add(pattern):
> +    subprocess.run(['git', 'add', pattern])
> +
> +
> +def git_commit(msg):
> +    subprocess.run(['git', 'commit', '-m', msg], capture_output=3DTrue)
> +
> +
> +def git_changed_files():
> +    ret =3D subprocess.check_output(['git', 'diff', '--name-only'],
> encoding=3D'utf-8').split('\n')
> +    if ret[-1] =3D=3D '':
> +        del ret[-1]
> +    return ret
> +
> +
> +maintainers =3D sys.argv[1]
> +message =3D sys.argv[2].strip()
> +
> +subsystem =3D None
> +
> +remap =3D {
> +    'Block layer core': 'block',
> +    'Block Jobs': 'block',
> +    'Dirty Bitmaps': 'block',
> +    'Block QAPI, monitor, command line': 'block',
> +    'Block I/O path': 'block',
> +    'Throttling infrastructure': 'block',
> +    'Architecture support': 's390x',
> +    'Guest CPU Cores (KVM)': 'kvm',
> +    'Guest CPU Cores (Xen)': 'xen',
> +    'Guest CPU cores (TCG)': 'tcg',
> +    'Network Block Device (NBD)': 'nbd',
> +    'Parallel NOR Flash devices': 'pflash',
> +    'Firmware configuration (fw_cfg)': 'fw_cfg',
> +    'Block SCSI subsystem': 'scsi',
> +    'Network device backends': 'net',
> +    'Netmap network backend': 'net',
> +    'Host Memory Backends': 'hostmem',
> +    'Cryptodev Backends': 'cryptodev',
> +    'QEMU Guest Agent': 'qga',
> +    'COLO Framework': 'colo',
> +    'Command line option argument parsing': 'cmdline',
> +    'Character device backends': 'chardev'
> +}
> +
> +
> +class Maintainers:
> +    def add(self, subsystem, path, mapper, mapper_name, glob_count=3D1):
> +        if subsystem in remap:
> +            subsystem =3D remap[subsystem]
> +        if subsystem not in self.subsystems:
> +            self.subsystems.append(subsystem)
> +
> +        if path[-1] =3D=3D '/':
> +            path =3D path[:-1]
> +
> +        if path in mapper:
> +            if mapper[path][1] =3D=3D glob_count:
> +                print('Warning: "{}" both in "{}" and "{}" in {} mapper
> with '
> +                      'same glob-count=3D{}. {} ignored for this
> path.'.format(
> +                        path, mapper[path][0], subsystem, mapper_name,
> glob_count,
> +                          subsystem))
> +                return
> +            if mapper[path][1] < glob_count:
> +                # silently ignore worse match
> +                return
> +
> +        mapper[path] =3D (subsystem, glob_count)
> +
> +    def __init__(self, file_name):
> +        self.map_file =3D {}
> +        self.map_glob_file =3D {}
> +        self.map_dir =3D {}
> +        self.map_glob_dir =3D {}
> +        self.map_unmaintained_dir =3D {
> +            'python': ('python', 1),
> +            'hw/misc': ('misc', 1)
> +        }
> +        self.subsystems =3D ['python', 'misc']
> +        subsystem =3D None
> +
> +        with open(file_name) as f:
> +            mode2 =3D False
> +            prevline =3D ''
> +            for line in f:
> +                line =3D line.rstrip()
> +                if not line:
> +                    continue
> +                if len(line) >=3D 2 and line[1] =3D=3D ':':
> +                    if line[0] =3D=3D 'F':
> +                        fname =3D line[3:]
> +                        if fname in ['*', '*/']:
> +                            continue
> +                        if os.path.isfile(fname):
> +                            self.add(subsystem, fname, self.map_file,
> 'file')
> +                        elif os.path.isdir(fname):
> +                            self.add(subsystem, fname, self.map_dir,
> 'dir')
> +                        else:
> +                            paths =3D glob.glob(fname)
> +                            if not paths:
> +                                print('Warning: nothing corresponds to
> "{}"'.format(fname))
> +                                continue
> +
> +                            n =3D len(paths)
> +                            for f in paths:
> +                                if os.path.isfile(f):
> +                                    self.add(subsystem, f,
> self.map_glob_file, 'glob-file', n)
> +                                else:
> +                                    assert os.path.isdir(f)
> +                                    self.add(subsystem, f,
> self.map_glob_dir, 'glob-dir', n)
> +                elif line[:3] =3D=3D '---':
> +                    subsystem =3D prevline
> +                    if subsystem =3D=3D 'Devices':
> +                        mode2 =3D True
> +                elif mode2:
> +                    subsystem =3D line
> +                prevline =3D line
> +
> +    def find_in_map_dir(self, file_name, mapper):
> +        while file_name !=3D '' and file_name not in mapper:
> +            file_name =3D os.path.dirname(file_name)
> +
> +        return None if file_name =3D=3D '' else mapper[file_name][0]
> +
> +    def find_in_map_file(self, file_name, mapper):
> +        if file_name in mapper:
> +            return mapper[file_name][0]
> +
> +    def find_subsystem(self, file_name):
> +        s =3D self.find_in_map_file(file_name, self.map_file)
> +        if s is not None:
> +            return s
> +
> +        s =3D self.find_in_map_file(file_name, self.map_glob_file)
> +        if s is not None:
> +            return s
> +
> +        s =3D self.find_in_map_dir(file_name, self.map_dir)
> +        if s is not None:
> +            return s
> +
> +        s =3D self.find_in_map_dir(file_name, self.map_glob_dir)
> +        if s is not None:
> +            return s
> +
> +        s =3D self.find_in_map_dir(file_name, self.map_unmaintained_dir)
> +        if s is not None:
> +            return s
> +
> +        self.subsystems.append(file_name)
> +        return file_name
> +
> +
> +def commit(subsystem):
> +    msg =3D subsystem
> +    if msg in remap:
> +        msg =3D remap[msg]
> +    msg +=3D ': ' + message
> +    git_commit(msg)
> +
> +mnt =3D Maintainers(maintainers)
> +res =3D {}
> +for f in git_changed_files():
> +    s =3D mnt.find_subsystem(f)
> +    if s in res:
> +        res[s].append(f)
> +    else:
> +        res[s] =3D [f]
> +
> +for s in mnt.subsystems:
> +    if s in res:
> +        print(s)
> +        for f in res[s]:
> +            print('  ', f)
> +
> +for s in mnt.subsystems:
> +    if s in res:
> +        for f in res[s]:
> +            git_add(f)
> +        commit(s)
> --
> 2.21.0
>
>
>

--000000000000dd3eff059714bd30
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Friday, October 11, 2019, Vladimir Sementsov-Ogievskiy &lt;<a hr=
ef=3D"mailto:vsementsov@virtuozzo.com">vsementsov@virtuozzo.com</a>&gt; wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">Add script to automatically commit tr=
ee-wide changes per-subsystem.<br>
<br>
Signed-off-by: Vladimir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementso=
v@virtuozzo.com">vsementsov@virtuozzo.com</a>&gt;<br>
---</blockquote><div><br></div><div>Great idea!</div><div><br></div><div>Ca=
n you just add a comment somewhere close to the top of the file on script u=
sage? Or &quot;--help&quot; option? If you would like to be the script main=
tainer, please change the MAINTAINERS too.</div><div><br></div><div>Reviewe=
d-by: Aleksandar Markovic &lt;<a href=3D"mailto:amarkovic@wavecomp.com">ama=
rkovic@wavecomp.com</a>&gt;</div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">
<br>
CC: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.co=
m</a>&gt;<br>
CC: &quot;Gonglei (Arei)&quot; &lt;<a href=3D"mailto:arei.gonglei@huawei.co=
m">arei.gonglei@huawei.com</a>&gt;<br>
CC: Eduardo Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com">ehabkost@red=
hat.com</a>&gt;<br>
CC: Igor Mammedov &lt;<a href=3D"mailto:imammedo@redhat.com">imammedo@redha=
t.com</a>&gt;<br>
CC: Laurent Vivier &lt;<a href=3D"mailto:lvivier@redhat.com">lvivier@redhat=
.com</a>&gt;<br>
CC: Amit Shah &lt;<a href=3D"mailto:amit@kernel.org">amit@kernel.org</a>&gt=
;<br>
CC: Kevin Wolf &lt;<a href=3D"mailto:kwolf@redhat.com">kwolf@redhat.com</a>=
&gt;<br>
CC: Max Reitz &lt;<a href=3D"mailto:mreitz@redhat.com">mreitz@redhat.com</a=
>&gt;<br>
CC: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&=
gt;<br>
CC: Ari Sundholm &lt;<a href=3D"mailto:ari@tuxera.com">ari@tuxera.com</a>&g=
t;<br>
CC: Pavel Dovgalyuk &lt;<a href=3D"mailto:pavel.dovgaluk@ispras.ru">pavel.d=
ovgaluk@ispras.ru</a>&gt;<br>
CC: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redha=
t.com</a>&gt;<br>
CC: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com">stefanha@red=
hat.com</a>&gt;<br>
CC: Fam Zheng &lt;<a href=3D"mailto:fam@euphon.net">fam@euphon.net</a>&gt;<=
br>
CC: Stefan Weil &lt;<a href=3D"mailto:sw@weilnetz.de">sw@weilnetz.de</a>&gt=
;<br>
CC: Ronnie Sahlberg &lt;<a href=3D"mailto:ronniesahlberg@gmail.com">ronnies=
ahlberg@gmail.com</a>&gt;<br>
CC: Peter Lieven &lt;<a href=3D"mailto:pl@kamp.de">pl@kamp.de</a>&gt;<br>
CC: Eric Blake &lt;<a href=3D"mailto:eblake@redhat.com">eblake@redhat.com</=
a>&gt;<br>
CC: &quot;Denis V. Lunev&quot; &lt;<a href=3D"mailto:den@openvz.org">den@op=
envz.org</a>&gt;<br>
CC: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redha=
t.com</a>&gt;<br>
CC: Alberto Garcia &lt;<a href=3D"mailto:berto@igalia.com">berto@igalia.com=
</a>&gt;<br>
CC: Jason Dillaman &lt;<a href=3D"mailto:dillaman@redhat.com">dillaman@redh=
at.com</a>&gt;<br>
CC: Wen Congyang &lt;<a href=3D"mailto:wencongyang2@huawei.com">wencongyang=
2@huawei.com</a>&gt;<br>
CC: Xie Changlong &lt;<a href=3D"mailto:xiechanglong.d@gmail.com">xiechangl=
ong.d@gmail.com</a>&gt;<br>
CC: Liu Yuan &lt;<a href=3D"mailto:namei.unix@gmail.com">namei.unix@gmail.c=
om</a>&gt;<br>
CC: &quot;Richard W.M. Jones&quot; &lt;<a href=3D"mailto:rjones@redhat.com"=
>rjones@redhat.com</a>&gt;<br>
CC: Jeff Cody &lt;<a href=3D"mailto:codyprime@gmail.com">codyprime@gmail.co=
m</a>&gt;<br>
CC: &quot;Marc-Andr=C3=A9 Lureau&quot; &lt;<a href=3D"mailto:marcandre.lure=
au@redhat.com">marcandre.lureau@redhat.com</a>&gt;<br>
CC: &quot;Daniel P. Berrang=C3=A9&quot; &lt;<a href=3D"mailto:berrange@redh=
at.com">berrange@redhat.com</a>&gt;<br>
CC: Richard Henderson &lt;<a href=3D"mailto:rth@twiddle.net">rth@twiddle.ne=
t</a>&gt;<br>
CC: Greg Kurz &lt;<a href=3D"mailto:groug@kaod.org">groug@kaod.org</a>&gt;<=
br>
CC: &quot;Michael S. Tsirkin&quot; &lt;<a href=3D"mailto:mst@redhat.com">ms=
t@redhat.com</a>&gt;<br>
CC: Marcel Apfelbaum &lt;<a href=3D"mailto:marcel.apfelbaum@gmail.com">marc=
el.apfelbaum@gmail.com</a>&gt;<br>
CC: Beniamino Galvani &lt;<a href=3D"mailto:b.galvani@gmail.com">b.galvani@=
gmail.com</a>&gt;<br>
CC: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.may=
dell@linaro.org</a>&gt;<br>
CC: &quot;C=C3=A9dric Le Goater&quot; &lt;<a href=3D"mailto:clg@kaod.org">c=
lg@kaod.org</a>&gt;<br>
CC: Andrew Jeffery &lt;<a href=3D"mailto:andrew@aj.id.au">andrew@aj.id.au</=
a>&gt;<br>
CC: Joel Stanley &lt;<a href=3D"mailto:joel@jms.id.au">joel@jms.id.au</a>&g=
t;<br>
CC: Andrew Baumann &lt;<a href=3D"mailto:Andrew.Baumann@microsoft.com">Andr=
ew.Baumann@microsoft.com</a>&gt;<br>
CC: &quot;Philippe Mathieu-Daud=C3=A9&quot; &lt;<a href=3D"mailto:philmd@re=
dhat.com">philmd@redhat.com</a>&gt;<br>
CC: Antony Pavlov &lt;<a href=3D"mailto:antonynpavlov@gmail.com">antonynpav=
lov@gmail.com</a>&gt;<br>
CC: Jean-Christophe Dubois &lt;<a href=3D"mailto:jcd@tribudubois.net">jcd@t=
ribudubois.net</a>&gt;<br>
CC: Peter Chubb &lt;<a href=3D"mailto:peter.chubb@nicta.com.au">peter.chubb=
@nicta.com.au</a>&gt;<br>
CC: Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep.lkml@gmail.com">sundeep=
.lkml@gmail.com</a>&gt;<br>
CC: Eric Auger &lt;<a href=3D"mailto:eric.auger@redhat.com">eric.auger@redh=
at.com</a>&gt;<br>
CC: Alistair Francis &lt;<a href=3D"mailto:alistair@alistair23.me">alistair=
@alistair23.me</a>&gt;<br>
CC: &quot;Edgar E. Iglesias&quot; &lt;<a href=3D"mailto:edgar.iglesias@gmai=
l.com">edgar.iglesias@gmail.com</a>&gt;<br>
CC: Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabe=
llini@kernel.org</a>&gt;<br>
CC: Anthony Perard &lt;<a href=3D"mailto:anthony.perard@citrix.com">anthony=
.perard@citrix.com</a>&gt;<br>
CC: Paul Durrant &lt;<a href=3D"mailto:paul@xen.org">paul@xen.org</a>&gt;<b=
r>
CC: Paul Burton &lt;<a href=3D"mailto:pburton@wavecomp.com">pburton@wavecom=
p.com</a>&gt;<br>
CC: Aleksandar Rikalo &lt;<a href=3D"mailto:arikalo@wavecomp.com">arikalo@w=
avecomp.com</a>&gt;<br>
CC: Chris Wulff &lt;<a href=3D"mailto:crwulff@gmail.com">crwulff@gmail.com<=
/a>&gt;<br>
CC: Marek Vasut &lt;<a href=3D"mailto:marex@denx.de">marex@denx.de</a>&gt;<=
br>
CC: David Gibson &lt;<a href=3D"mailto:david@gibson.dropbear.id.au">david@g=
ibson.dropbear.id.au</a>&gt;<br>
CC: Cornelia Huck &lt;<a href=3D"mailto:cohuck@redhat.com">cohuck@redhat.co=
m</a>&gt;<br>
CC: Halil Pasic &lt;<a href=3D"mailto:pasic@linux.ibm.com">pasic@linux.ibm.=
com</a>&gt;<br>
CC: Christian Borntraeger &lt;<a href=3D"mailto:borntraeger@de.ibm.com">bor=
ntraeger@de.ibm.com</a>&gt;<br>
CC: &quot;Herv=C3=A9 Poussineau&quot; &lt;<a href=3D"mailto:hpoussin@reacto=
s.org">hpoussin@reactos.org</a>&gt;<br>
CC: Xiao Guangrong &lt;<a href=3D"mailto:xiaoguangrong.eric@gmail.com">xiao=
guangrong.eric@gmail.com</a>&gt;<br>
CC: Aurelien Jarno &lt;<a href=3D"mailto:aurelien@aurel32.net">aurelien@aur=
el32.net</a>&gt;<br>
CC: Aleksandar Markovic &lt;<a href=3D"mailto:amarkovic@wavecomp.com">amark=
ovic@wavecomp.com</a>&gt;<br>
CC: Mark Cave-Ayland &lt;<a href=3D"mailto:mark.cave-ayland@ilande.co.uk">m=
ark.cave-ayland@ilande.co.uk</a>&gt;<br>
CC: Jason Wang &lt;<a href=3D"mailto:jasowang@redhat.com">jasowang@redhat.c=
om</a>&gt;<br>
CC: Laszlo Ersek &lt;<a href=3D"mailto:lersek@redhat.com">lersek@redhat.com=
</a>&gt;<br>
CC: Yuval Shaia &lt;<a href=3D"mailto:yuval.shaia@oracle.com">yuval.shaia@o=
racle.com</a>&gt;<br>
CC: Palmer Dabbelt &lt;<a href=3D"mailto:palmer@sifive.com">palmer@sifive.c=
om</a>&gt;<br>
CC: Sagar Karandikar &lt;<a href=3D"mailto:sagark@eecs.berkeley.edu">sagark=
@eecs.berkeley.edu</a>&gt;<br>
CC: Bastian Koppelmann &lt;<a href=3D"mailto:kbastian@mail.uni-paderborn.de=
">kbastian@mail.uni-paderborn.de</a>&gt;<br>
CC: David Hildenbrand &lt;<a href=3D"mailto:david@redhat.com">david@redhat.=
com</a>&gt;<br>
CC: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a=
>&gt;<br>
CC: Eric Farman &lt;<a href=3D"mailto:farman@linux.ibm.com">farman@linux.ib=
m.com</a>&gt;<br>
CC: Matthew Rosato &lt;<a href=3D"mailto:mjrosato@linux.ibm.com">mjrosato@l=
inux.ibm.com</a>&gt;<br>
CC: Hannes Reinecke &lt;<a href=3D"mailto:hare@suse.com">hare@suse.com</a>&=
gt;<br>
CC: Michael Walle &lt;michael@walle.cc&gt;<br>
CC: Artyom Tarasenko &lt;<a href=3D"mailto:atar4qemu@gmail.com">atar4qemu@g=
mail.com</a>&gt;<br>
CC: Stefan Berger &lt;<a href=3D"mailto:stefanb@linux.ibm.com">stefanb@linu=
x.ibm.com</a>&gt;<br>
CC: Samuel Thibault &lt;<a href=3D"mailto:samuel.thibault@ens-lyon.org">sam=
uel.thibault@ens-lyon.org</a>&gt;<br>
CC: Alex Williamson &lt;<a href=3D"mailto:alex.williamson@redhat.com">alex.=
williamson@redhat.com</a>&gt;<br>
CC: Tony Krowiak &lt;<a href=3D"mailto:akrowiak@linux.ibm.com">akrowiak@lin=
ux.ibm.com</a>&gt;<br>
CC: Pierre Morel &lt;<a href=3D"mailto:pmorel@linux.ibm.com">pmorel@linux.i=
bm.com</a>&gt;<br>
CC: Michael Roth &lt;<a href=3D"mailto:mdroth@linux.vnet.ibm.com">mdroth@li=
nux.vnet.ibm.com</a>&gt;<br>
CC: Hailiang Zhang &lt;<a href=3D"mailto:zhang.zhanghailiang@huawei.com">zh=
ang.zhanghailiang@huawei.com</a>&gt;<br>
CC: Juan Quintela &lt;<a href=3D"mailto:quintela@redhat.com">quintela@redha=
t.com</a>&gt;<br>
CC: &quot;Dr. David Alan Gilbert&quot; &lt;<a href=3D"mailto:dgilbert@redha=
t.com">dgilbert@redhat.com</a>&gt;<br>
CC: Luigi Rizzo &lt;<a href=3D"mailto:rizzo@iet.unipi.it">rizzo@iet.unipi.i=
t</a>&gt;<br>
CC: Giuseppe Lettieri &lt;<a href=3D"mailto:g.lettieri@iet.unipi.it">g.lett=
ieri@iet.unipi.it</a>&gt;<br>
CC: Vincenzo Maffione &lt;<a href=3D"mailto:v.maffione@gmail.com">v.maffion=
e@gmail.com</a>&gt;<br>
CC: Jan Kiszka &lt;<a href=3D"mailto:jan.kiszka@siemens.com">jan.kiszka@sie=
mens.com</a>&gt;<br>
CC: Anthony Green &lt;<a href=3D"mailto:green@moxielogic.com">green@moxielo=
gic.com</a>&gt;<br>
CC: Stafford Horne &lt;<a href=3D"mailto:shorne@gmail.com">shorne@gmail.com=
</a>&gt;<br>
CC: Guan Xuetao &lt;<a href=3D"mailto:gxt@mprc.pku.edu.cn">gxt@mprc.pku.edu=
.cn</a>&gt;<br>
CC: Max Filippov &lt;<a href=3D"mailto:jcmvbkbc@gmail.com">jcmvbkbc@gmail.c=
om</a>&gt;<br>
CC: <a href=3D"mailto:qemu-block@nongnu.org">qemu-block@nongnu.org</a><br>
CC: <a href=3D"mailto:integration@gluster.org">integration@gluster.org</a><=
br>
CC: <a href=3D"mailto:sheepdog@lists.wpkg.org">sheepdog@lists.wpkg.org</a><=
br>
CC: <a href=3D"mailto:qemu-arm@nongnu.org">qemu-arm@nongnu.org</a><br>
CC: <a href=3D"mailto:xen-devel@lists.xenproject.org">xen-devel@lists.xenpr=
oject.org</a><br>
CC: <a href=3D"mailto:qemu-ppc@nongnu.org">qemu-ppc@nongnu.org</a><br>
CC: <a href=3D"mailto:qemu-s390x@nongnu.org">qemu-s390x@nongnu.org</a><br>
CC: <a href=3D"mailto:qemu-riscv@nongnu.org">qemu-riscv@nongnu.org</a><br>
<br>
=C2=A0python/commit-per-subsystem.py | 204 ++++++++++++++++++++++++++++++<w=
br>+++<br>
=C2=A01 file changed, 204 insertions(+)<br>
=C2=A0create mode 100755 python/commit-per-subsystem.py<br>
<br>
diff --git a/python/commit-per-subsystem.<wbr>py b/python/commit-per-subsys=
tem.<wbr>py<br>
new file mode 100755<br>
index 0000000000..2ccf84cb15<br>
--- /dev/null<br>
+++ b/python/commit-per-subsystem.<wbr>py<br>
@@ -0,0 +1,204 @@<br>
+#!/usr/bin/env python3<br>
+#<br>
+# Copyright (c) 2019 Virtuozzo International GmbH<br>
+#<br>
+# This program is free software; you can redistribute it and/or modify<br>
+# it under the terms of the GNU General Public License as published by<br>
+# the Free Software Foundation; either version 2 of the License, or<br>
+# (at your option) any later version.<br>
+#<br>
+# This program is distributed in the hope that it will be useful,<br>
+# but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the<br>
+# GNU General Public License for more details.<br>
+#<br>
+# You should have received a copy of the GNU General Public License<br>
+# along with this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gnu=
.org/licenses/" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;<wbr>=
.<br>
+#<br>
+<br>
+import subprocess<br>
+import sys<br>
+import os<br>
+import glob<br>
+<br>
+<br>
+def git_add(pattern):<br>
+=C2=A0 =C2=A0 subprocess.run([&#39;git&#39;, &#39;add&#39;, pattern])<br>
+<br>
+<br>
+def git_commit(msg):<br>
+=C2=A0 =C2=A0 subprocess.run([&#39;git&#39;, &#39;commit&#39;, &#39;-m&#39=
;, msg], capture_output=3DTrue)<br>
+<br>
+<br>
+def git_changed_files():<br>
+=C2=A0 =C2=A0 ret =3D subprocess.check_output([&#39;git&#39;<wbr>, &#39;di=
ff&#39;, &#39;--name-only&#39;], encoding=3D&#39;utf-8&#39;).split(&#39;\n&=
#39;)<br>
+=C2=A0 =C2=A0 if ret[-1] =3D=3D &#39;&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 del ret[-1]<br>
+=C2=A0 =C2=A0 return ret<br>
+<br>
+<br>
+maintainers =3D sys.argv[1]<br>
+message =3D sys.argv[2].strip()<br>
+<br>
+subsystem =3D None<br>
+<br>
+remap =3D {<br>
+=C2=A0 =C2=A0 &#39;Block layer core&#39;: &#39;block&#39;,<br>
+=C2=A0 =C2=A0 &#39;Block Jobs&#39;: &#39;block&#39;,<br>
+=C2=A0 =C2=A0 &#39;Dirty Bitmaps&#39;: &#39;block&#39;,<br>
+=C2=A0 =C2=A0 &#39;Block QAPI, monitor, command line&#39;: &#39;block&#39;=
,<br>
+=C2=A0 =C2=A0 &#39;Block I/O path&#39;: &#39;block&#39;,<br>
+=C2=A0 =C2=A0 &#39;Throttling infrastructure&#39;: &#39;block&#39;,<br>
+=C2=A0 =C2=A0 &#39;Architecture support&#39;: &#39;s390x&#39;,<br>
+=C2=A0 =C2=A0 &#39;Guest CPU Cores (KVM)&#39;: &#39;kvm&#39;,<br>
+=C2=A0 =C2=A0 &#39;Guest CPU Cores (Xen)&#39;: &#39;xen&#39;,<br>
+=C2=A0 =C2=A0 &#39;Guest CPU cores (TCG)&#39;: &#39;tcg&#39;,<br>
+=C2=A0 =C2=A0 &#39;Network Block Device (NBD)&#39;: &#39;nbd&#39;,<br>
+=C2=A0 =C2=A0 &#39;Parallel NOR Flash devices&#39;: &#39;pflash&#39;,<br>
+=C2=A0 =C2=A0 &#39;Firmware configuration (fw_cfg)&#39;: &#39;fw_cfg&#39;,=
<br>
+=C2=A0 =C2=A0 &#39;Block SCSI subsystem&#39;: &#39;scsi&#39;,<br>
+=C2=A0 =C2=A0 &#39;Network device backends&#39;: &#39;net&#39;,<br>
+=C2=A0 =C2=A0 &#39;Netmap network backend&#39;: &#39;net&#39;,<br>
+=C2=A0 =C2=A0 &#39;Host Memory Backends&#39;: &#39;hostmem&#39;,<br>
+=C2=A0 =C2=A0 &#39;Cryptodev Backends&#39;: &#39;cryptodev&#39;,<br>
+=C2=A0 =C2=A0 &#39;QEMU Guest Agent&#39;: &#39;qga&#39;,<br>
+=C2=A0 =C2=A0 &#39;COLO Framework&#39;: &#39;colo&#39;,<br>
+=C2=A0 =C2=A0 &#39;Command line option argument parsing&#39;: &#39;cmdline=
&#39;,<br>
+=C2=A0 =C2=A0 &#39;Character device backends&#39;: &#39;chardev&#39;<br>
+}<br>
+<br>
+<br>
+class Maintainers:<br>
+=C2=A0 =C2=A0 def add(self, subsystem, path, mapper, mapper_name, glob_cou=
nt=3D1):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if subsystem in remap:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subsystem =3D remap[subsystem]<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if subsystem not in self.subsystems:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.subsystems.append(<wbr>subs=
ystem)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if path[-1] =3D=3D &#39;/&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 path =3D path[:-1]<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if path in mapper:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if mapper[path][1] =3D=3D glob_c=
ount:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&#39;Warning=
: &quot;{}&quot; both in &quot;{}&quot; and &quot;{}&quot; in {} mapper wit=
h &#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &#39;same glob-count=3D{}. {} ignored for this path.&#39;.format(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 path, mapper[path][0], subsystem, mapper_name, glob_count,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 subsystem))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if mapper[path][1] &lt; glob_cou=
nt:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # silently ignore =
worse match<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mapper[path] =3D (subsystem, glob_count)<br>
+<br>
+=C2=A0 =C2=A0 def __init__(self, file_name):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.map_file =3D {}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.map_glob_file =3D {}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.map_dir =3D {}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.map_glob_dir =3D {}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.map_unmaintained_dir =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;python&#39;: (&#39;python&#=
39;, 1),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;hw/misc&#39;: (&#39;misc&#3=
9;, 1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.subsystems =3D [&#39;python&#39;, &#39;mi=
sc&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 subsystem =3D None<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(file_name) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mode2 =3D False<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prevline =3D &#39;&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 line =3D line.rstr=
ip()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not line:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cont=
inue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(line) &gt;=
=3D 2 and line[1] =3D=3D &#39;:&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if l=
ine[0] =3D=3D &#39;F&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fname =3D line[3:]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if fname in [&#39;*&#39;, &#39;*/&#39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if os.path.isfile(fname):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 self.add(subsystem, fname, self.map_file, &#39;fil=
e&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 elif os.path.isdir(fname):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 self.add(subsystem, fname, self.map_dir, &#39;dir&=
#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 paths =3D glob.glob(fname)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if not paths:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&#39;Warning: nothing correspo=
nds to &quot;{}&quot;&#39;.format(fname))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 n =3D len(paths)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 for f in paths:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.isfile(f):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.add(subsystem, f,=
 self.map_glob_file, &#39;glob-file&#39;, n)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert os.path.isdir(f=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.add(subsystem, f,=
 self.map_glob_dir, &#39;glob-dir&#39;, n)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif line[:3] =3D=
=3D &#39;---&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subs=
ystem =3D prevline<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if s=
ubsystem =3D=3D &#39;Devices&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 mode2 =3D True<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif mode2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subs=
ystem =3D line<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prevline =3D line<=
br>
+<br>
+=C2=A0 =C2=A0 def find_in_map_dir(self, file_name, mapper):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 while file_name !=3D &#39;&#39; and file_name =
not in mapper:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file_name =3D os.path.dirname(fi=
le_name)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return None if file_name =3D=3D &#39;&#39; els=
e mapper[file_name][0]<br>
+<br>
+=C2=A0 =C2=A0 def find_in_map_file(self, file_name, mapper):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if file_name in mapper:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return mapper[file_name][0]<br>
+<br>
+=C2=A0 =C2=A0 def find_subsystem(self, file_name):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s =3D self.find_in_map_file(file_<wbr>name, se=
lf.map_file)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if s is not None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return s<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s =3D self.find_in_map_file(file_<wbr>name, se=
lf.map_glob_file)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if s is not None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return s<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s =3D self.find_in_map_dir(file_<wbr>name, sel=
f.map_dir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if s is not None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return s<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s =3D self.find_in_map_dir(file_<wbr>name, sel=
f.map_glob_dir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if s is not None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return s<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s =3D self.find_in_map_dir(file_<wbr>name, sel=
f.map_unmaintained_dir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if s is not None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return s<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.subsystems.append(file_<wbr>name)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return file_name<br>
+<br>
+<br>
+def commit(subsystem):<br>
+=C2=A0 =C2=A0 msg =3D subsystem<br>
+=C2=A0 =C2=A0 if msg in remap:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D remap[msg]<br>
+=C2=A0 =C2=A0 msg +=3D &#39;: &#39; + message<br>
+=C2=A0 =C2=A0 git_commit(msg)<br>
+<br>
+mnt =3D Maintainers(maintainers)<br>
+res =3D {}<br>
+for f in git_changed_files():<br>
+=C2=A0 =C2=A0 s =3D mnt.find_subsystem(f)<br>
+=C2=A0 =C2=A0 if s in res:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 res[s].append(f)<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 res[s] =3D [f]<br>
+<br>
+for s in mnt.subsystems:<br>
+=C2=A0 =C2=A0 if s in res:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 print(s)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for f in res[s]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&#39;=C2=A0 &#39;, f)<br>
+<br>
+for s in mnt.subsystems:<br>
+=C2=A0 =C2=A0 if s in res:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for f in res[s]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git_add(f)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 commit(s)<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote>

--000000000000dd3eff059714bd30--


--===============2461813351070637236==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2461813351070637236==--

