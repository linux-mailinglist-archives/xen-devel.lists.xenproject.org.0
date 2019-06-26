Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E99B956C19
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 16:34:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg8wR-0002iw-SI; Wed, 26 Jun 2019 14:30:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cXZU=UZ=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1hg8wQ-0002ir-PK
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 14:30:30 +0000
X-Inumbo-ID: f110f386-981e-11e9-9549-ebb14153af5f
Received: from mga17.intel.com (unknown [192.55.52.151])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f110f386-981e-11e9-9549-ebb14153af5f;
 Wed, 26 Jun 2019 14:30:27 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jun 2019 07:30:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,420,1557212400"; d="scan'208";a="155885800"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by orsmga008.jf.intel.com with ESMTP; 26 Jun 2019 07:30:24 -0700
Date: Wed, 26 Jun 2019 22:34:36 +0800
From: Chao Gao <chao.gao@intel.com>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20190626143434.GA6903@gao-cwp>
References: <alpine.DEB.2.21.1906241135080.2468@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1906241146530.2468@sstabellini-ThinkPad-T480s>
 <3c16614d-fc50-1899-709c-45f49eb156b1@suse.com>
 <20190626122157.GA2885@gao-cwp>
 <2b9df6fd-1be8-5f45-009e-4a975ad159b1@suse.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="r5Pyd7+fXNt84Ff3"
Content-Disposition: inline
In-Reply-To: <2b9df6fd-1be8-5f45-009e-4a975ad159b1@suse.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] PCI Passthrough bug with x86 HVM
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, wl@xen.org,
 andrew.cooper3@citrix.com, jbeulich@suse.com, xen-devel@lists.xenproject.org,
 boris.ostrovsky@oracle.com, roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 26, 2019 at 03:36:35PM +0200, Juergen Gross wrote:
>On 26.06.19 14:21, Chao Gao wrote:
>>On Wed, Jun 26, 2019 at 08:17:50AM +0200, Juergen Gross wrote:
>>>On 24.06.19 20:47, Stefano Stabellini wrote:
>>>>+ xen-devel
>>>>
>>>>On Mon, 24 Jun 2019, Stefano Stabellini wrote:
>>>>>Hi all,
>>>>>
>>>>>I might have found a bug with PCI passthrough to a Linux HVM guest on
>>>>>x86 with Xen 4.12. It is not easy for me to get access, and especially
>>>>>change components, on this particular system, and I don't have access to
>>>>>other x86 boxes at the moment, so apologies for the partial information
>>>>>report. The setup is as follow:
>>>>>
>>>>>- two PCI devices have been assigned to a HVM guest, everything is fine
>>>>>- reboot the guest from inside, i.e. `reboot' in Linux
>>>>>- after the reboot completes, only one device is assigned
>>>>>
>>>>>Before the reboot, I see all the appropriate xenstore entries for both
>>>>>devices. Everything is fine. After the reboot, I can only see the
>>>>>xenstore entries of one device. It is as if the other device
>>>>>"disappeared" without throwing any errors.
>>>>>
>>>>>Have you seen this before? Do you know if it has been fixed in staging?
>>>>>I noticed this fix which seems to be very relevant:
>>>>>
>>>>>https://lists.xenproject.org/archives/html/xen-devel/2018-11/msg01616.html
>>>>>
>>>>>but it is already included in 4.12.
>>>
>>>Stefano, could you please try the attached patch? It is only compile
>>>tested for now.
>>>
>>>
>>>Juergen
>>
>>>From ea95dcdfc60a895cc43baf34c8e0fb088e10008d Mon Sep 17 00:00:00 2001
>>>From: Juergen Gross <jgross@suse.com>
>>>To: xen-devel@lists.xenproject.org
>>>Cc: Ian Jackson <ian.jackson@eu.citrix.com>
>>>Cc: Wei Liu <wl@xen.org>
>>>Date: Wed, 26 Jun 2019 08:15:28 +0200
>>>Subject: [PATCH] libxl: fix pci device re-assigning after domain reboot
>>>
>>>After a reboot of a guest only the first pci device configuration will
>>>be retrieved from Xenstore resulting in loss of any further assigned
>>>passed through pci devices.
>>>
>>>The main reason is that all passed through pci devices reside under a
>>>common root device "0" in Xenstore. So when the device list is rebuilt
>>>from Xenstore after a reboot the sub-devices below that root device
>>>need to be selected instead of using the root device number as a
>>>selector.
>>>
>>>Fix that by adding a new member to struct libxl_device_type which when
>>>set is used to get the number of devices. Add such a member for pci to
>>>get the correct number of pci devices instead of implying it from the
>>>number of pci root devices (which will always be 1).
>>>
>>>While at it fix the type of libxl__device_pci_from_xs_be() to match
>>>the one of the .from_xenstore member of struct libxl_device_type. This
>>>fixes a latent bug checking the return value of a function returning
>>>void.
>>>
>>>Signed-off-by: Juergen Gross <jgross@suse.com>
>>
>>Tested-by: Chao Gao <chao.gao@intel.com>
>
>Thanks!
>
>>
>>Note that I just tested it on RELEASE-4.12.0, not staging.
>>
>>I also found USB device would miss across reboot. Is there someone
>>willing to fix it too?
>
>I'll have a look.
>

In guest configuration file, it has following two lines:

usbctrl=['type=devicemodel,version=1']
usbdev=['type=hostdev,hostbus=1,hostaddr=3,controller=0,port=1']

Attachments are output of 'xenstore-ls' before and after reboot 

Thanks
Chao


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=xenstore-before

tool = ""
 xenstored = ""
local = ""
 domain = ""
  0 = ""
   control = ""
    feature-poweroff = "1"
    feature-reboot = "1"
    feature-suspend = "1"
   domid = "0"
   name = "Domain-0"
   device-model = ""
    0 = ""
     backends = ""
      console = ""
      vkbd = ""
      qdisk = ""
      9pfs = ""
      qusb = ""
      vfb = ""
      qnic = ""
     state = "running"
    37 = ""
     backends = ""
      console = ""
      vkbd = ""
      9pfs = ""
      qusb = ""
     state = "running"
   device = ""
    vbd = ""
     51712 = ""
      backend = "/local/domain/0/backend/qdisk/0/51712"
      backend-id = "0"
      state = "3"
      virtual-device = "51712"
      device-type = "disk"
      protocol = "x86_64-abi"
      ring-ref = "8"
      event-channel = "76"
      feature-persistent = "1"
   backend = ""
    qdisk = ""
     0 = ""
      51712 = ""
       frontend = "/local/domain/0/device/vbd/51712"
       params = "qcow2:centos.qcow2"
       frontend-id = "0"
       online = "1"
       removable = "0"
       bootable = "1"
       state = "2"
       dev = "xvda"
       type = "qdisk"
       mode = "w"
       device-type = "disk"
       discard-enable = "1"
       feature-flush-cache = "1"
       info = "0"
       max-ring-page-order = "4"
       feature-discard = "1"
       hotplug-status = "connected"
     37 = ""
      51712 = ""
       frontend = "/local/domain/37/device/vbd/51712"
       params = "qcow2:/home/nervalusr/chao/centos.qcow2"
       frontend-id = "37"
       online = "1"
       removable = "0"
       bootable = "1"
       state = "4"
       dev = "xvda"
       type = "qdisk"
       mode = "w"
       device-type = "disk"
       discard-enable = "1"
       feature-discard = "1"
       discard-granularity = "512"
       feature-flush-cache = "1"
       max-ring-page-order = "4"
       info = "0"
       sector-size = "512"
       sectors = "62914560"
       hotplug-status = "connected"
    console = ""
     37 = ""
      0 = ""
       frontend = "/local/domain/37/console"
       frontend-id = "37"
       online = "1"
       state = "1"
       protocol = "vt100"
    vkbd = ""
     37 = ""
      0 = ""
       frontend = "/local/domain/37/device/vkbd/0"
       frontend-id = "37"
       online = "1"
       state = "4"
       backend-type = "qemu"
       feature-abs-pointer = "1"
       feature-raw-pointer = "1"
       hotplug-status = "connected"
    vif = ""
     37 = ""
      0 = ""
       frontend = "/local/domain/37/device/vif/0"
       frontend-id = "37"
       online = "1"
       state = "4"
       script = "/etc/xen/scripts/vif-bridge"
       mac = "22:16:3e:00:9f:a7"
       bridge = "xenbr0"
       handle = "0"
       type = "vif_ioemu"
       feature-sg = "1"
       feature-gso-tcpv4 = "1"
       feature-gso-tcpv6 = "1"
       feature-ipv6-csum-offload = "1"
       feature-rx-copy = "1"
       feature-rx-flip = "0"
       feature-multicast-control = "1"
       feature-dynamic-multicast-control = "1"
       feature-split-event-channels = "1"
       multi-queue-max-queues = "4"
       feature-ctrl-ring = "1"
       hotplug-status = "connected"
  37 = ""
   vm = "/vm/9a6857f8-05a0-4c8d-92c3-1ea04bc28c32"
   name = "guest_centos7"
   cpu = ""
    0 = ""
     availability = "online"
    1 = ""
     availability = "online"
    2 = ""
     availability = "online"
    3 = ""
     availability = "online"
   memory = ""
    static-max = "16777216"
    target = "16760832"
    videoram = "16384"
   device = ""
    suspend = ""
     event-channel = ""
    vbd = ""
     51712 = ""
      backend = "/local/domain/0/backend/qdisk/37/51712"
      backend-id = "0"
      state = "4"
      virtual-device = "51712"
      device-type = "disk"
      ring-ref = "2312"
      event-channel = "46"
      protocol = "x86_64-abi"
      feature-persistent = "1"
    vkbd = ""
     0 = ""
      backend = "/local/domain/0/backend/vkbd/37/0"
      backend-id = "0"
      state = "4"
      request-abs-pointer = "1"
      page-ref = "4156386"
      page-gref = "270"
      event-channel = "47"
    vif = ""
     0 = ""
      backend = "/local/domain/0/backend/vif/37/0"
      backend-id = "0"
      state = "4"
      handle = "0"
      mac = "22:16:3e:00:9f:a7"
      multi-queue-num-queues = "4"
      queue-0 = ""
       tx-ring-ref = "2304"
       rx-ring-ref = "2305"
       event-channel-tx = "38"
       event-channel-rx = "39"
      queue-1 = ""
       tx-ring-ref = "2306"
       rx-ring-ref = "2307"
       event-channel-tx = "40"
       event-channel-rx = "41"
      queue-2 = ""
       tx-ring-ref = "2308"
       rx-ring-ref = "2309"
       event-channel-tx = "42"
       event-channel-rx = "43"
      queue-3 = ""
       tx-ring-ref = "2310"
       rx-ring-ref = "2311"
       event-channel-tx = "44"
       event-channel-rx = "45"
      request-rx-copy = "1"
      feature-rx-notify = "1"
      feature-sg = "1"
      feature-gso-tcpv4 = "1"
      feature-gso-tcpv6 = "1"
      feature-ipv6-csum-offload = "1"
   control = ""
    shutdown = ""
    feature-poweroff = ""
    feature-reboot = ""
    feature-suspend = ""
    feature-s3 = ""
    feature-s4 = ""
    sysrq = ""
    platform-feature-multiprocessor-suspend = "1"
    platform-feature-xs_reset_watches = "1"
   hvmloader = ""
    bios = "seabios"
    allow-memory-relocate = "0"
   data = ""
   drivers = ""
   feature = ""
   attr = ""
   domid = "37"
   store = ""
    port = "1"
    ring-ref = "1044476"
   platform = ""
    acpi = "1"
    acpi_s3 = "1"
    acpi_s4 = "1"
    acpi_laptop_slate = "0"
    device-model = "qemu_xen"
   console = ""
    backend = "/local/domain/0/backend/console/37/0"
    backend-id = "0"
    limit = "1048576"
    type = "xenconsoled"
    output = "pty"
    tty = "/dev/pts/4"
    port = "2"
    ring-ref = "1044479"
    vnc-listen = "127.0.0.1"
    vnc-port = "5900"
   image = ""
    device-model-pid = "8409"
   serial = ""
    0 = ""
     tty = "/dev/pts/6"
vm = ""
 9a6857f8-05a0-4c8d-92c3-1ea04bc28c32 = ""
  name = "guest_centos7"
  uuid = "9a6857f8-05a0-4c8d-92c3-1ea04bc28c32"
  rtc = ""
   timeoffset = ""
  image = ""
   ostype = "hvm"
  start_time = "1561550075.84"
libxl = ""
 pciback = ""
  0000-88-00-0 = ""
   driver_path = "/sys/bus/pci/drivers/intel_nnp"
 0 = ""
  device = ""
   vbd = ""
    51712 = ""
     frontend = "/local/domain/0/device/vbd/51712"
     backend = "/local/domain/0/backend/qdisk/0/51712"
     params = "qcow2:centos.qcow2"
     frontend-id = "0"
     online = "1"
     removable = "0"
     bootable = "1"
     state = "1"
     dev = "xvda"
     type = "qdisk"
     mode = "w"
     device-type = "disk"
     discard-enable = "1"
 37 = ""
  device = ""
   vbd = ""
    51712 = ""
     frontend = "/local/domain/37/device/vbd/51712"
     backend = "/local/domain/0/backend/qdisk/37/51712"
     params = "qcow2:/home/nervalusr/chao/centos.qcow2"
     frontend-id = "37"
     online = "1"
     removable = "0"
     bootable = "1"
     state = "1"
     dev = "xvda"
     type = "qdisk"
     mode = "w"
     device-type = "disk"
     discard-enable = "1"
   console = ""
    0 = ""
     frontend = "/local/domain/37/console"
     backend = "/local/domain/0/backend/console/37/0"
     frontend-id = "37"
     online = "1"
     state = "1"
     protocol = "vt100"
   vkbd = ""
    0 = ""
     frontend = "/local/domain/37/device/vkbd/0"
     backend = "/local/domain/0/backend/vkbd/37/0"
     frontend-id = "37"
     online = "1"
     state = "1"
     backend-type = "qemu"
   vif = ""
    0 = ""
     frontend = "/local/domain/37/device/vif/0"
     backend = "/local/domain/0/backend/vif/37/0"
     frontend-id = "37"
     online = "1"
     state = "1"
     script = "/etc/xen/scripts/vif-bridge"
     mac = "22:16:3e:00:9f:a7"
     bridge = "xenbr0"
     handle = "0"
     type = "vif_ioemu"
   vusb = ""
    0 = ""
     type = "devicemodel"
     usb-ver = "1"
     num-ports = "2"
     port = ""
      1 = "1-4"
      2 = ""
  type = "hvm"
  dm-version = "qemu_xen"

--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=xenstore-after

tool = ""
 xenstored = ""
local = ""
 domain = ""
  0 = ""
   control = ""
    feature-poweroff = "1"
    feature-reboot = "1"
    feature-suspend = "1"
   domid = "0"
   name = "Domain-0"
   device-model = ""
    0 = ""
     backends = ""
      console = ""
      vkbd = ""
      qdisk = ""
      9pfs = ""
      qusb = ""
      vfb = ""
      qnic = ""
     state = "running"
    38 = ""
     backends = ""
      console = ""
      vkbd = ""
      9pfs = ""
      qusb = ""
     state = "running"
   device = ""
    vbd = ""
     51712 = ""
      backend = "/local/domain/0/backend/qdisk/0/51712"
      backend-id = "0"
      state = "3"
      virtual-device = "51712"
      device-type = "disk"
      protocol = "x86_64-abi"
      ring-ref = "8"
      event-channel = "76"
      feature-persistent = "1"
   backend = ""
    qdisk = ""
     0 = ""
      51712 = ""
       frontend = "/local/domain/0/device/vbd/51712"
       params = "qcow2:centos.qcow2"
       frontend-id = "0"
       online = "1"
       removable = "0"
       bootable = "1"
       state = "2"
       dev = "xvda"
       type = "qdisk"
       mode = "w"
       device-type = "disk"
       discard-enable = "1"
       feature-flush-cache = "1"
       info = "0"
       max-ring-page-order = "4"
       feature-discard = "1"
       hotplug-status = "connected"
     38 = ""
      51712 = ""
       frontend = "/local/domain/38/device/vbd/51712"
       params = "qcow2:/home/nervalusr/chao/centos.qcow2"
       frontend-id = "38"
       online = "1"
       removable = "0"
       bootable = "1"
       state = "4"
       dev = "xvda"
       type = "qdisk"
       mode = "w"
       device-type = "disk"
       discard-enable = "1"
       feature-discard = "1"
       discard-granularity = "512"
       feature-flush-cache = "1"
       max-ring-page-order = "4"
       info = "0"
       sector-size = "512"
       sectors = "62914560"
       hotplug-status = "connected"
    console = ""
     38 = ""
      0 = ""
       frontend = "/local/domain/38/console"
       frontend-id = "38"
       online = "1"
       state = "1"
       protocol = "vt100"
    vkbd = ""
     38 = ""
      0 = ""
       frontend = "/local/domain/38/device/vkbd/0"
       frontend-id = "38"
       online = "1"
       state = "4"
       backend-type = "qemu"
       feature-abs-pointer = "1"
       feature-raw-pointer = "1"
       hotplug-status = "connected"
    vif = ""
     38 = ""
      0 = ""
       frontend = "/local/domain/38/device/vif/0"
       frontend-id = "38"
       online = "1"
       state = "4"
       script = "/etc/xen/scripts/vif-bridge"
       mac = "22:16:3e:00:9f:a7"
       bridge = "xenbr0"
       handle = "0"
       type = "vif_ioemu"
       feature-sg = "1"
       feature-gso-tcpv4 = "1"
       feature-gso-tcpv6 = "1"
       feature-ipv6-csum-offload = "1"
       feature-rx-copy = "1"
       feature-rx-flip = "0"
       feature-multicast-control = "1"
       feature-dynamic-multicast-control = "1"
       feature-split-event-channels = "1"
       multi-queue-max-queues = "4"
       feature-ctrl-ring = "1"
       hotplug-status = "connected"
  38 = ""
   vm = "/vm/9a6857f8-05a0-4c8d-92c3-1ea04bc28c32"
   name = "guest_centos7"
   cpu = ""
    0 = ""
     availability = "online"
    1 = ""
     availability = "online"
    2 = ""
     availability = "online"
    3 = ""
     availability = "online"
   memory = ""
    static-max = "16777216"
    target = "16760832"
    videoram = "16384"
   device = ""
    suspend = ""
     event-channel = ""
    vbd = ""
     51712 = ""
      backend = "/local/domain/0/backend/qdisk/38/51712"
      backend-id = "0"
      state = "4"
      virtual-device = "51712"
      device-type = "disk"
      ring-ref = "2312"
      event-channel = "45"
      protocol = "x86_64-abi"
      feature-persistent = "1"
    vkbd = ""
     0 = ""
      backend = "/local/domain/0/backend/vkbd/38/0"
      backend-id = "0"
      state = "4"
      request-abs-pointer = "1"
      page-ref = "222612"
      page-gref = "343"
      event-channel = "46"
    vif = ""
     0 = ""
      backend = "/local/domain/0/backend/vif/38/0"
      backend-id = "0"
      state = "4"
      handle = "0"
      mac = "22:16:3e:00:9f:a7"
      multi-queue-num-queues = "4"
      queue-0 = ""
       tx-ring-ref = "2304"
       rx-ring-ref = "2305"
       event-channel-tx = "37"
       event-channel-rx = "38"
      queue-1 = ""
       tx-ring-ref = "2306"
       rx-ring-ref = "2307"
       event-channel-tx = "39"
       event-channel-rx = "40"
      queue-2 = ""
       tx-ring-ref = "2308"
       rx-ring-ref = "2309"
       event-channel-tx = "41"
       event-channel-rx = "42"
      queue-3 = ""
       tx-ring-ref = "2310"
       rx-ring-ref = "2311"
       event-channel-tx = "43"
       event-channel-rx = "44"
      request-rx-copy = "1"
      feature-rx-notify = "1"
      feature-sg = "1"
      feature-gso-tcpv4 = "1"
      feature-gso-tcpv6 = "1"
      feature-ipv6-csum-offload = "1"
   control = ""
    shutdown = ""
    feature-poweroff = ""
    feature-reboot = ""
    feature-suspend = ""
    feature-s3 = ""
    feature-s4 = ""
    sysrq = ""
    platform-feature-multiprocessor-suspend = "1"
    platform-feature-xs_reset_watches = "1"
   hvmloader = ""
    bios = "seabios"
    allow-memory-relocate = "0"
   data = ""
   drivers = ""
   feature = ""
   attr = ""
   domid = "38"
   store = ""
    port = "1"
    ring-ref = "1044476"
   platform = ""
    acpi = "1"
    acpi_s3 = "1"
    acpi_s4 = "1"
    acpi_laptop_slate = "0"
    device-model = "qemu_xen"
   console = ""
    backend = "/local/domain/0/backend/console/38/0"
    backend-id = "0"
    limit = "1048576"
    type = "xenconsoled"
    output = "pty"
    tty = "/dev/pts/3"
    port = "2"
    ring-ref = "1044479"
    vnc-listen = "127.0.0.1"
    vnc-port = "5900"
   image = ""
    device-model-pid = "8783"
   serial = ""
    0 = ""
     tty = "/dev/pts/4"
vm = ""
 9a6857f8-05a0-4c8d-92c3-1ea04bc28c32 = ""
  name = "guest_centos7"
  uuid = "9a6857f8-05a0-4c8d-92c3-1ea04bc28c32"
  rtc = ""
   timeoffset = ""
  image = ""
   ostype = "hvm"
  start_time = "1561550310.23"
libxl = ""
 pciback = ""
  0000-88-00-0 = ""
   driver_path = "/sys/bus/pci/drivers/intel_nnp"
 0 = ""
  device = ""
   vbd = ""
    51712 = ""
     frontend = "/local/domain/0/device/vbd/51712"
     backend = "/local/domain/0/backend/qdisk/0/51712"
     params = "qcow2:centos.qcow2"
     frontend-id = "0"
     online = "1"
     removable = "0"
     bootable = "1"
     state = "1"
     dev = "xvda"
     type = "qdisk"
     mode = "w"
     device-type = "disk"
     discard-enable = "1"
 38 = ""
  device = ""
   vbd = ""
    51712 = ""
     frontend = "/local/domain/38/device/vbd/51712"
     backend = "/local/domain/0/backend/qdisk/38/51712"
     params = "qcow2:/home/nervalusr/chao/centos.qcow2"
     frontend-id = "38"
     online = "1"
     removable = "0"
     bootable = "1"
     state = "1"
     dev = "xvda"
     type = "qdisk"
     mode = "w"
     device-type = "disk"
     discard-enable = "1"
   console = ""
    0 = ""
     frontend = "/local/domain/38/console"
     backend = "/local/domain/0/backend/console/38/0"
     frontend-id = "38"
     online = "1"
     state = "1"
     protocol = "vt100"
   vkbd = ""
    0 = ""
     frontend = "/local/domain/38/device/vkbd/0"
     backend = "/local/domain/0/backend/vkbd/38/0"
     frontend-id = "38"
     online = "1"
     state = "1"
     backend-type = "qemu"
   vif = ""
    0 = ""
     frontend = "/local/domain/38/device/vif/0"
     backend = "/local/domain/0/backend/vif/38/0"
     frontend-id = "38"
     online = "1"
     state = "1"
     script = "/etc/xen/scripts/vif-bridge"
     mac = "22:16:3e:00:9f:a7"
     bridge = "xenbr0"
     handle = "0"
     type = "vif_ioemu"
  type = "hvm"
  dm-version = "qemu_xen"

--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--r5Pyd7+fXNt84Ff3--

